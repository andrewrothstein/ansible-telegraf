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
        curl -sLf -o $lfile $url
    fi
    if [ -e $lfile ];
    then
        printf "    # %s\n" $url
        printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
    fi
}

dl_ver()
{
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver freebsd amd64
    dl $ver freebsd armv7
    dl $ver freebsd i386
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver linux armel
    dl $ver linux armhf
    dl $ver linux i386
    dl $ver linux mips
    dl $ver linux mipsel
    dl $ver linux ppc64le
    dl $ver linux riscv64
    dl $ver linux s390x
    dl $ver windows amd64 zip
    dl $ver windows i386 zip
}

dl_ver ${1:-1.25.1}
