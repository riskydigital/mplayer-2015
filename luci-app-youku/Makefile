#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-youku
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-youku
  CATEGORY:=Firefly Configuration
  SUBMENU:=Applications
  DEPENDS:=+librt +libstdcpp +libthread-db
  TITLE:=LuCI support for the youku
endef

define Package/luci-app-youku/description
	LuCI support for the youku,but the youku's LuCI only chinese
endef

define Build/Compile
endef

define Package/luci-app-youku/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-youku))
