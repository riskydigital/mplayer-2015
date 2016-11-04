include $(TOPDIR)/rules.mk

PKG_NAME:=a-mplayer-9331
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/a-mplayer-9331
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=a-mplayer-9331
  DEPENDS:=+kmod-sound-core +kmod-usb-audio +libiconv-full +alsa-utils +zlib +libmad +screen
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/a-mplayer-9331/description
mp3
endef

define Build/Compile
endef

define Package/a-mplayer-9331/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-mplayer-9331))
