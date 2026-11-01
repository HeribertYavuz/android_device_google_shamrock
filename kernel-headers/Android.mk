LOCAL_PATH := $(call my-dir)

# The Qualcomm CAF HAL makefiles (audio, display, media and IPA) list
# "generated_kernel_headers" in LOCAL_HEADER_LIBRARIES for the kernel UAPI
# headers.  AOSP 10 has no module of that name; LineageOS supplies it from
# vendor/lineage as a Soong module that runs "make headers_install".
#
# Define the make-side equivalent here.  The kernel Android.mk installs the
# headers into $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr, and
# LOCAL_EXPORT_C_INCLUDE_DEPS makes this module's export_includes file depend
# on the headers stamp file (not on the directory itself: the kernel build
# creates that directory for the initramfs), which in turn makes every
# consumer wait for headers_install before compiling.
SHAMROCK_KERNEL_HEADERS := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

include $(CLEAR_VARS)
LOCAL_MODULE := generated_kernel_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(SHAMROCK_KERNEL_HEADERS)/include
LOCAL_EXPORT_C_INCLUDE_DEPS := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/.headers_installed
LOCAL_MODULE_TAGS := optional
include $(BUILD_HEADER_LIBRARY)
