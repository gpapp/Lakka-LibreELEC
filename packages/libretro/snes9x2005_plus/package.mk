# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="snes9x2005_plus"
PKG_VERSION="30fe01d"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Non-commercial"
PKG_SITE="https://github.com/libretro/snes9x2005"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Snes9x 2005 Plus."
PKG_LONGDESC="Snes9x 2005 Plus. Port of SNES9x 1.43 for libretro (was previously called CAT SFC) with enabled BLARRG APU."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_MAKE_OPTS_TARGET="USE_BLARGG_APU=1"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp snes9x2005_plus_libretro.so $INSTALL/usr/lib/libretro/
}
