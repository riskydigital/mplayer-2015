include $(TOPDIR)/rules.mk

PKG_NAME:=a-jichuzujian
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/a-jichuzujian
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for jichuzujian downloading app.
  DEPENDS:=+automount +luci-i18n-chinese +block-mount +kmod-fs-ext4 +kmod-fs-ntfs +kmod-fs-vfat +kmod-nls-cp437 +kmod-nls-iso8859-1 +kmod-nls-utf8 +kmod-usb-storage +kmod-usb-storage-extras +kmod-usb2 +kmod-usb3 +kmod-usb-ohci +kmod-usb-uhci +ntfs-3g +usbutils +luci +restorefactory
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/a-jichuzujian/description
Xunlei configuration module.Include init script and auto update app
endef

define Build/Compile
endef

define Package/a-jichuzujian/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-jichuzujian))
