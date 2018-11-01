# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="desmume-2015"
PKG_VERSION="5957aa0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/desmume2015"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="libretro wrapper for desmume NDS emulator."
PKG_LONGDESC="libretro wrapper for desmume NDS emulator."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  if [ "$ARCH" == "arm" ]; then
    make -C desmume platform=armv LDFLAGS="$LDFLAGS -lpthread" # DESMUME_JIT_ARM=1
  elif [ "$ARCH" == "aarch64" ]; then
    make -C desmume platform=arm64-unix LDFLAGS="$LDFLAGS -lpthread"
  else
    make -C desmume LDFLAGS="$LDFLAGS -lpthread"
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp desmume/desmume2015_libretro.so $INSTALL/usr/lib/libretro/
}
