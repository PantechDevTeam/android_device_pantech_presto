package com.android.internal.telephony;

import static com.android.internal.telephony.RILConstants.*;

import android.content.Context;
import android.os.Message;
import android.os.Parcel;
import android.os.SystemProperties;
import android.os.SystemClock;
import android.os.AsyncResult;
import android.text.TextUtils;
import android.util.Log;
import com.android.internal.telephony.RILConstants;

import java.util.ArrayList;

/**
 * Custom RIL to handle unique behavior of Presto radio
 *
 * {@hide}
 */
public class PantechQualcommUiccRIL extends QualcommSharedRIL implements CommandsInterface {
    boolean RILJ_LOGV = true;
    boolean RILJ_LOGD = true;

    public static final int INVALID_SNR = 0x7fffffff;
    private boolean mSignalbarCount = SystemProperties.getBoolean("ro.telephony.sends_barcount", false);
    private Object mSMSLock = new Object();
    private boolean mIsSendingSMS = false;
    public static final long SEND_SMS_TIMEOUT_IN_MS = 30000;

    public PantechQualcommUiccRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription);
        mQANElements = 4;
    }

    @Override
    protected void
    processUnsolicited (Parcel p) {
        Object ret;
        int dataPosition = p.dataPosition();   // save off position within the Parcel
        int response     = p.readInt();

        switch(response) {
            case RIL_UNSOL_NITZ_TIME_RECEIVED:
                handleNitzTimeReceived(p);
                return;
            case 1038: ret = responseVoid(p); break; // RIL_UNSOL_DATA_NETWORK_STATE_CHANGED

            default:
                // Rewind the Parcel
                p.setDataPosition(dataPosition);

                // Forward responses that we are not overriding to the super class
                super.processUnsolicited(p);
                return;
        }

        switch(response) {
            case 1038: // RIL_UNSOL_DATA_NETWORK_STATE_CHANGED
                if (RILJ_LOGD) unsljLog(response);

                // Notifying on voice state change since it just causes a
                // GsmServiceStateTracker::pollState() like CAF RIL does.
                mVoiceNetworkStateRegistrants
                    .notifyRegistrants(new AsyncResult(null, null, null));
            break;
        }
    }

    protected void
    handleNitzTimeReceived(Parcel p) {
        String nitz = (String)responseString(p);
        if (RILJ_LOGD) unsljLogRet(RIL_UNSOL_NITZ_TIME_RECEIVED, nitz);

        // has bonus long containing milliseconds since boot that the NITZ
        // time was received
        long nitzReceiveTime = p.readLong();

        Object[] result = new Object[2];

        String fixedNitz = nitz;
        String[] nitzParts = nitz.split(",");
        if (nitzParts.length == 4) {
            // 0=date, 1=time+zone, 2=dst, 3=garbage that confuses GsmServiceStateTracker (so remove it)
            fixedNitz = nitzParts[0]+","+nitzParts[1]+","+nitzParts[2]+",";
        }

        result[0] = fixedNitz;
        result[1] = Long.valueOf(nitzReceiveTime);

        if (mNITZTimeRegistrant != null) {

            mNITZTimeRegistrant
                .notifyRegistrant(new AsyncResult (null, result, null));
        } else {
            // in case NITZ time registrant isnt registered yet
            mLastNITZTimeInfo = result;
        }
    }

    @Override
    public void
    setNetworkSelectionModeManual(String operatorNumeric, Message response) {
        RILRequest rr
                = RILRequest.obtain(RIL_REQUEST_SET_NETWORK_SELECTION_MANUAL,
                                    response);

        if (RILJ_LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest)
                    + " " + operatorNumeric);

        rr.mp.writeString(operatorNumeric);

        send(rr);
    }

    @Override
    protected Object
    responseIccCardStatus(Parcel p) {
        IccCardApplication ca;

        IccCardStatus status = new IccCardStatus();
        status.setCardState(p.readInt());
        status.setUniversalPinState(p.readInt());
        status.setGsmUmtsSubscriptionAppIndex(p.readInt());
        status.setCdmaSubscriptionAppIndex(p.readInt() );

        status.setImsSubscriptionAppIndex(p.readInt());

        int numApplications = p.readInt();

        // limit to maximum allowed applications
        if (numApplications > IccCardStatus.CARD_MAX_APPS) {
            numApplications = IccCardStatus.CARD_MAX_APPS;
        }
        status.setNumApplications(numApplications);

        for (int i = 0 ; i < numApplications ; i++) {
            ca = new IccCardApplication();
            ca.app_type       = ca.AppTypeFromRILInt(p.readInt());
            ca.app_state      = ca.AppStateFromRILInt(p.readInt());
            ca.perso_substate = ca.PersoSubstateFromRILInt(p.readInt());
            if ((ca.app_state == IccCardApplication.AppState.APPSTATE_SUBSCRIPTION_PERSO) &&
                ((ca.perso_substate == IccCardApplication.PersoSubState.PERSOSUBSTATE_READY) ||
                (ca.perso_substate == IccCardApplication.PersoSubState.PERSOSUBSTATE_UNKNOWN))) {
                // ridiculous hack for network SIM unlock pin
                ca.app_state = IccCardApplication.AppState.APPSTATE_UNKNOWN;
                Log.d(LOG_TAG, "ca.app_state == AppState.APPSTATE_SUBSCRIPTION_PERSO");
                Log.d(LOG_TAG, "ca.perso_substate == PersoSubState.PERSOSUBSTATE_READY");
            }
            ca.aid            = p.readString();
            ca.app_label      = p.readString();
            ca.pin1_replaced  = p.readInt();
            ca.pin1           = ca.PinStateFromRILInt(p.readInt());
            ca.pin2           = ca.PinStateFromRILInt(p.readInt());

            p.readInt(); //remaining_count_pin1   - pin1_num_retries
            p.readInt(); //remaining_count_puk1   - puk1_num_retries
            p.readInt(); //remaining_count_pin2   - pin2_num_retries
            p.readInt(); //remaining_count_puk2   - puk2_num_retries
            p.readInt(); //                       - perso_unblock_retries
            status.addApplication(ca);
        }
        int appIndex = -1;
        if (mPhoneType == RILConstants.CDMA_PHONE) {
            appIndex = status.getCdmaSubscriptionAppIndex();
            Log.d(LOG_TAG, "This is a CDMA PHONE " + appIndex);
        } else {
            appIndex = status.getGsmUmtsSubscriptionAppIndex();
            Log.d(LOG_TAG, "This is a GSM PHONE " + appIndex);
        }

        if (numApplications > 0) {
            IccCardApplication application = status.getApplication(appIndex);
            mAid = application.aid;
            mUSIM = application.app_type
                      == IccCardApplication.AppType.APPTYPE_USIM;
            mSetPreferredNetworkType = mPreferredNetworkType;

            if (TextUtils.isEmpty(mAid))
               mAid = "";
            Log.d(LOG_TAG, "mAid " + mAid + " mUSIM=" + mUSIM + " mSetPreferredNetworkType=" + mSetPreferredNetworkType);
        }

        return status;
    }

    @Override
    protected Object
    responseSignalStrength(Parcel p) {
        int numInts = 12;
        int response[];

        // This is a mashup of algorithms used in
        // LGEQualcommUiccRIL.java and SamsungQualcommUiccRIL.java

        // Get raw data
        response = new int[numInts];
        for (int i = 0 ; i < numInts ; i++) {
            response[i] = p.readInt();
        }
        Log.d(LOG_TAG, "BEFORE respons0 = " + response[0] + " 1= " + response[1] + " 2= " + response[2] + " 3= " + response[3] + " 4= " + response[4] + " 5= " + response[5] + " 6= " + response[6] + " 7= " + response[7] + " 8= " + response[8] + " 9= " + response[9] + " 10= " + response[10] + " 11= " + response[11]);
            // response[8] LTE not enabled? then 8-11 = -1 and after that gsm signal strength will be used
	    // response from 0 to 13:
	    //mGsmSignalStrength;
	    //mGwlAntLevel;
	    //mGsmBitErrorRate;
	    //mCdmaDbm;
	    //mCdmaEcio;
	    //mEvdoDbm;
	    //mEvdoEcio;
	    //mEvdoSnr;
	    //mLteSignalStrength;
	    //mLteRsrp;
	    //mLteRsrq;
	    //mLteRssnr;
	    //mLteCqi;
	    //isGsm = true;

	    if (response[8] == 99) {
	     response[8] = -1;
	     response[9] = -1;
	     response[10] = -1;
	     response[11] = -1;
	    }
        Log.d(LOG_TAG, "AFTER respons0 = " + response[0] + " 1= " + response[1] + " 2= " + response[2] + " 3= " + response[3] + " 4= " + response[4] + " 5= " + response[5] + " 6= " + response[6] + " 7= " + response[7] + " 8= " + response[8] + " 9= " + response[9] + " 10= " + response[10] + " 11= " + response[11]);

        return response;
    }
}
