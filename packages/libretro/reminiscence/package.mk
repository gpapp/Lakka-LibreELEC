# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="reminiscence"
PKG_VERSION="d291e0c"
PKG_ARCH="any"
PKG_SITE="https://github.com/libretro/REminiscence"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Port of Gregory Montoir's Flashback emulator, running as a libretro core."
PKG_LONGDESC="Port of Gregory Montoir's Flashback emulator, running as a libretro core."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target () {
  : # nothing to do
}

make_target() {
  cd $PKG_BUILD
  make
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp reminiscence_libretro.so $INSTALL/usr/lib/libretro/
}
