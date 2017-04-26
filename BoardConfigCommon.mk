# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

COMMON_FOLDER := device/amazon/omap4-common

OMAP_ENHANCEMENT_HWC_EXTENDED_API := true

# inherit from the proprietary versions
-include vendor/ti/omap4/BoardConfigVendor.mk
-include vendor/widevine/arm-generic/BoardConfigVendor.mk

# inherit from omap4
-include hardware/ti/omap4/BoardConfigCommon.mk

# set to allow building from omap4-common
BOARD_VENDOR := amazon

TARGET_SPECIFIC_HEADER_PATH := $(COMMON_FOLDER)/include

# Architecture
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_NEON_SUPPORTS_UNALIGNED_ACCESS := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
ifeq ($(OMAP_ENHANCEMENT_DOLBY_DDPDEC51_MULTICHANNEL), true)
    BOARD_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT_DOLBY_DDPDEC51_MULTICHANNEL
endif
AUDIO_FEATURE_DEEP_BUFFER_RINGTONE := true
USE_ITTIAM_AAC := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_FOLDER)/bluetooth

# Clang
USE_CLANG_PLATFORM_BUILD := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_VOLD_MAX_PARTITIONS := 32
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_OVERLAY := true
TARGET_USES_ION := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
TARGET_HAS_WAITFORVSYNC := true
TARGET_USES_OPENGLES_FOR_SCREEN_CAPTURE := true

# HDMI
BOARD_USES_NEW_HDMI := true
BOARD_USES_CEC := true

# Kernel
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
BOARD_KERNEL_BASE := 0x80000000
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true

# Malloc
MALLOC_SVELTE := true

# Props
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

# Recovery
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_INCLUDE_FB2PNG := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
ifneq (,$(strip $(wildcard bootable/recovery-twrp/twrp.cpp)))
RECOVERY_VARIANT := twrp
endif

# Selinux.
BOARD_SEPOLICY_DIRS += \
    $(COMMON_FOLDER)/sepolicy
    
# Toybox
WITH_BUSYBOX_LINKS := true

# Misc.
BOARD_NEEDS_CUTILS_LOG := true

BOARD_HARDWARE_CLASS += $(OMAP4_NEXT_FOLDER)/cmhw

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

