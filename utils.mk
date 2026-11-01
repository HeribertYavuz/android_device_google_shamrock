#
# Copyright (C) 2013 The Android Open Source Project
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

# Board/platform helper functions used by the Qualcomm CAF HAL makefiles
# (hardware/qcom/{audio,display,media}-caf/msm8952) and by the IPA makefiles
# in this device tree.  LineageOS provides these in vendor/lineage; AOSP only
# ships them in device/google/{coral,wahoo}/utils.mk, which this tree does not
# inherit, so carry the required subset here.  BoardConfig.mk includes this
# file, so the functions exist by the time any Android.mk is parsed.

# vars for use by utils
__empty :=
__space := $(__empty) $(__empty)
__colon := $(__empty):$(__empty)
__underscore := $(__empty)_$(__empty)

# $(call match-word,w1,w2)
# checks if w1 == w2
define match-word
$(strip \
  $(if $(or $(subst $(1),$(__empty),$(2)),$(subst $(2),$(__empty),$(1))),,true) \
)
endef

# $(call find-word-in-list,w,wlist)
# finds an exact match of word w in word list wlist
define find-word-in-list
$(strip \
  $(eval wl:= $(__colon)$(subst $(__space),$(__colon),$(strip $(2)))$(__colon)) \
  $(eval w:= $(__colon)$(strip $(1))$(__colon)) \
  $(eval m:= $(findstring $(w),$(wl))) \
  $(if $(m),$(1),) \
)
endef

# $(call match-word-in-list,w,wlist)
# does an exact match of word w in word list wlist
define match-word-in-list
$(strip \
  $(if $(strip $(1)), \
    $(call match-word,$(call find-word-in-list,$(1),$(2)),$(strip $(1))), \
  ) \
)
endef

# $(call match-prefix,p,delim,w/wlist)
# matches prefix p in wlist using delimiter delim
define match-prefix
$(strip \
  $(eval w := $(strip $(1)$(strip $(2)))) \
  $(eval text := $(patsubst $(w)%,$(1),$(3))) \
  $(if $(call match-word-in-list,$(1),$(text)),true,) \
)
endef

# $(call get-vendor-board-platforms,v)
# returns list of board platforms for vendor v
define get-vendor-board-platforms
$($(1)_BOARD_PLATFORMS)
endef

# $(call is-board-platform,bp)
# returns true or __empty
define is-board-platform
$(call match-word,$(1),$(TARGET_BOARD_PLATFORM))
endef

# $(call is-not-board-platform,bp)
# returns true or __empty
define is-not-board-platform
$(if $(call match-word,$(1),$(TARGET_BOARD_PLATFORM)),,true)
endef

# $(call is-board-platform-in-list,bpl)
# returns true or __empty
define is-board-platform-in-list
$(call match-word-in-list,$(TARGET_BOARD_PLATFORM),$(1))
endef

# $(call is-vendor-board-platform,vendor)
# returns true or __empty
define is-vendor-board-platform
$(strip \
  $(call match-word-in-list,$(TARGET_BOARD_PLATFORM),\
    $(call get-vendor-board-platforms,$(1)) \
  ) \
)
endef

# $(call is-chipset-in-board-platform,chipset)
# does a prefix match of chipset in TARGET_BOARD_PLATFORM
# uses underscore as a delimiter
define is-chipset-in-board-platform
$(call match-prefix,$(1),$(__underscore),$(TARGET_BOARD_PLATFORM))
endef

# $(call is-platform-sdk-version-at-least,version)
# version is a numeric SDK_VERSION
define is-platform-sdk-version-at-least
$(strip \
  $(if $(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= $(1) ))" )), \
    true, \
  ) \
)
endef

# -----------------------------------------------------------------------------
# Qualcomm CAF project mapping
# -----------------------------------------------------------------------------
# QCOM_BOARD_PLATFORMS is the list the CAF HAL makefiles check through
# is-vendor-board-platform / is-board-platform-in-list; MSM_VIDC_TARGET_LIST
# selects the targets whose VIDC video components are built.
QCOM_BOARD_PLATFORMS := msm8952
MSM_VIDC_TARGET_LIST := msm8952

# In LineageOS these names are registered in vendor/lineage/build/core/pathmap.mk
# and live under hardware/qcom-caf/<variant>.  Here the HALs were cloned into
# hardware/qcom/*-caf/msm8952, so map the project names to those paths.
SHAMROCK_PROJECT_PATHS := \
    qcom-audio:hardware/qcom/audio-caf/msm8952 \
    qcom-display:hardware/qcom/display-caf/msm8952 \
    qcom-media:hardware/qcom/media-caf/msm8952 \
    qcom-dataservices:vendor/qcom/opensource/dataservices

# $(call project-set-path,<name>,<path>)
define project-set-path
$(eval SHAMROCK_PROJECT_PATHS += $(1):$(2))
endef

# $(call project-path-for,<name>)
# Returns the path to the requested project, relative to the source tree root.
define project-path-for
$(foreach n,$(1),$(patsubst $(n):%,%,$(filter $(n):%,$(SHAMROCK_PROJECT_PATHS))))
endef
