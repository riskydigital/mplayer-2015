
----------luci-vsftpd--------------
libdb47
libpam-db
vsftpd
vsftpd-pam-luci
----------------------------------


Add this line to your feeds.conf.default.

    src-git ramod git://github.com/openwrt-1983/vftp.git 

And run

    ./scripts/feeds update -a && ./scripts/feeds install -a
