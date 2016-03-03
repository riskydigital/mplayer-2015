include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-nfs
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-nfs
SECTION:=LuCI
CATEGORY:=LuCI
SUBMENU:=3. Applications
TITLE:=LuCI Support for NFS
DEPENDS:=+nfs-kernel-server
PKGARCH:=all
endef

define Package/luci-app-nfs/description
LuCI Support for nfs
endef

define Build/Compile
endef

define Package/luci-app-nfs/postinst
#!/bin/sh
( . /etc/uci-defaults/luci-nfs ) && rm -f /etc/uci-defaults/luci-nfs
exit 0
endef

define Package/luci-app-nfs/postrm
#!/bin/sh
uci -q batch <<-EOF >/dev/null
	delete ucitrack.@nfs[-1]
	commit ucitrack
EOF
rm -f /tmp/luci-indexcache
rm -rf /tmp/luci-modulecache
exit 0
endef

define Package/luci-app-nfs/install
	$(CP) ./root/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/nfs.init $(1)/etc/init.d/nfs
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/nfs.config $(1)/etc/config/nfs
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) ./files/nfs.firewall $(1)/etc/firewall.nfs
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/luci-nfs.uci $(1)/etc/uci-defaults/luci-nfs
endef

$(eval $(call BuildPackage,luci-app-nfs))
