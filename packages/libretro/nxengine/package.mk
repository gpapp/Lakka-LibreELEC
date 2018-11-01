# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="nxengine"
PKG_VERSION="51cf8a1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/nxengine-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Port of NxEngine to libretro - Cave Story game engine clone"
PKG_LONGDESC="A complete open-source clone/rewrite of the masterpiece jump-and-run platformer Doukutsu Monogatari (also known as Cave Story)."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  sed -i -e "s/CC         = gcc//" Makefile
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp nxengine_libretro.so $INSTALL/usr/lib/libretro/
}
