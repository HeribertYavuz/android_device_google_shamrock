#
# Copyright (C) 2017 The LineageOS Project
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
SHAMROCK_DEVICE_PATH := $(LOCAL_PATH)

ifneq ($(filter shamrock,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

# The includes above reassign LOCAL_PATH to each subdirectory's own value
# (my-dir tracks MAKEFILE_LIST, which ends on the last included file). Restore
# the device directory: the rules below (wifi_symlinks in particular) use
# $(LOCAL_PATH)/Android.mk as their prerequisite, and without this they end up
# depending on whichever subdirectory was parsed last, so editing this file
# does not rebuild the symlinks.
LOCAL_PATH := $(SHAMROCK_DEVICE_PATH)

include $(CLEAR_VARS)

LOCAL_MODULE := wifi_symlinks
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_SUFFIX := -timestamp

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): ACTUAL_INI_FILE := /data/vendor/wifi/WCNSS_qcom_cfg.ini
$(LOCAL_BUILT_MODULE): WCNSS_INI_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_cfg.ini

$(LOCAL_BUILT_MODULE): ACTUAL_BIN_FILE := /mnt/vendor/persist/WCNSS_qcom_wlan_nv.bin
$(LOCAL_BUILT_MODULE): WCNSS_BIN_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

$(LOCAL_BUILT_MODULE): ACTUAL_DAT_FILE := /mnt/vendor/persist/WCNSS_wlan_dictionary.dat
$(LOCAL_BUILT_MODULE): WCNSS_DAT_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/prima/WCNSS_wlan_dictionary.dat

WCNSS_MAC_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/prima/wlan_mac.bin
$(WCNSS_MAC_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS MAC bin link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /mnt/vendor/persist/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_INI_SYMLINK) $(WCNSS_MAC_SYMLINK) \
				 $(WCNSS_BIN_SYMLINK) $(WCNSS_DAT_SYMLINK)

$(LOCAL_BUILT_MODULE): $(LOCAL_PATH)/Android.mk
$(LOCAL_BUILT_MODULE):
	$(hide) echo "Making symlinks for wifi"
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(dir $(WCNSS_INI_SYMLINK))
	$(hide) rm -rf $@
	$(hide) rm -rf $(WCNSS_INI_SYMLINK)
	$(hide) ln -sf $(ACTUAL_INI_FILE) $(WCNSS_INI_SYMLINK)
	$(hide) rm -rf $(WCNSS_BIN_SYMLINK)
	$(hide) ln -sf $(ACTUAL_BIN_FILE) $(WCNSS_BIN_SYMLINK)
	$(hide) rm -rf $(WCNSS_DAT_SYMLINK)
	$(hide) ln -sf $(ACTUAL_DAT_FILE) $(WCNSS_DAT_SYMLINK)
	$(hide) touch $@

#A/B builds require us to create the mount points at compile time.
#Just creating it for all cases since it does not hurt.
FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/firmware_mnt
DSP_MOUNT_POINT := $(TARGET_OUT_VENDOR)/dsp
ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MOUNT_POINT) \
				 $(DSP_MOUNT_POINT)
$(FIRMWARE_MOUNT_POINT):
	@echo "Creating $(FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware_mnt

$(DSP_MOUNT_POINT):
	@echo "Creating $(DSP_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/dsp

IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so

