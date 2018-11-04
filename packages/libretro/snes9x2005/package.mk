# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="snes9x2005"
PKG_VERSION="f4a5a7a"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Non-commercial"
PKG_SITE="https://github.com/libretro/snes9x2005"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Snes9x 2005."
PKG_LONGDESC="Snes9x 2005. Port of SNES9x 1.43 for libretro (was previously called CAT SFC)."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp snes9x2005_libretro.so $INSTALL/usr/lib/libretro/
}
