#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-cpulimit
PKG_VERSION:=0.11
PKG_RELEASE:=14

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-cpulimit
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for cpulimit downloading app.
  DEPENDS:=+cpulimit-ng
  PKGARCH:=all
  MAINTAINER:=Haxc
endef

define Package/luci-app-cpulimit/description
Xunlei configuration module.Include init script and auto update app
endef

define Build/Compile
endef

define Package/luci-app-cpulimit/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-cpulimit))
