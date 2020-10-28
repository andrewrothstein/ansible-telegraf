#!/usr/bin/env sh
DIR=~/Downloads
APP=telegraf
MIRROR=https://dl.influxdata.com/${APP}/releases

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local archive_type=${4:-tar.gz}
    local platform="${os}_${arch}"
    local file=${APP}-${ver}_${platform}.${archive_type}
    local url=$MIRROR/$file
    local lfile=$DIR/$file
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver()
{
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver linux amd64
    dl $ver linux i386
    dl $ver linux armhf
    dl $ver windows amd64 zip
}

dl_ver ${1:-1.16.0}
