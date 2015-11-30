#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-autoap-ramips-1.0.0
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-autoap-ramips-1.0.0
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for autoap-ramips downloading app.
  DEPENDS:=
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/luci-app-autoap-ramips/description
Xunlei configuration module.Include init script and auto update app
endef

define Build/Compile
endef

define Package/luci-app-autoap-ramips/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-autoap-ramips))
