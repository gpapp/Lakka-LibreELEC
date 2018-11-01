# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="meowpc98"
PKG_VERSION="2b38849"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Unknown"
PKG_SITE="https://github.com/libretro/libretro-meowPC98"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Neko Project 2 (PC98 emulator) port for libretro/RetroArch"
PKG_LONGDESC="Neko Project 2 (PC98 emulator) port for libretro/RetroArch"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make -C libretro -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp libretro/nekop2_libretro.so $INSTALL/usr/lib/libretro/
}
