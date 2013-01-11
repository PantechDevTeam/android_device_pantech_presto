#----------------------------------------------------------------------
# import from CAF device/qcom/common/common.mk
#----------------------------------------------------------------------

# Below projects/packages with LOCAL_MODULEs will be used by
# PRODUCT_PACKAGES to build LOCAL_MODULEs that are tagged with
# optional tag, which will not be available on target unless
# explicitly list here. Where project corresponds to the vars here
# in CAPs.

#ANGLE
PRODUCT_PACKAGES += libangle

#AUDIO_HARDWARE
PRODUCT_PACKAGES += \
    audio.primary.msm8660 \
    audio.a2dp.default \
    audio.usb.default

#AUDIO_POLICY
PRODUCT_PACKAGES += \
    audio_policy.msm8660 \
    audio_policy.conf

#AMPLOADER
PRODUCT_PACKAGES += amploader

#APPS
PRODUCT_PACKAGES += \
    QualcommSoftAP \
    TSCalibration

#BSON
PRODUCT_PACKAGES += libbson

#BT
PRODUCT_PACKAGES += \
    javax.btobex \
    libattrib_static \
    hcidump.sh

#C2DColorConvert
PRODUCT_PACKAGES += libc2dcolorconvert

#CIMAX
PRODUCT_PACKAGES += libcimax_spi

#CONNECTIVITY
PRODUCT_PACKAGES += \
    cnd \
    librefcne

#CURL
PRODUCT_PACKAGES += \
    libcurl \
    curl

#E2FSPROGS
PRODUCT_PACKAGES += e2fsck

#GPS
PRODUCT_PACKAGES += \
    gps.default \
    gps.mahimahi \
    libloc_adapter \
    libgps.utils \
    libloc_eng \
    libloc_api_v02

#HDMID
PRODUCT_PACKAGES += hdmid

#HOSTAPD
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    nt_password_hash \
    hlr_auc_gw \
    test-milenage \
    hostapd.conf \
    hostapd_default.conf \
    hostapd.deny \
    hostapd.accept

#I420COLORCONVERT
PRODUCT_PACKAGES += libI420colorconvert

#INIT
PRODUCT_PACKAGES += \
    init.qcom.composition_type.sh \
    init.target.8x25.sh \
    init.qcom.mdm_links.sh \
    init.qcom.modem_links.sh \
    init.qcom.thermal_conf.sh \
    init.qcom.sensor.sh \
    init.target.rc \
    init.qcom.bt.sh \
    init.qcom.coex.sh \
    init.qcom.fm.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.rc \
    init.qcom.sdio.sh \
    init.qcom.sh \
    init.qcom.class_core.sh \
    init.qcom.class_main.sh \
    init.qcom.wifi.sh \
    vold.fstab \
    init.qcom.ril.path.sh \
    init.qcom.ril.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    usf_post_boot.sh \
    init.qcom.efs.sync.sh \
    ueventd.qcom.rc \
    init.ath3k.bt.sh \
    init.qcom.audio.sh

#IPROUTE2
PRODUCT_PACKAGES += \
    ip \
    libiprouteutil

#IPTABLES
PRODUCT_PACKAGES += \
    libiptc \
    libext \
    iptables

#KERNEL_TESTS
PRODUCT_PACKAGES += mm-audio-native-test

#KEYPAD
PRODUCT_PACKAGES += \
    ffa-keypad_qwerty.kcm \
    ffa-keypad_numeric.kcm \
    fluid-keypad_qwerty.kcm \
    fluid-keypad_numeric.kcm \
    8660_handset.kl \
    cyttsp-i2c.kl \
    ffa-keypad.kl \
    fluid-keypad.kl

#KS
PRODUCT_PACKAGES += \
    ks \
    qcks \
    efsks

#LIBCAMERA
PRODUCT_PACKAGES += \
    camera.msm8660 \
    libcamera \
    libmmcamera_interface \
    libmmcamera_interface2 \
    libmmjpeg_interface \
    mm-qcamera-app

#LIBCOPYBITP
PRODUCT_PACKAGES += copybit.msm8660

#LIBGESTURES
PRODUCT_PACKAGES += libgestures

#LIBGRALLOC
PRODUCT_PACKAGES += \
    gralloc.default \
    gralloc.msm8660 \
    libmemalloc

