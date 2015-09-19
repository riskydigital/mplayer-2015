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
Auto mount USB Disk or Flash
endef

define Build/Compile
endef

define Package/automount/postinst
#!/bin/sh
( . /etc/uci-defaults/automount ) && rm -f /etc/uci-defaults/automount
exit 0
endef

define Package/automount/prerm
#!/bin/sh
/etc/init.d/automount disable >/dev/null 2>&1
exit 0
endef

define Package/automount/install
	$(CP) ./root/* $(1)
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/automount.bin $(1)/usr/bin/automount
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/automount.init $(1)/etc/init.d/automount
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/automount.uci $(1)/etc/uci-defaults/automount
	$(INSTALL_DIR) $(1)/etc/rc.d
	$(INSTALL_BIN) ./files/automount.run $(1)/etc/rc.d/S99automount-run
endef

$(eval $(call BuildPackage,automount))
