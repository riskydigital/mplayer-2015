include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-autoreboot
PKG_VERSION=2.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-autoreboot
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=Auto REBOOT for LuCI
	PKGARCH:=all
endef

define Package/luci-app-autoreboot/description
	This package contains LuCI configuration pages for auto reboot.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-autoreboot/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/admin
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view
	
	$(INSTALL_CONF) ./files/root/etc/config/autoreboot $(1)/etc/config/autoreboot
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/controller/admin/autoreboot.lua $(1)/usr/lib/lua/luci/controller/admin/autoreboot.lua
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/view/myreboot.htm $(1)/usr/lib/lua/luci/view/myreboot.htm
endef

$(eval $(call BuildPackage,luci-app-autoreboot))
