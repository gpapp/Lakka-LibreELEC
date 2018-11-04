# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-fbalpha"
PKG_VERSION="da23245"
PKG_SHA256="27f72d3ade6f6e07163cba5c2466cd9a0cd77e00cee23675c626019d41bd42f2"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/fbalpha"
PKG_URL="https://github.com/libretro/fbalpha/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="game.libretro.fba: fba for Kodi"
PKG_TOOLCHAIN="manual"
# linking takes too long with lto

PKG_LIBNAME="fbalpha_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="FBALPHA_LIB"

make_target() {
  make -f makefile.libretro
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
