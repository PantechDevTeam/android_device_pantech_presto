package com.cyanogenmod.settings.device;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.TwoStatePreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;

public class DeviceSettings extends PreferenceActivity  {

    public static final String KEY_INCALL_GAIN = "incall_gain";
    public static final String KEY_BACKLIGHTDISABLE = "backlight_disable";
    public static final String KEY_SDCARD_CACHE = "sdcard_cache";

    private TwoStatePreference mBacklightDisable;
    private TwoStatePreference mIncallGain;
    private ListPreference mSDCardCache;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        mIncallGain = (TwoStatePreference) findPreference(KEY_INCALL_GAIN);
        mIncallGain.setEnabled(IncallGain.isSupported());
        mIncallGain.setOnPreferenceChangeListener(new IncallGain());

        mBacklightDisable = (TwoStatePreference) findPreference(KEY_BACKLIGHTDISABLE);
        mBacklightDisable.setEnabled(BacklightDisable.isSupported());
        mBacklightDisable.setOnPreferenceChangeListener(new BacklightDisable());

        mSDCardCache = (ListPreference) findPreference(KEY_SDCARD_CACHE);
        mSDCardCache.setEnabled(SDCardCache.isSupported());
        mSDCardCache.setOnPreferenceChangeListener(new SDCardCache());

    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

}
