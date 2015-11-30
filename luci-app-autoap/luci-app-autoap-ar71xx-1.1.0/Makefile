#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-autoap-ar71xx-1.1.0
PKG_VERSION:=long1983
PKG_RELEASE:=

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-autoap-ar71xx-1.1.0
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for autoap-ar71xx downloading app.
  DEPENDS:=
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/luci-app-autoap-ar71xx-1.1.0/description
Xunlei configuration module.Include init script and auto update app
endef

define Build/Compile
endef

define Package/luci-app-autoap-ar71xx-1.1.0/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-autoap-ar71xx-1.1.0))
