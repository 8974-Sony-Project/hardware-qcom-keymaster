LOCAL_PATH := $(call my-dir)

ifneq ($(filter msm8960 msm8916 msm8974 msm8084 msm8994 msm8996,$(TARGET_BOARD_PLATFORM)),)

keymaster-def := -fvisibility=hidden -Wall
ifeq ($(TARGET_BOARD_PLATFORM),msm8084)
keymaster-def += -D_ION_HEAP_MASK_COMPATIBILITY_WA
endif

include $(CLEAR_VARS)

LOCAL_MODULE := keystore.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SRC_FILES := keymaster_qcom.cpp

LOCAL_C_INCLUDES := $(TARGET_OUT_HEADERS)/common/inc \
                    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

LOCAL_CFLAGS := $(keymaster-def)

LOCAL_SHARED_LIBRARIES := \
        libcrypto \
        liblog \
        libc \
        libdl

LOCAL_ADDITIONAL_DEPENDENCIES := \
    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr \
    $(LOCAL_PATH)/Android.mk

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

endif # TARGET_BOARD_PLATFORM
