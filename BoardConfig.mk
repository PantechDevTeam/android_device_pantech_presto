# Copyright (C) 2012 The Android Open Source Project
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

USE_CAMERA_STUB := true

#----------------------------------------------------------------------

# inherit from the proprietary version
-include vendor/pantech/presto/BoardConfigVendor.mk

# Headers path
TARGET_SPECIFIC_HEADER_PATH := device/pantech/presto/include

# Assert
TARGET_OTA_ASSERT_DEVICE := PantechP9070,presto

#----------------------------------------------------------------------

# Architecture
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Audio
BOARD_USES_ALSA_AUDIO := false
BOARD_USES_AUDIO_LEGACY := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USE_QCOM_LPA := true
TARGET_PROVIDES_LIBAUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
TARGET_NEEDS_BLUETOOTH_INIT_DELAY := true

# Camera
BOARD_PANTECH_CAMERA := true
BOARD_CAMERA_USE_MM_HEAP := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
TARGET_DISABLE_ARM_PIE := true

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGER_RES := device/pantech/presto/prebuilt/root/res/images/charger

# Flags
COMMON_GLOBAL_CFLAGS += -DWITH_QCOM_LPA
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED
COMMON_GLOBAL_CFLAGS += -DQCOM_VOIP_ENABLED

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_FM_DEVICE := bcm4329
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm8660
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Graphics
BOARD_EGL_CFG := device/pantech/presto/prebuilt/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true

# HDMI
TARGET_QCOM_HDMI_OUT:= false

# liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHTS := true

# Platform
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true

# Scorpion optimizations
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

# SD Card info
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p1

# Target info
TARGET_USES_OVERLAY := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_USERIMAGES_USE_EXT4 := true

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# WebGL
ENABLE_WEBGL := true

# Webkit
TARGET_FORCE_CPU_UPLOAD := true

# Wifi
-include device/pantech/presto/wifi.mk

#----------------------------------------------------------------------

# use toolchain 4.4.3 for kernel compile
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3

# Define Prebuilt kernel locations
TARGET_PREBUILT_KERNEL := device/pantech/presto/prebuilt/kernel/kernel

# Built from source kernel
TARGET_KERNEL_CONFIG := cyanogenmod_presto_defconfig
TARGET_KERNEL_SOURCE := kernel/pantech/p9070

# Kernel info
BOARD_KERNEL_BASE := 0x40200000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom loglevel=0
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FORCE_RAMDISK_ADDRESS := 0x41500000

#----------------------------------------------------------------------

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00700000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00700000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# From /proc/partitions (each were multiplied by 1024)
BOARD_SYSTEMIMAGE_PARTITION_SIZE     := 617193472   #614400x1024
BOARD_USERDATAIMAGE_PARTITION_SIZE   := 1073741824  #1048576x1024
BOARD_PERSISTIMAGE_PARTITION_SIZE    := 8388608     #8192x1024
BOARD_CACHEIMAGE_PARTITION_SIZE      := 178257920   #174080x1024
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 268435456   #262144x1024

#----------------------------------------------------------------------

# Bootloader and recovery

TARGET_BOOTLOADER_BOARD_NAME := presto
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_qcom
#TARGET_RECOVERY_INITRC := device/pantech/presto/recovery/init.rc

#BOARD_CUSTOM_GRAPHICS := ../../../device/pantech/presto/recovery/graphics.c
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USES_MMCUTILS := true
#BOARD_USES_RECOVERY_CHARGEMODE := false

