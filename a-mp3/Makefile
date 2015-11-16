include $(TOPDIR)/rules.mk

PKG_NAME:=a-mp3
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/a-mp3
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=a-mp3
  DEPENDS:=+libffmpeg-full +mpd-full +alsa-utils +kmod-sound-core +kmod-usb-audio +ffmpeg 
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/a-mp3/description
mp3
endef

define Build/Compile
endef

define Package/a-mp3/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-mp3))
