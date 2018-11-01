# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="easyrpg"
PKG_VERSION="9e18a98"
PKG_REV="2"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/easyrpg-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="An unofficial libretro port of the EasyRPG/Player."
PKG_LONGDESC="An unofficial libretro port of the EasyRPG/Player."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_USE_CMAKE="no"

make_target() {
  make -C ../builds/libretro -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp ../builds/libretro/easyrpg_libretro.so $INSTALL/usr/lib/libretro/
}
