# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="chailove"
PKG_VERSION="14e0a09"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-chailove"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="ChaiLove: 2D Game Framework"
PKG_LONGDESC="Framework to create 2D games with ChaiScript."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
  cd $PKG_BUILD
}

makeinstall_target() {
  make install INSTALLDIR="$INSTALL/usr/lib/libretro"
}
