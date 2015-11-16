include $(TOPDIR)/rules.mk

PKG_NAME:=a-wldt
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/a-wldt
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=a-wldt
  DEPENDS:=+libffmpeg-full +mpd-full +alsa-utils +kmod-sound-core +kmod-usb-audio +ffmpeg 
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/a-wldt/description
mp3
endef

define Build/Compile
endef

define Package/a-wldt/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-wldt))
