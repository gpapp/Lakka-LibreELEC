# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="px68k"
PKG_VERSION="75df0ad"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Unknown"
PKG_SITE="https://github.com/libretro/px68k-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Portable SHARP X68000 Emulator for PSP, Android and other platforms"
PKG_LONGDESC="Portable SHARP X68000 Emulator for PSP, Android and other platforms"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp px68k_libretro.so $INSTALL/usr/lib/libretro/
}
