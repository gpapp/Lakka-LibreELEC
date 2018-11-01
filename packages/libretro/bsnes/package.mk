# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="bsnes"
PKG_VERSION="c6e90dd"
PKG_REV="1"
PKG_ARCH="x86_64 i386"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/bsnes-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Libretro fork of bsnes. As close to upstream as possible."
PKG_LONGDESC="Libretro fork of bsnes. As close to upstream as possible."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp out/bsnes_accuracy_libretro.so $INSTALL/usr/lib/libretro/
}