#LIBLIGHTS
PRODUCT_PACKAGES += lights.msm8660

#LIBHWCOMPOSER
PRODUCT_PACKAGES += hwcomposer.msm8660

#LIBAUDIOPARAM -- Exposing AudioParameter as dynamic library for SRS TruMedia to work
PRODUCT_PACKAGES += libaudioparameter

#LIBOPENCOREHW
PRODUCT_PACKAGES += libopencorehw

#LIBOVERLAY
PRODUCT_PACKAGES += \
    liboverlay \
    overlay.default

#LIBGENLOCK
PRODUCT_PACKAGES += libgenlock

#LIBPERFLOCK
PRODUCT_PACKAGES += org.codeaurora.Performance

#LIBQCOMUI
#PRODUCT_PACKAGES += libQcomUI

#LIBQDUTILS
PRODUCT_PACKAGES += libqdutils

#LIBQDMETADATA
PRODUCT_PACKAGES += libqdMetaData

#LIBPOWER
PRODUCT_PACKAGES += power.qcom

#LOC_API
PRODUCT_PACKAGES += libloc_api-rpc-qc

#MEDIA_PROFILES
PRODUCT_PACKAGES += media_profiles.xml

#MM_AUDIO
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxMp3Dec \
    libOmxQcelp13Enc \
    libOmxAc3HwDec \
    mm-adec-omxaac-test \
    mm-adec-omxmp3-test \
    mm-aenc-omxaac-test \
    mm-aenc-omxamr-test \
    mm-aenc-omxevrc-test \
    mm-aenc-omxqcelp13-test \
    sw-adec-omxaac-test \
    sw-adec-omxamr-test \
    sw-adec-omxamrwb-test \
    sw-adec-omxmp3-test

#MM_CORE
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore

#MM_VIDEO
PRODUCT_PACKAGES += \
    ast-mm-vdec-omx-test \
    libdivxdrmdecrypt \
    liblasic \
    libOmxVdec \
    libOmxVenc \
    libOmxVidEnc \
    mm-vdec-omx-property-mgr \
    mm-vdec-omx-test \
    mm-venc-omx-test \
    mm-venc-omx-test720p \
    mm-video-driver-test \
    mm-video-encdrv-test

#OPENCORE
PRODUCT_PACKAGES += \
    libomx_aacdec_sharedlibrary \
    libomx_amrdec_sharedlibrary \
    libomx_amrenc_sharedlibrary \
    libomx_avcdec_sharedlibrary \
    libomx_m4vdec_sharedlibrary \
    libomx_mp3dec_sharedlibrary \
    libomx_sharedlibrary \
    libopencore_author \
    libopencore_common \
    libopencore_download \
    libopencore_downloadreg \
    libopencore_mp4local \
    libopencore_mp4localreg \
    libopencore_net_support \
    libopencore_player \
    libopencore_rtsp \
    libopencore_rtspreg \
    libpvdecoder_gsmamr \
    libpvplayer_engine \
    libpvamrwbdecoder \
    libpvauthorengine \
    libomx_amr_component_lib \
    pvplayer \
    pvplayer_engine_test

#PPP
PRODUCT_PACKAGES += ip-up-vpn

#PVOMX
PRODUCT_PACKAGES += \
    libqcomm_omx \
    01_qcomm_omx

#RF4CE
PRODUCT_PACKAGES += \
    RemoTI_RNP.cfg \
    rf4ce

#SOFTAP
PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg \
    libqsap_sdk

#STK
PRODUCT_PACKAGES += Stk

#STM LOG
PRODUCT_PACKAGES += libstm-log

#TSLIB_EXTERNAL
PRODUCT_PACKAGES += \
    corgi \
    dejitter \
    inputraw \
    linear \
    variance \
    pthres \
    libtslib \
    tsprint \
    tstest \
    tsutils \
    tscalib \
    ts

#QRGND
PRODUCT_PACKAGES += qrngd

#WPA
PRODUCT_PACKAGES += wpa_supplicant.conf

#ZLIB
PRODUCT_PACKAGES += \
    gzip \
    minigzip \
    libunz

#VT_JNI
#PRODUCT_PACKAGES += libvt_jni

