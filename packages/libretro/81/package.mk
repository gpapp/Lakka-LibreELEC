# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="81"
PKG_VERSION="089fcb1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/81-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="A port of the EightyOne ZX81 Emulator to libretro"
PKG_LONGDESC="A port of the EightyOne ZX81 Emulator to libretro"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp 81_libretro.so $INSTALL/usr/lib/libretro/
}
