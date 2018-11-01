# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="imame4all"
PKG_VERSION="bd3833c"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/libretro/imame4all-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="A port of iMAME4all to libretro"
PKG_LONGDESC="A port of iMAME4all to libretro"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make -f makefile.libretro ARM=1
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp libretro.so $INSTALL/usr/lib/libretro/imame4all_libretro.so
}
