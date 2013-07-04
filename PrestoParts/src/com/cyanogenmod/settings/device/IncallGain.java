package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class IncallGain implements OnPreferenceChangeListener {

    private static final String FILE = "/proc/a2020_gain";

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    /**
     * Restore fast charge setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        boolean enabled = sharedPrefs.getBoolean(DeviceSettings.KEY_INCALL_GAIN, false);
        if(enabled)
            Utils.writeValue(FILE, "0 4");  // +8db
        else
            Utils.writeValue(FILE, "0 248");// -8db
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Boolean enabled = (Boolean) newValue;
        if(enabled)
            Utils.writeValue(FILE, "0 4");
        else
            Utils.writeValue(FILE, "0 248");
        return true;
    }

}
