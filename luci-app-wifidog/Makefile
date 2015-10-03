include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-wifidog
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-wifidog
SECTION:=LuCI
CATEGORY:=LuCI
SUBMENU:=3. Applications
TITLE:=LuCI Support for wifidog
DEPENDS:=+wifidog
PKGARCH:=all
endef

define Package/luci-app-wifidog/description
LuCI Support for wifidog
endef

define Build/Compile
endef

define Package/luci-app-wifidog/postinst
#!/bin/sh
( . /etc/uci-defaults/luci-wifidog ) && rm -f /etc/uci-defaults/luci-wifidog
exit 0
endef

define Package/luci-app-wifidog/postrm
#!/bin/sh
uci -q batch <<-EOF >/dev/null
	delete ucitrack.@wifidog[-1]
	commit ucitrack
EOF
rm -f /tmp/luci-indexcache
rm -rf /tmp/luci-modulecache
exit 0
endef

define Package/luci-app-wifidog/install
	$(CP) ./root/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/luci-wifidog.uci $(1)/etc/uci-defaults/luci-wifidog
endef

$(eval $(call BuildPackage,luci-app-wifidog))
