include $(TOPDIR)/rules.mk

PKG_NAME:=1505-jichuzujian
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/1505-jichuzujian
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=1505-jichuzujian
  DEPENDS:=+automount +Chinese +block-mount +kmod-fs-ext4 +kmod-fs-ntfs +kmod-fs-vfat +kmod-nls-cp437 +kmod-nls-iso8859-1 +kmod-nls-utf8 +kmod-usb-storage +kmod-usb-storage-extras +kmod-usb2 +kmod-usb3 +kmod-usb-ohci +kmod-usb-uhci +ntfs-3g +usbutils +luci +restorefactory
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/1505-jichuzujian/description
jichuzujian
endef

define Build/Compile
endef

define Package/1505-jichuzujian/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,1505-jichuzujian))
