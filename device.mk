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

# Bluetooth firmware BCM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/bin/BCM43291A0_003.001.013.0141.0194.hcd:system/bin/BCM43291A0_003.001.013.0141.0194.hcd

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/pantech_earjack.idc:system/usr/idc/pantech_earjack.idc \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/qt602240_ts_input.idc:system/usr/idc/qt602240_ts_input.idc

# Keyboardy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/usr/keylayout/tki_input.kl:system/usr/keylayout/tki_input.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:root/recovery.fstab

# Wifi (bcmdhd)
#WIFI_BAND := 802_11_ABG
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

#----------------------------------------------------------------------

# FM Radio
PRODUCT_PACKAGES += FmRadioReceiver

# Ramdisk
PRODUCT_PACKAGES += \
    init.presto.rc \
    ueventd.rc

# Sky_touch
PRODUCT_PACKAGES += libsky_touch

# Radio fixes
FRAMEWORKS_BASE_SUBDIRS += ../../$(LOCAL_PATH)/ril/

#----------------------------------------------------------------------

# inherit pantech/msm8660-common
$(call inherit-product-if-exists, device/pantech/msm8660-common/msm8660-common.mk)
