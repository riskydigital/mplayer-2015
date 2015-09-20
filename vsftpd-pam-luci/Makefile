include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-vsftpd-pam
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-vsftpd-pam
SECTION:=LuCI
CATEGORY:=LuCI
SUBMENU:=3. Applications
TITLE:=LuCI Support for vsftpd-pam
DEPENDS:=+vsftpd-pam
PKGARCH:=all
endef

define Package/luci-app-vsftpd-pam/description
LuCI Support for vsftpd-pam
endef

define Build/Compile
endef

define Package/luci-app-vsftpd-pam/postinst
#!/bin/sh
( . /etc/uci-defaults/luci-vsftpd ) && rm -f /etc/uci-defaults/luci-vsftpd
exit 0
endef

define Package/luci-app-vsftpd-pam/postrm
#!/bin/sh
uci -q batch <<-EOF >/dev/null
	delete ucitrack.@vsftpd[-1]
	commit ucitrack
EOF
rm -f /tmp/luci-indexcache
rm -rf /tmp/luci-modulecache
exit 0
endef

define Package/luci-app-vsftpd-pam/install
	$(CP) ./root/* $(1)
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/luci-vsftpd.uci $(1)/etc/uci-defaults/luci-vsftpd
endef

$(eval $(call BuildPackage,luci-app-vsftpd-pam))
