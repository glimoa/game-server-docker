#!/bin/sh

build_link="`wget -qO - https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ | grep 'class=\"button is-link is-primary\">'| sed -r 's/.*href=\".\/([^\"]+).*/\1/g' | head -n1`"
build_link=`echo $build_link | awk '{print $1}'`
version=`echo "$build_link" | grep -o -E '[0-9]+' | head -1 | sed -e 's/^0\+//'`

test -f "/data/current_version" || touch "/data/current_version"

if ! grep -q "$version" /data/current_version; then
   `echo "$version" > "/data/current_version"`
   wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/"$build_link" -O /data/fx.tar.xz
   sudo rm -rf /data/alpine
   sudo tar -xf /data/fx.tar.xz -C /data
   sudo rm -rf /data/fx.tar.xz
fi