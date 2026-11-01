# 
# Copyright (C) 2018 The LineageOS Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

$(call inherit-product, vendor/google/msm8952-common/msm8952-common-vendor.mk)
$(call inherit-product, vendor/google/shamrock/shamrock-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#PRODUCT_ENFORCE_RRO_TARGETS := \
#    framework-res

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 1920
TARGET_BOOTANIMATION_HALF_RES := true

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=4m \
    dalvik.vm.heapmaxfree=8m

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# ANT
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio
	
# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@4.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@4.0-impl \
    audio.a2dp.default \
    audio.primary.msm8952 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle \
    tinymix

# Audio Configurations (Shamrock)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_extcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_extcodec.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Audio Configurations (CAF)
PRODUCT_COPY_FILES += \
	$(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
	$(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
	$(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
	$(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	$(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(TOPDIR)frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(TOPDIR)frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Camera
# The legacy Qualcomm camera HAL (vendor/lib/hw/camera.msm8952.so) and the
# mm-qcamera daemon ship as prebuilt blobs.  The camera provider service and
# the HIDL passthrough implementations are built from source: AOSP 10 still
# ships the legacy provider, which loads the camera HAL module through
# libhardware, and the Pie-era blobs of these modules cannot be installed
# without colliding with the module install rules.  Snap is a LineageOS app
# and is not part of AOSP.
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    camera.device@3.2-impl

# Configstore
# Android 10 has no configstore default service in hardware/interfaces; the
# framework treats configstore as optional, so nothing is added here.

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    copybit.msm8952 \
    gralloc.msm8952 \
    hwcomposer.msm8952 \
    memtrack.msm8952 \
    libdisplayconfig \
    liboverlay \
    libqdMetaData.system \
    libtinyxml

# display-caf/msm8952/Android.mk lists libgenlock among its display-hals, but
# that repository contains no libgenlock sources and none of the msm8952
# display components use it, so there is no module to build.

# The vendor display config libraries (vendor.display.config@1.0/1.1) are
# installed by the msm8952 vendor blob makefiles; there is no source module for
# them in this tree.

# WfdCommon, QPerformance and UxPerformance are prebuilt vendor jars installed
# from the blobs. Android 10 requires every PRODUCT_BOOT_JARS entry to be a
# Soong java module with a dex output, so they can no longer be listed here.

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.2-service.clearkey

# Ebtables
# external/ebtables is not part of AOSP 10, so the ebtables userspace tools
# cannot be built here.

# FM
# PRODUCT_PACKAGES += \
#     FMRadio \
#     libfmjni

# Gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# GPS
# The GNSS HAL implementation is the QTI one built from
# device/google/shamrock/gps; the AOSP passthrough service loads it through
# HIDL_FETCH_IGnss.  gps.msm8952 was the Pie-era legacy HAL module and is not
# part of this vendor blob set.
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl-qti \
    android.hardware.gnss@1.0-service \
    libcurl \
    libgnss \
    libgnsspps

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/etc/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/gps/etc/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/gps/etc/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/gps/etc/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

# Healthd
PRODUCT_PACKAGES += \
    chargeonlymode
	
# Health HAL
# android.hardware.health@2.0-impl is a static library linked into the
# service; only the service itself is a product package.
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service

# HIDL
# Android 10 provides the HIDL runtime through Soong (libhidlbase,
# libhidltransport) and the VNDK snapshots.  The Pie-era
# android.hidl.base@1.0 / android.hidl.manager@1.0 make modules no longer
# exist and no module in this tree links against them.

# IPA Manager
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.shamrock

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Netutils
# netmgrd from the vendor blob set links android.system.net.netd@1.1.so (it
# links the 1.1 interface, not 1.0), so install both implementations.
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0 \
    android.system.net.netd@1.0 \
    android.system.net.netd@1.1 \
    libandroid_net

# OMX
# Only the components actually built from hardware/qcom/audio-caf and
# hardware/qcom/media-caf are listed. The remaining codec libraries
# (libOmxAacDec, libOmxEvrcDec, ...) ship as prebuilt blobs in vendor/, and
# libOmxVdecHevc/libOmxSwVencMpeg4 are only built for proprietary QCPATH builds.
# libOmxVidcCommon is a static library linked into libOmxVdec, so it is not a
# product package.
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw \
    libstagefright_soft_flacdec
	
# OTA / Google Parts
# Updates (LineageOS updater) and googleParts are not part of AOSP and have no
# source in this tree.

# Power
# The QTI power HAL (android.hardware.power@1.1-service-qti) is not available in
# this tree. Use the AOSP stub service so the HIDL interface exists; the QTI
# perf service (vendor.qti.hardware.perf@1.0-service) still comes from the blobs.
# The service is only a passthrough wrapper: it loads IPower through
# android.hardware.power@1.0-impl.so, so that library must be installed too.
# Without it every boot hangs in PowerManagerService.nativeInit and the
# system_server watchdog kills the system process after 60s.
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service \
    android.hardware.power@1.0-impl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# Properties
-include device/google/shamrock/prop.mk

# QMI
# libjson was a Pie-era blob dependency.  AOSP 10 has no such module and no
# module or vendor blob in this tree links against it.

# QTI performance jars (QPerformance/UxPerformance) are prebuilt vendor jars and
# cannot be PRODUCT_BOOT_JARS entries on Android 10; see the note above.

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.qcom.rc

# init.qcom.bt.sh is not present in this device tree; it is not built here.
PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    move_time_data.sh \
    move_wifi_data.sh

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# RIL
# telephony-ext and ims-ext-common are QTI components whose source is not part
# of this tree. The QTI telephony jars themselves are installed from the
# vendor blobs.  librmnetctl is built from
# vendor/qcom/opensource/dataservices (mapped in utils.mk); the vendor netmgrd
# and qti daemons link it.
#
# The QTI RIL library has a DT_NEEDED entry for
# android.hardware.secure_element@1.0.so even though this device has no eSE
# service.  Without the interface library, rild's dlopen() of
# /vendor/lib64/libril-qc-qmi-1.so fails and rild exits immediately, so the
# AOSP 10 interface library (hardware/interfaces/secure_element/1.0) has to be
# in the system image.
PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.0 \
    android.hardware.secure_element@1.0 \
    librmnetctl \
    libxml2

# Radio Configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/data/dsi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/data/netmgr_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/data/qmi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/qmi_config.xml

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# TextClassifier smart selection model files
# textclassifier.bundle1 is not part of the AOSP 10 source tree.

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# USB HAL
# Android 10 only provides android.hardware.usb@1.0-service (the Pie-era
# ".basic" variant no longer exists).
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# VNDK
# Android 10 installs VNDK libraries as part of the platform build.  The
# Pie-era vndk-sp prebuilt package in device/google/shamrock/vndk is gated off
# (SHAMROCK_LEGACY_VNDK) and is no longer produced by Soong.
	
# Thermal
# thermal.msm8952 (QTI thermal HAL) has no source in this tree; the AOSP
# thermal HAL and the thermal-engine configuration below are used instead.
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Whitelisted app
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/permissions/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml

# Wifi
# libQWiFiSoftApCfg and dhcpcd.conf have no modules in the AOSP 10 tree; the
# supplicant/hostapd overlays below are still installed.
# wpa_supplicant.conf comes from hardware/qcom/wlan/qcwcn/config (enabled by
# WPA_SUPPLICANT_VERSION := VER_0_8_X in BoardConfig.mk) and must be installed
# to /vendor/etc/wifi: the HIDL supplicant's addInterface() copies this
# template to /data/vendor/wifi/wpa/wpa_supplicant.conf and aborts the iface
# setup when neither it nor a legacy /data file exists.
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    libcld80211 \
    libqsap_sdk \
    libwpa_client \
    hostapd \
    wificond \
    wifi_symlinks \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/wifi/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/wifi/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# LD
# ld.config.oneteam.txt is a pre-O legacy linker config and is intentionally
# NOT installed on Android 10: the linker must pick up
# /system/etc/ld.config.vndk_lite.txt (ro.vndk.lite) to get the runtime APEX
# namespaces.  See the comment in rootdir/init.qcom.rc.

# Debug
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.sys.usb.config=adb \
    ro.secure=0 \
    ro.adb.secure=0

# Also put ro.adb.secure in prop.default, which init reads before adbd starts.
# With a hung framework there is no on-device authorization dialog to accept,
# so adbd must not require one.
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.adb.secure=0

# Graphics
# The QCOM EGL blobs live in /vendor/lib64/egl (libEGL_adreno.so).  Without
# this libEGL's driver lookup falls back to libEGL_msm8952.so, which does not
# exist, and every EGL user aborts with "couldn't find an OpenGL ES
# implementation": zygote64 dies in nativePreloadGraphicsDriver() during
# preload, and surfaceflinger (whose onrestart rule restarts zygote)
# crash-loops, so nothing ever boots.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.egl=adreno

# First API Level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

# The stock GM 5 Plus vendor partition is only 256 MiB (see BoardConfig.mk),
# so the ~114 MiB QTI camera blob stack is dropped from the vendor image.
# The filter lives in the vendor makefiles that define those copy entries
# (vendor/google/{shamrock,msm8952-common}/*-vendor.mk): inherit-product only
# records an @inherit: tag here, so a filter in this file never sees them.
# Camera is non-functional until the vendor partition is enlarged or these
# blobs are relocated; the system image has spare space.
