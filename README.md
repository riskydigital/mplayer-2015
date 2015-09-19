


----------luci-vsftpd-------------
vsftpd-pam-luci
libdb47
libpam-db
vsftpd
-----

luci-vsftpd

20150919-2 全新编译的 auto-mount 启动就挂载


Add this line to your feeds.conf.default.

    src-git ramod git://github.com/openwrt-1983/vftp.git 

And run

    ./scripts/feeds update -a && ./scripts/feeds install -a
