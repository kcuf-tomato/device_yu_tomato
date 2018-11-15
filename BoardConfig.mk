#
# Copyright (C) 2016 The CyanogenMod Project
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

include device/cyanogen/msm8916-common/BoardConfigCommon.mk

include device/yu/tomato/board/*.mk

# Assertions
TARGET_BOARD_INFO_FILE := device/yu/tomato/board-info.txt

# Inherit from proprietary files
include vendor/yu/tomato/BoardConfigVendor.mk
#ALLOW_MISSING_DEPENDENCIES =true
WITH_DEXPREOPT := false
# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/yu/tomato/bluetooth

# Camera
BOARD_CAMERA_SENSORS := imx135_cp8675 imx214_cp8675 ov5648_cp8675
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_DESTROYED_MUTEX_USAGE_WHITELIST := mm-qcamera-daemon
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
	/system/bin/mediaserver=23 \
	/system/vendor/bin/mm-qcamera-daemon=23

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_PERSISTIMAGE_PARTITION_SIZE := 10485760
# BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13576175616 # 13576192000 - 16384

# Use mke2fs instead of make_ext4fs
TARGET_USES_MKE2FS := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Properties
TARGET_SYSTEM_PROP += device/yu/tomato/system.prop

# HIDL
DEVICE_MANIFEST_FILE := device/yu/tomato/manifest.xml

# Init
TARGET_LIBINIT_MSM8916_DEFINES_FILE := device/yu/tomato/init/init_tomato.cpp

QCOM_HARDWARE_VARIANT := msm8916
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_USES_QCOM_MM_AUDIO := true

# Shims
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib64/lib-imsdpl.so|libshims_boringssl.so \
    /system/vendor/lib64/lib-imscamera.so|libshims_camera.so \
    /system/vendor/lib64/lib-imsvt.so|libshims_ims.so \

TARGET_QCOM_WLAN_VARIANT := wlan-caf

#Telephony
PRODUCT_PACKAGES += qti-telephony-common
PRODUCT_BOOT_JARS += telephony-ext

#mm-qcamera-deamon
TARGET_DESTROYED_MUTEX_USAGE_WHITELIST := mm-qcamera-daemon

TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
	/system/bin/mediaserver=23 \
	/system/vendor/bin/mm-qcamera-daemon=23
WITH_DEXPREOPT := true

#SystemServer: Bootimg dex
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt
