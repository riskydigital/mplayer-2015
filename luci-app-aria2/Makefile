include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-aria2
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-aria2
SECTION:=LuCI
CATEGORY:=LuCI
SUBMENU:=3. Applications
TITLE:=LuCI Support for aria2
DEPENDS:=+aria2-1983
PKGARCH:=all
endef

define Package/luci-app-aria2/description
LuCI Support for aria2
endef

define Build/Compile
endef

define Package/luci-app-aria2/postinst
#!/bin/sh
( . /etc/uci-defaults/luci-aria2 ) && rm -f /etc/uci-defaults/luci-aria2
exit 0
endef

define Package/luci-app-aria2/prerm
#!/bin/sh
/etc/init.d/aria2 stop >/dev/null 2>&1
/etc/init.d/aria2 disable >/dev/null 2>&1
/etc/init.d/aria2delaystarter disable >/dev/null 2>&1
exit 0
endef

define Package/luci-app-aria2/postrm
#!/bin/sh
uci -q batch <<-EOF >/dev/null
	delete ucitrack.@aria2[-1]
	commit ucitrack
EOF
rm -f /tmp/luci-indexcache
rm -rf /tmp/luci-modulecache
exit 0
endef

define Package/luci-app-aria2/install
	$(CP) ./root/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/aria2.init $(1)/etc/init.d/aria2
	$(INSTALL_BIN) ./files/aria2delaystarter.init $(1)/etc/init.d/aria2delaystarter
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/aria2.config $(1)/etc/config/aria2
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/luci-aria2.uci $(1)/etc/uci-defaults/luci-aria2
endef

$(eval $(call BuildPackage,luci-app-aria2))
