


----------luci-vsftpd-------------
vsftpd-pam-luci
libdb47
libpam-db
vsftpd
-----

luci-vsftpd

20150919-2 全新编译的 auto-mount 启动就挂载

20150920-2 luci-app-uhttpd 替换成 蝈蝈的中文版

添加了 packages/net/reaver 1505没有 reaver

添加了 packages\utils\restorefactory 复位

luci-app-webshell 换成 蝈蝈的了

添加了 luci-app-xunlei


Add this line to your feeds.conf.default.

    src-git ramod git://github.com/openwrt-1983/vftp.git 

And run

    ./scripts/feeds update -a && ./scripts/feeds install -a
