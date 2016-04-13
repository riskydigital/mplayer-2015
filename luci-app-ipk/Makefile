#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-ipk
PKG_VERSION:=1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-ipk
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI luci-app-ipk
  DEPENDS:=
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/luci-app-ipk/description
luci-app-ipk
endef

define Build/Compile
endef

define Package/luci-app-ipk/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-ipk))
