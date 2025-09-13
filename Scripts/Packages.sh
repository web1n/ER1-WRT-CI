#!/bin/bash

#删除软件包(全名)
DELETE_PACKAGE() {
	local PKG_NAME=$1
	rm -rf $(find ./ ../feeds/luci/ ../feeds/packages/ -maxdepth 3 -type d -iname "$PKG_NAME" -prune)
}
#DELETE_PACKAGE "openvpn-openssl"
#DELETE_PACKAGE "openvpn-easy-rsa"

#安装和更新软件包(包含通配符)
UPDATE_PACKAGE() {
	local PKG_NAME=$1
	local PKG_REPO=$2
	local PKG_BRANCH=$3
	local PKG_SPECIAL=$4
	local REPO_NAME=$(echo $PKG_REPO | cut -d '/' -f 2)

	rm -rf $(find ./ ../feeds/luci/ ../feeds/packages/ -maxdepth 3 -type d -iname "*$PKG_NAME*" -prune)

	git clone --depth=1 --single-branch --branch $PKG_BRANCH "https://github.com/$PKG_REPO.git"

	if [[ $PKG_SPECIAL == "pkg" ]]; then
		cp -rf $(find ./$REPO_NAME/*/ -maxdepth 3 -type d -iname "*$PKG_NAME*" -prune) ./
		rm -rf ./$REPO_NAME/
	elif [[ $PKG_SPECIAL == "name" ]]; then
		mv -f $REPO_NAME $PKG_NAME
	fi
}

#UPDATE_PACKAGE "包名" "项目地址" "项目分支" "pkg/name，可选，pkg为从大杂烩中单独提取包名插件；name为重命名为包名"
UPDATE_PACKAGE "homeproxy" "ftkey/openwrt_pkgs" "main" "pkg"
UPDATE_PACKAGE "passwall" "ftkey/openwrt_pkgs" "main" "pkg"
UPDATE_PACKAGE "vlmcsd" "ftkey/openwrt_pkgs" "main" "pkg"
UPDATE_PACKAGE "luci-app-onliner" "ftkey/openwrt_pkgs" "main" "pkg"
UPDATE_PACKAGE "ddns-scripts-aliyun" "ftkey/openwrt_pkgs" "main" "pkg"






#if [[ $WRT_REPO != *"immortalwrt"* ]]; then
#	UPDATE_PACKAGE "qmi-wwan" "immortalwrt/wwan-packages" "master" "pkg"
#fi

