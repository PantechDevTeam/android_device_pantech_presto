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

# Frameworks base fixes
#FRAMEWORKS_BASE_SUBDIRS += ../../$(LOCAL_PATH)/frameworks/

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Recovery
TARGET_RECOVERY_FSTAB = device/pantech/presto/fstab.qcom

#----------------------------------------------------------------------

LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#----------------------------------------------------------------------

# Bluetooth firmware BCM
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/system/bin/BCM43291A0_003.001.013.0141.0194.hcd:system/bin/BCM43291A0_003.001.013.0141.0194.hcd

# Bins
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/bin/mpdecision:system/bin/mpdecision
    $(LOCAL_PATH)/prebuilt/system/bin/qrngd:system/bin/qrngd

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/pantech_earjack.idc:system/usr/idc/pantech_earjack.idc \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/qt602240_ts_input.idc:system/usr/idc/qt602240_ts_input.idc

# Keyboardy
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/system/usr/keylayout/tki_input.kl:system/usr/keylayout/tki_input.kl

# Media configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Permissions
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.presto.usb.rc:root/init.presto.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.presto.rc:root/ueventd.rc

# Recovery
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery.fstab:root/recovery.fstab

#----------------------------------------------------------------------

# Audio
#PRODUCT_PACKAGES += audio.primary.msm8660
PRODUCT_PACKAGES += audio.primary.MSM8660_SURF
# Camera
#PRODUCT_PACKAGES += camera.presto

# FM Radio
#PRODUCT_PACKAGES += FmRadioReceiver

# Presto Settings
PRODUCT_PACKAGES += AdvancedSettings

# Ramdisk
PRODUCT_PACKAGES += \
    init.presto.rc \
    init.qcom.baseband.sh

# Sky_touch
PRODUCT_PACKAGES += libsky_touch

# Torch
PRODUCT_PACKAGES += \
    Apollo \
    Torch

# USB
PRODUCT_PACKAGES += com.android.future.usb.accessory

# Wallpapers
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam

# wifi/bt mac helper
PRODUCT_PACKAGES += \
    hwaddrs \
    liblog

#----------------------------------------------------------------------

# Device properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/data/misc/bd_addr \
    ro.sf.lcd_density=240 \
    telephony.lteOnGsmDevice=1

#----------------------------------------------------------------------

# inherit pantech/msm8660-common
$(call inherit-product-if-exists, device/pantech/msm8660-common/msm8660-common.mk)

# Wifi
$(call inherit-product, device/pantech/presto/wifi/device-bcm.mk)

#  Also get non-open-source vendor/pantech/msm8x60-common
$(call inherit-product-if-exists, vendor/pantech/msm8x60-common/msm8x60-common-vendor.mk)
