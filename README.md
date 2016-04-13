


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

20150921 添加了 mt7601 驱动

20150922 添加了 mdk3

删除了 luci(也只是需要里面的 luci-aria2) 添加了 luci-app-aria2

20151003 添加 luci-app-wifidog

20151004 添加 guoguo-dj 叠加网络 (还没有弄好)  
brxg 别人修改的 可以用  

20151008 添加 luci-app-syncy 百度云同步插件 2.5.3
luci-app-cpulimit  cpu限制使用率

20151009 添加 luci-app-xunlei2 这个测试成功 不死机了

20151010 删除 guoguo-dj

20151009 添加 luci-app-uhttpd 完全汉化版
.po转换成.lmo

20151019 添加 luci-app-autoap (里面两个版本 ar71xx和ramips 1.1.0版本) 中继增强插件

20151117 添加 a-MP3文件夹-路由器播放MP3和网络歌曲网络电台 a-mp32文件夹是和a-MP3一起用的 a-jichuzujian文件夹-基础组件

20151130 添加 luci-app-autoap (里面两个版本 ar71xx和ramips 1.0.0版本) 中继增强插件

20160308 更新了 luci-app-nfs (和samba一样的东西 不过比samba节省资源)   添加了优酷路由宝插件 2.11版本

20160406 修改了 luci-app-autoap-ramips-1.1.0---autoAP

20160411 修改了 luci-app-xunlei3 luci-app-vsftpd (查看 Uses UCI scripts 选择了没有)

20160413 添加 luci-app-autoreboot(按 月 日 时 分 重启路由器)  luci-app-ipk(本地安装ipk)












Add this line to your feeds.conf.default.

    src-git ramod git://github.com/openwrt-1983/vftp.git 

And run

    ./scripts/feeds update -a && ./scripts/feeds install -a
