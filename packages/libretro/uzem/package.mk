# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="uzem"
PKG_VERSION="598cd0b"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-uzem"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_PATCH_DIRS="libretro"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="A retro-minimalist game console engine for the ATMega644"
PKG_LONGDESC="A retro-minimalist game console engine for the ATMega644"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp uzem_libretro.so $INSTALL/usr/lib/libretro/
}
