#!/bin/sh
INSTALL_DIR="$1"
build_link="`wget -qO - https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ | grep 'class=\"button is-link is-primary\">' | sed  -r 's/.*href=\s*\".\/([^\"]+).*/\1/g'`"
build_link=`echo $build_link | awk '{print $1}'`
version=`echo "$build_link" | grep -o -E '[0-9]+' | head -1 | sed -e 's/^0\+//'`

test -f "${INSTALL_DIR}/current_version" || touch "${INSTALL_DIR}/current_version"

if ! grep -q "$version" ${INSTALL_DIR}/current_version; then
   `echo "$version" > "${INSTALL_DIR}/current_version"`
   wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/"$build_link" -O ${INSTALL_DIR}/fx.tar.xz
   rm -rf ${INSTALL_DIR}/alpine
   tar -xf ${INSTALL_DIR}/fx.tar.xz -C ${INSTALL_DIR}
   rm -rf ${INSTALL_DIR}/fx.tar.xz
   sed -i 's|#!/bin/bash|#!/bin/sh|' ${INSTALL_DIR}/run.sh
fi