# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="frodo"
PKG_VERSION="4c15016"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/r-type/frodo-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Frodo - The free portable C64 emulator"
PKG_LONGDESC="Frodo - The free portable C64 emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  #if [ "$ARCH" == "arm" ]; then
  #  CFLAGS="$CFLAGS -DARM -DALIGN_DWORD -mstructure-size-boundary=32 -mthumb-interwork -falign-functions=16 -marm"
  #fi
  make -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp frodo_libretro.so $INSTALL/usr/lib/libretro/
}
