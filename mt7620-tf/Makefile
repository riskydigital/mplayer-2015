include $(TOPDIR)/rules.mk

PKG_NAME:=mt7620-tf
PKG_VERSION:=long1983
PKG_RELEASE:=1.1.0

include $(INCLUDE_DIR)/package.mk

define Package/mt7620-tf
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=a-mt7620-tf
  DEPENDS:=+kmod-mmc +kmod-sdhci +kmod-sdhci-mt7620
  PKGARCH:=all
  MAINTAINER:=long1983
endef

define Package/mt7620-tf/description
jichuzujian
endef

define Build/Compile
endef

define Package/mt7620-tf/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,mt7620-tf))
