include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-minidlna
PKG_VERSION:=long1983
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-minidlna
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=luci-app-minidlna
  DEPENDS:=+minidlna
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/luci-app-minidlna/description
  luci-app-minidlna
endef

define Build/Compile
endef

define Package/luci-app-minidlna/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-minidlna))
