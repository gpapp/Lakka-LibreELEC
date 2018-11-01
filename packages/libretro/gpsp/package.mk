# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gpsp"
PKG_VERSION="d99f3ac"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/gpsp"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="gpSP for libretro."
PKG_LONGDESC="gameplaySP is a Gameboy Advance emulator for Playstation Portable"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  if [ "$ARCH" == "arm" ]; then
    make CC=$CC platform=armv
  else
    make CC=$CC
  fi  
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp gpsp_libretro.so $INSTALL/usr/lib/libretro/
}
