# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="core-info"
PKG_VERSION="985ceb8"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-super"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Info files for libretro cores"
PKG_LONGDESC="Super repo for other libretro projects. Fetches, builds and installs."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp dist/info/*.info $INSTALL/usr/lib/libretro/
}

