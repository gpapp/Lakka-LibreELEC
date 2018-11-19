# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="lutro"
PKG_VERSION="b69dd3e"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-lutro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="An experimental lua game framework for libretro inspired by LÖVE"
PKG_LONGDESC="An experimental lua game framework for libretro inspired by LÖVE"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  PTR_SIZE="-m32"
  if [ "$ARCH" == "x86_64" ]; then
    PTR_SIZE="-m64"
  fi  
  make HOST_CC="$HOST_CC" PTR_SIZE="$PTR_SIZE" CROSS="$TARGET_PREFIX" HAVE_COMPOSITION=1
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp lutro_libretro.so $INSTALL/usr/lib/libretro/
}
