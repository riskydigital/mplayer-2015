include $(TOPDIR)/rules.mk

PKG_NAME:=a-luci-minidlna
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/a-luci-minidlna
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=a-luci-minidlna
  DEPENDS:=+libffmpeg-full
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/a-luci-minidlna/description
jichuzujian
endef

define Build/Compile
endef

define Package/a-luci-minidlna/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-luci-minidlna))
