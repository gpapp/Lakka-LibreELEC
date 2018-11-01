# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="cannonball"
PKG_VERSION="f96f37b"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/cannonball"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Cannonball: An Enhanced OutRun Engine"
PKG_LONGDESC="Cannonball: An Enhanced OutRun Engine"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp cannonball_libretro.so $INSTALL/usr/lib/libretro/
}
