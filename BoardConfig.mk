#
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

# inherit from pantech qcom-common
-include device/pantech/qcom-common/BoardConfigCommon.mk

# Headers path
TARGET_SPECIFIC_HEADER_PATH := device/pantech/presto/include

# Assert
TARGET_OTA_ASSERT_DEVICE := PantechP9070,presto

#----------------------------------------------------------------------

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
#TARGET_CUSTOM_BLUEDROID := ../../../device/pantech/presto/bluetooth/bluetooth.c
TARGET_NEEDS_BLUETOOTH_INIT_DELAY := true

# Board info
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := presto

# Camera
BOARD_PANTECH_CAMERA := true
BOARD_CAMERA_USE_MM_HEAP := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
TARGET_DISABLE_ARM_PIE := true

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# File system
BOARD_BOOTIMAGE_PARTITION_SIZE          := 0x00700000
BOARD_RECOVERYIMAGE_PARTITION_SIZE      := 0x00700000
BOARD_SYSTEMIMAGE_PARTITION_SIZE        := 617193472    # 614400×1024   (mmcblk0p13)
BOARD_USERDATAIMAGE_PARTITION_SIZE      := 1073741824   # 1048576×1024  (mmcblk0p14)
BOARD_PERSISTIMAGE_PARTITION_SIZE       := 8388608      # 8192×1024     (mmcblk0p15)
BOARD_CACHEIMAGE_PARTITION_SIZE         := 178257920    # 174080×1024   (mmcblk0p16)
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE    := 268435456    # 262144×1024   (mmcblk0p17)
BOARD_FLASH_BLOCK_SIZE                  := 131072       # (BOARD_KERNEL_PAGESIZE * 64)

# Flags
COMMON_GLOBAL_CFLAGS += -DWITH_QCOM_LPA
COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED
COMMON_GLOBAL_CFLAGS += -DQCOM_VOIP_ENABLED
COMMON_GLOBAL_CFLAGS += -DLEGACY_QCOM_VOICE

# FM radio
BOARD_HAVE_FM_RADIO := true
BOARD_HAVE_QCOM_FM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm8660
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# HDMI
TARGET_QCOM_HDMI_OUT:= false

# Kernel
BOARD_KERNEL_BASE := 0x40200000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom loglevel=0 no_console_suspend=1
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FORCE_RAMDISK_ADDRESS := 0x41500000
TARGET_KERNEL_CONFIG := cyanogenmod_presto_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
TARGET_KERNEL_SOURCE := kernel/pantech/p9070
TARGET_PREBUILT_KERNEL := device/pantech/presto/prebuilt/kernel/kernel

# Overlay
TARGET_USES_OVERLAY := true

# Platform
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# QCOM hardware
BOARD_USES_QCOM_LIBS := true

# Radio info
TARGET_NO_RADIOIMAGE := true

# Recovery
#TARGET_RECOVERY_INITRC := device/pantech/presto/recovery/init.rc
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#BOARD_USES_RECOVERY_CHARGEMODE := false
#BOARD_CUSTOM_GRAPHICS := ../../../device/pantech/presto/recovery/graphics.c

# Scorpion optimizations
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

# SD Card info
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p1

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
-include device/pantech/presto/wifi.mk
