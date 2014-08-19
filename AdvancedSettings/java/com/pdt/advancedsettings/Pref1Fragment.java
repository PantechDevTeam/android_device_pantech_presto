package com.pdt.advancedsettings;


import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;


public class Pref1Fragment extends PreferenceFragment implements SharedPreferences.OnSharedPreferenceChangeListener {

    private static final String FILE_GAIN = "/proc/a2020_gain";
    public static final String KEY_INCALL_GAIN = "pref_ear_gain";
    public Pref1Fragment() {

    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);


        addPreferencesFromResource(R.xml.preference);



    }

    @Override
    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {

        if (key.equals(KEY_INCALL_GAIN)) {
            boolean enabled = sharedPreferences.getBoolean(KEY_INCALL_GAIN, true);

        if (enabled)
            Utils.writeValue(FILE_GAIN, "0 4");
        else
            Utils.writeValue(FILE_GAIN, "0 248");


        }

    }



    @Override
    public void onResume() {
        super.onResume();
        getPreferenceManager().getSharedPreferences().registerOnSharedPreferenceChangeListener(this);
    }

    @Override
    public void onPause() {
        getPreferenceManager().getSharedPreferences().unregisterOnSharedPreferenceChangeListener(this);
        super.onPause();
    }

    public static boolean isSupported() {
        return Utils.fileExists(FILE_GAIN);
    }



    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        boolean enabled = sharedPrefs.getBoolean(KEY_INCALL_GAIN, false);
        if(enabled)
            Utils.writeValue(FILE_GAIN, "0 4");  // +8db
        else
            Utils.writeValue(FILE_GAIN, "0 248");// -8db
    }

}
