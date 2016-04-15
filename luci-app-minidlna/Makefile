#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-minidlna
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-minidlna
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI support for the minidlna
endef

define Package/luci-app-minidlna/description
	LuCI luci-app-minidlna,but the youku's LuCI only chinese
endef

define Build/Compile
endef

define Package/luci-app-minidlna/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-minidlna))
