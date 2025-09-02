# ER1-WRT-CI

京东云太乙ER1固件

带有 -12m 后缀的为 12m 内核固件，需要先从 uboot 刷入 6m 内核固件（factory 格式）后，再从 OpenWrt 后台刷入 12m 固件（sysupgrade 格式）。

## 软件包
```
luci-app-cpufreq
luci-app-ddns
luci-app-onliner
luci-app-openvpn
luci-app-openvpn-server
luci-app-samba4
luci-app-zerotier
luci-app-frpc
luci-app-wol
luci-app-autoreboot
luci-app-nlbwmon
luci-app-upnp
luci-app-vlmcsd
luci-app-arpbind
luci-app-smartdns
luci-app-homeproxy
luci-app-msd_lite
```

12m 内核固件增加的软件包:
```
luci-app-dae
luci-app-daed
```

## 固件源码(带NSS) 
#### OWRT
<https://github.com/VIKINGYFY/immortalwrt.git>

## THKS
特别感谢QQ群:560094821

ftkey | VIKINGYFY | LiBwrt-op | ZqinKing | laipeng668 | ImmortalWRT | LEDE | MORE AND MORE

## 特别提示
本人不对任何人因使用本固件所遭受的任何理论或实际的损失承担责任！
本固件禁止用于任何商业用途，请务必严格遵守国家互联网使用相关法律规定！

