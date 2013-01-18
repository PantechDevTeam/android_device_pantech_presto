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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

#----------------------------------------------------------------------
# Key mappings
#----------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE       := ffa-keypad.kl
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := prebuilt/system/usr/keylayout/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fluid-keypad.kl
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := prebuilt/system/usr/keylayout/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := 8660_handset.kl
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := prebuilt/system/usr/keylayout/$(LOCAL_MODULE)
LOCAL_MODULE_PATH   := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE        := cyttsp-i2c.kl
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := prebuilt/system/usr/keylayout/$(LOCAL_MODULE)
LOCAL_MODULE_PATH   := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_SRC_FILES     := prebuilt/system/usr/keychars/ffa-keypad_qwerty.kcm
LOCAL_MODULE_TAGS   := optional
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES     := prebuilt/system/usr/keychars/ffa-keypad_numeric.kcm
LOCAL_MODULE_TAGS   := optional
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES     := prebuilt/system/usr/keychars/fluid-keypad_qwerty.kcm
LOCAL_MODULE_TAGS   := optional
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES     := prebuilt/system/usr/keychars/fluid-keypad_numeric.kcm
LOCAL_MODULE_TAGS   := optional
include $(BUILD_KEY_CHAR_MAP)

#----------------------------------------------------------------------
# Configuration scripts
#----------------------------------------------------------------------

# Add for Pantech Presto
include $(CLEAR_VARS)
LOCAL_MODULE       := init.presto.target.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := rootdir/etc/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := vold.fstab
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := prebuilt/system/etc/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.target.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := rootdir/etc/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qcom.modem_links.sh
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := rootdir/etc/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qcom.mdm_links.sh
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := rootdir/etc/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := lpm.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := rootdir/etc/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qcom.lpm_boot.sh
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := rootdir/etc/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

#----------------------------------------------------------------------
# extra images
#----------------------------------------------------------------------

#-include device/pantech/qcom-common/generate_extra_images.mk