IMS_SYMLINKS := $(addprefix $(TARGET_OUT_APPS_PRIVILEGED)/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

RFS_MSM_ADSP_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/adsp/
$(RFS_MSM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM ADSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/lpass $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MSM_MPSS_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/mpss/
$(RFS_MSM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM MPSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/modem $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/mpss $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MSM_SLPI_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/slpi/
$(RFS_MSM_SLPI_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM SLPI folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/slpi $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/slpi $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MSM_ADSP_SYMLINKS) $(RFS_MSM_MPSS_SYMLINKS) $(RFS_MSM_SLPI_SYMLINKS)

# -----------------------------------------------------------------------------
# Kernel
# -----------------------------------------------------------------------------
# AOSP 10 has no generic kernel build integration. Build Image.gz-dtb here and
# install it to $(PRODUCT_OUT)/kernel, where the boot/recovery image rules
# expect it.
SHAMROCK_KERNEL_OUT := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ
SHAMROCK_KERNEL_CONFIG := $(SHAMROCK_KERNEL_OUT)/.config
SHAMROCK_KERNEL_DEFCONFIG := $(TARGET_KERNEL_SOURCE)/arch/arm64/configs/$(TARGET_KERNEL_CONFIG)

# Soong runs every build command with a restricted PATH (the "path
# interposer"), which rejects make and the host toolchain
# (build/make/Changes.md#PATH_Tools).  The kernel's host tools (gcc, perl, awk,
# bc, ...) have to come from the host, so put the standard host directories in
# front; Soong's interposer directory stays at the end of PATH.
SHAMROCK_HOST_PATH := /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# The prebuilt aarch64-linux-android-gcc is a Python wrapper that writes a
# deprecation notice to stderr. The kernel's scripts/gcc-wrapper.py forwards
# compiler stderr to stdout, which corrupts the libgcc path captured by
# arch/arm64/Makefile, so call the real 4.9 compiler directly.
# A command-line HOSTCFLAGS overrides the kernel's own definition, so repeat
# its flags: -std=gnu89 keeps modern host GCC (which defaults to C23, where
# e.g. the "constexpr" variable in scripts/unifdef.c is a keyword) compiling
# the old host tools, and -fcommon works around the -fno-common default of
# modern host GCC that breaks the in-tree dtc.
SHAMROCK_KERNEL_CROSS_COMPILE := $(abspath prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin)/$(TARGET_KERNEL_CROSS_COMPILE_PREFIX)
SHAMROCK_KERNEL_HOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89 -fcommon
SHAMROCK_KERNEL_MAKE := PATH=$(SHAMROCK_HOST_PATH):$$PATH $(MAKE) -C $(TARGET_KERNEL_SOURCE) O=$(abspath $(SHAMROCK_KERNEL_OUT)) ARCH=arm64 CROSS_COMPILE=$(SHAMROCK_KERNEL_CROSS_COMPILE) CC=$(SHAMROCK_KERNEL_CROSS_COMPILE)gcc-4.9.x HOSTCFLAGS="$(SHAMROCK_KERNEL_HOSTCFLAGS)"

# Android 10's kati rejects real file targets that depend on the PHONY FORCE
# target.  Follow the documented alternative (build/make/Changes.md): list the
# kernel sources as dependencies so a source change triggers a rebuild.
SHAMROCK_KERNEL_SRC_FILES := $(sort $(shell find -L $(TARGET_KERNEL_SOURCE) -type f -not -path '*/.git/*' 2>/dev/null))

# The kernel build creates $(SHAMROCK_KERNEL_OUT)/usr for the initramfs, so the
# UAPI headers cannot use that directory as their stamp: it exists even when
# headers_install has never run.
SHAMROCK_KERNEL_HEADERS_STAMP := $(SHAMROCK_KERNEL_OUT)/.headers_installed

$(SHAMROCK_KERNEL_CONFIG): $(SHAMROCK_KERNEL_DEFCONFIG)
	@mkdir -p $(SHAMROCK_KERNEL_OUT)
	$(SHAMROCK_KERNEL_MAKE) $(TARGET_KERNEL_CONFIG)

# UAPI headers for the CAF HALs (see kernel-headers/Android.mk).  Keep this
# before the image build and make the image depend on it so the two kernel
# make invocations never run concurrently in the same output directory.
$(SHAMROCK_KERNEL_HEADERS_STAMP): $(SHAMROCK_KERNEL_CONFIG) $(SHAMROCK_KERNEL_SRC_FILES)
	$(SHAMROCK_KERNEL_MAKE) headers_install
	@touch $@

$(PRODUCT_OUT)/kernel: $(SHAMROCK_KERNEL_CONFIG) $(SHAMROCK_KERNEL_HEADERS_STAMP) $(SHAMROCK_KERNEL_SRC_FILES)
	$(SHAMROCK_KERNEL_MAKE) $(BOARD_KERNEL_IMAGE_NAME)
	$(hide) cp -f $(SHAMROCK_KERNEL_OUT)/arch/arm64/boot/$(BOARD_KERNEL_IMAGE_NAME) $@

.PHONY: shamrock-kernel
shamrock-kernel: $(PRODUCT_OUT)/kernel

endif
