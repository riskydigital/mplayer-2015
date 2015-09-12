# Filename:    30-block_mount
# Revision:    0.5.1
# Data:        Jul. 7, 2014
# Email:       kevinyu@vip.qq.com
# Contacts:    QQ/TM 389191 or mail address above
# Licensing:   General Public License v2
# Description: Created for automatic mount block devices on OpenWRT
# Usage:       Put this script into directory /etc/hotplug.d/block

include $(TOPDIR)/rules.mk

PKG_NAME:=automount
PKG_VERSION:=0.5.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/automount
SECTION:=utils
CATEGORY:=Utilities
SUBMENU:=disc
TITLE:=Auto Mount
URL:=kevinyu@vip.qq.com
PKGARCH:=all
DEPENDS:=+blkid
endef

define Package/automount/description
Created for automatic mount block devices on OpenWRT
endef

define Build/Compile
endef

define Package/automount/install
	$(CP) ./root/* $(1)
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/auto-mount.bin $(1)/usr/bin/auto-mount
	$(INSTALL_DIR) $(1)/etc/rc.d
	$(INSTALL_BIN) ./files/auto-mount.init $(1)/etc/rc.d/S99auto-mount
	# $(INSTALL_BIN) ./files/auto-config.init $(1)/etc/rc.d/S99auto-config
endef

$(eval $(call BuildPackage,automount))
