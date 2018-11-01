# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="atari800"
PKG_VERSION="b3931bb"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-atari800"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="atari800 3.1.0 for libretro/libco WIP"
PKG_LONGDESC="atari800 3.1.0 for libretro/libco WIP"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  strip_lto
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp atari800_libretro.so $INSTALL/usr/lib/libretro/
}
