include $(TOPDIR)/rules.mk

PKG_NAME:=a-mp32
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/a-mp32
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=a-mp32
  DEPENDS:=+kmod-usb-audio +mpd-full
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/a-mp32/description
mp3
endef

define Build/Compile
endef

define Package/a-mp32/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-mp32))
