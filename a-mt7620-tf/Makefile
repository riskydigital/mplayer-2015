#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=a-mt7620-tf
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/a-mt7620-tf
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  DEPENDS:=+kmod-sdhci +kmod-sdhci-mt7620 +kmod-mmc
  TITLE:=LuCI support for the a-mt7620-tf
endef

define Package/a-mt7620-tf/description
	LuCI a-mt7620-tf,but the youku's LuCI only chinese
endef

define Build/Compile
endef

define Package/a-mt7620-tf/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-mt7620-tf))
