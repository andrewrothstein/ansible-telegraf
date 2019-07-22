#!/usr/bin/env sh
VER=1.11.2
DIR=~/Downloads
MIRROR=https://dl.influxdata.com/telegraf/releases

dl()
{
    OS=$1
    ARCH=$2
    ARCHIVETYPE=$3

    FILE=telegraf-${VER}_${OS}_${ARCH}.${ARCHIVETYPE}
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s_%s: sha256:%s\n" $OS $ARCH `sha256sum $LFILE | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl linux amd64 tar.gz
dl linux i386 tar.gz
dl linux armhf tar.gz
dl windows amd64 zip
