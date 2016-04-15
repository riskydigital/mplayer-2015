include $(TOPDIR)/rules.mk

PKG_NAME:=a-mt7620-tf
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/a-mt7620-tf
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=a-mt7620-tf
  DEPENDS:=+kmod-mmc +kmod-sdhci +kmod-sdhci-mt7620
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/a-mt7620-tf/description
a-mt7620-tf
endef

define Build/Compile
endef

define Package/a-mt7620-tf/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,a-mt7620-tf))
