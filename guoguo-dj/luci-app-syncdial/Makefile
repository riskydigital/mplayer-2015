include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-syncdial
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-syncdial
SECTION:=LuCI
CATEGORY:=LuCI
SUBMENU:=3. Applications
TITLE:=LuCI Support for a diag hack
DEPENDS:=+kmod-macvlan +luci-app-mwan1983
PKGARCH:=all
endef

define Package/luci-app-syncdial/description
LuCI Support for syncdial
endef

define Build/Compile
endef

define Package/luci-app-syncdial/postinst
#!/bin/sh
( . /etc/uci-defaults/luci-syncdial ) && rm -f /etc/uci-defaults/luci-syncdial
exit 0
endef

define Package/luci-app-syncdial/postrm
#!/bin/sh
uci -q batch <<-EOF >/dev/null
	delete ucitrack.@syncdial[-1]
	commit ucitrack
EOF
rm -f /tmp/luci-indexcache
rm -rf /tmp/luci-modulecache
exit 0
endef

define Package/luci-app-syncdial/install
	$(CP) ./root/* $(1)
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/luci-syncdial.uci $(1)/etc/uci-defaults/luci-syncdial
endef

$(eval $(call BuildPackage,luci-app-syncdial))
