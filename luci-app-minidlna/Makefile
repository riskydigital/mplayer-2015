#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-minidlna
PKG_VERSION:=long1983
PKG_RELEASE:=

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-minidlna
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI minidlna
  DEPENDS:=+minidlna
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/luci-app-minidlna/description
minidlna
endef

define Build/Compile
endef

define Package/luci-app-minidlna/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-minidlna))
