include $(TOPDIR)/rules.mk

PKG_NAME:=a-jichuzujian-oye
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/a-jichuzujian-oye
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=a-jichuzujian-oye
  DEPENDS:=+automount +luci-i18n-chinese +block-mount +kmod-fs-ext4 +kmod-fs-ntfs +kmod-fs-vfat +kmod-nls-cp437 +kmod-nls-iso8859-1 +kmod-nls-utf8 +kmod-usb-storage +kmod-usb-storage-extras +kmod-usb2 +kmod-usb3 +kmod-usb-ohci +kmod-usb-uhci +ntfs-3g +usbutils +luci
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/a-jichuzujian-oye/description
jichuzujian
endef

define Build/Compile
endef

define Package/a-jichuzujian-oye/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-jichuzujian-oye))
