package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;
import java.io.File;

public class BacklightDisable implements OnPreferenceChangeListener {

    private static final String FILE = "/sys/class/leds/keyboard-backlight/max_brightness";

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    /**
     * Restore button backlight setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        boolean enabled = sharedPrefs.getBoolean(DeviceSettings.KEY_BACKLIGHTDISABLE, false);
        if(enabled) {
            Utils.writeValue(FILE, "0");
        }
        else {
            Utils.writeValue(FILE, "3");
        }
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Boolean enabled = (Boolean) newValue;
        if(enabled) {
            Utils.writeValue(FILE, "0");
        }
        else {
            Utils.writeValue(FILE, "3");
        }
        return true;
    }

}
