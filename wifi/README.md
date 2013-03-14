### Information
This patch adds TARGET_CUSTOM_WIFI which can be used to replace the
standard wifi.c with a custom implementation without breaking things
for devices that assume default functionality.
https://github.com/pandigital/android_hardware_libhardware_legacy/commit/ded39b2117380340dd92c04504cda863b31ca217

In ~/hardware/libhardware_legacy/wifi/Android.mk.

Find this line:

LOCAL_SRC_FILES += wifi/wifi.c

And replace by:

ifeq ($(TARGET_CUSTOM_WIFI),)
    LOCAL_SRC_FILES += wifi/wifi.c
else
    LOCAL_SRC_FILES += $(TARGET_CUSTOM_WIFI)
endif
