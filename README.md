


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

20150921 添加了 mt7601 驱动

20150922 添加了 mdk3

删除了 luci(也只是需要里面的 luci-aria2) 添加了 luci-app-aria2

20150929 添加 luci-app-xunlei luci-app-qosv4 ufsd-ar71xx-3.10 ufsd-mipsel

20151003 添加 luci-app-wifidog

20151004 添加 guoguo-dj 叠加网络 (还没有弄好)


Add this line to your feeds.conf.default.

    src-git ramod git://github.com/openwrt-1983/vftp.git 

And run

    ./scripts/feeds update -a && ./scripts/feeds install -a
