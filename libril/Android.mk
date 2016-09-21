# Copyright 2006 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    ril.cpp \
    ril_event.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy

# Disable usage of Clang Toolchain here
LOCAL_CLANG := false

LOCAL_CFLAGS :=

ifeq ($(TARGET_RIL_SUPPORT_SEEK),true)
    LOCAL_CFLAGS += -DRIL_SUPPORTS_SEEK
endif

ifeq ($(TARGET_RIL_VARIANT),legacy)
    LOCAL_CFLAGS += -DRIL_VARIANT_LEGACY
endif

LOCAL_MODULE := libril

LOCAL_CLANG := false

include $(BUILD_SHARED_LIBRARY)
