#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#----------------------------------------------------------------------

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/pantech/presto/presto-vendor.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

#----------------------------------------------------------------------

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#----------------------------------------------------------------------

LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#----------------------------------------------------------------------

# Audio policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/audio_policy.conf:system/etc/audio_policy.conf

# BT firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/bin/BCM43291A0_003.001.013.0141.0194.hcd:system/bin/BCM43291A0_003.001.013.0141.0194.hcd \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Configuration scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:root/recovery.fstab

# Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
    $(LOCAL_PATH)/prebuilt/system/etc/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
    $(LOCAL_PATH)/prebuilt/system/etc/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
    $(LOCAL_PATH)/prebuilt/system/etc/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
    $(LOCAL_PATH)/prebuilt/system/etc/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/pantech_earjack.idc:system/usr/idc/pantech_earjack.idc \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/qt602240_ts_input.idc:system/usr/idc/qt602240_ts_input.idc

# Keyboardy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/usr/keylayout/tki_input.kl:system/usr/keylayout/tki_input.kl

# Media configuration
PRODUCT_COPY_FILES += \
    device/pantech/presto/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/pantech/presto/media/media_codecs.xml:system/etc/media_codecs.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Thermal configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/thermald.conf:system/etc/thermald.conf

# Ueventd
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/ueventd.rc:root/ueventd.rc

# Wifi (bcmdhd)
#WIFI_BAND := 802_11_ABG
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

#----------------------------------------------------------------------

# fstab.qcom
PRODUCT_PACKAGES += fstab.qcom

# Init presto
PRODUCT_PACKAGES += init.presto.rc

# Lpm
PRODUCT_PACKAGES += \
    lpm.rc \
    init.qcom.lpm_boot.sh

# Sensors
PRODUCT_PACKAGES += sensors.msm8660

# Sky_touch
PRODUCT_PACKAGES += libsky_touch

#----------------------------------------------------------------------

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Common build properties
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    debug.composition.type=dyn \
    debug.egl.hw=1 \
    debug.enabletr=true \
    debug.mdpcomp.maxlayer=0 \
    debug.mdpcomp.logs=0 \
    debug.sf.hw=1 \
    dev.pm.dyn_samplingrate=1 \
    ro.sf.lcd_density=240

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

#----------------------------------------------------------------------

# inherit device/pantech/qcom-common/qcom-common.mk
$(call inherit-product-if-exists, device/pantech/qcom-common/qcom-common.mk)

