# Copyright (C) 2013-2016, The CyanogenMod Project
# Copyright (C) 2017, The LineageOS Project
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

ifeq ($(RECOVERY_VARIANT),twrp)
   WITH_TWRP := true
endif

# Inherit from common serrano
-include device/samsung/serrano-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := serranoltevzw,i435L,SCH-i435L

# Inherit from proprietary vendor
-include vendor/samsung/serranoltevzw/BoardConfigVendor.mk

# Kernel
TARGET_KERNEL_VARIANT_CONFIG := msm8930_serrano_vzw_defconfig

# NFC
BOARD_HAVE_NFC := true

# LED
BOARD_HAVE_MULTI_COLOR_LED := true

# Custom RIL class
BOARD_RIL_CLASS := ../../../device/samsung/serranoltevzw/ril/

ifeq ($(WITH_TWRP),true)
   TARGET_RECOVERY_DEVICE_DIRS += device/samsung/serranoltevzw
   TARGET_RECOVERY_FSTAB += device/samsung/serranoltevzw/rootdir/twrp.fstab
endif
