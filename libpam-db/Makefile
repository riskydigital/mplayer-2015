include $(TOPDIR)/rules.mk

PKG_NAME:=libpam-db
PKG_VERSION:=1.2.0
PKG_RELEASE:=2

PKG_SOURCE:=Linux-PAM-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.linux-pam.org/library/
PKG_MD5SUM:=ee4a480d77b341c99e8b1375f8f180c0
PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_MAINTAINER:=Nikos Mavrogiannopoulos <n.mavrogiannopoulos@gmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/Linux-PAM-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libpam-db
SECTION:=libs
CATEGORY:=Libraries
TITLE:=the Linux-PAM libraries and modules. (DB support)
URL:=http://www.kernel.org/pub/linux/libs/pam
DEPENDS:=+libdb47
endef

define Package/libpam-db/description
The Linux-PAM Pluggable Authentication Modules.
endef

TARGET_CFLAGS += $(FPIC)

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--enable-pamlocking \
		--disable-prelude \
		--disable-lckpwdf \
		--disable-selinux \
		--disable-nls \
		--disable-rpath \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/lib
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/lib/* $(1)/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include
endef

define Package/libpam-db/install
	$(INSTALL_DIR) $(1)/lib $(1)/etc $(1)/lib/security $(1)/lib/security/pam_filter
	$(CP) $(PKG_INSTALL_DIR)/lib/*.so* $(1)/lib/
	$(CP) $(PKG_INSTALL_DIR)/etc/* $(1)/etc/
	$(CP) ./root/* $(1)/
	$(CP) $(PKG_INSTALL_DIR)/lib/security/{pam_userdb.so,pam_unix.so} $(1)/lib/security/
endef

$(eval $(call BuildPackage,libpam-db))
