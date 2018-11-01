# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gme"
PKG_VERSION="a47f71f"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/libretro-gme"
PKG_URL="https://github.com/libretro/libretro-gme/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Port of blargg's Game_Music_Emu library."
PKG_LONGDESC="Port of blargg's Game_Music_Emu library."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp gme_libretro.so $INSTALL/usr/lib/libretro/
}

