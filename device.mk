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
#

# Inherit from msm8916-common
$(call inherit-product, device/cyanogen/msm8916-common/msm8916.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Due to multi-density builds, these are set by init
PRODUCT_SYSTEM_PROPERTY_BLACKLIST := ro.product.model ro.sf.lcd_density

# Include package config fragments
include $(LOCAL_PATH)/product/*.mk

# Call the proprietary setup
$(call inherit-product, vendor/yu/tomato/tomato-vendor.mk)

#PRODUCT_PACKAGES +=\
MiXplorer

PRODUCT_PACKAGES += \
android.hardware.graphics.composer@2.1-impl

# Healthd packages
PRODUCT_PACKAGES += \
cm_charger_res_images \
font_log.png \
libhealthd.cm

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Shims
PRODUCT_PACKAGES += \
    libshims_boringssl \
    libshims_camera \
    libshims_ims

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.cyanogen_8916

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Gatekeeper HAL
	android.hardware.gatekeeper@1.0-impl \
	android.hardware.gatekeeper@1.0-service
