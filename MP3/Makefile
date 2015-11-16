include $(TOPDIR)/rules.mk

PKG_NAME:=a-MP3
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/a-MP3
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for a-MP3 downloading app.
  DEPENDS:=+libffmpeg-full +mpd-full +alsa-utils +kmod-sound-core +kmod-usb-audio +ffmpeg 
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/a-MP3/description
Xunlei configuration module.Include init script and auto update app
endef

define Build/Compile
endef

define Package/a-MP3/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-MP3))
