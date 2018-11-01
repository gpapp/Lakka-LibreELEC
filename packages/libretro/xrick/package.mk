# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="xrick"
PKG_VERSION="68dc240"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/xrick-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Rick Dangerous Game Engine"
PKG_LONGDESC="Rick Dangerous Game Engine"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make -f Makefile.libretro CC=$CC
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp xrick_libretro.so $INSTALL/usr/lib/libretro/
}
