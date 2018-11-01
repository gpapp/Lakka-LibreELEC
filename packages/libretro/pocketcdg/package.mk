# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="pocketcdg"
PKG_VERSION="2aa1f9b"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-pocketcdg"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Karaoke player"
PKG_LONGDESC="Karaoke player"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make CC=$CC
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp pocketcdg_libretro.so $INSTALL/usr/lib/libretro/
}
