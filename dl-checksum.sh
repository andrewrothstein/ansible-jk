#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/jkcfg/jk/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="$os-$arch"
    local url=$MIRROR/$ver/jk-$platform.sha256

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(curl -sSL $url | awk '{print $1}')
}

dlver () {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin amd64
    dl $ver linux amd64
}

dlver ${1:-0.3.2}
