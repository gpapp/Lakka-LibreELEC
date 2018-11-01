# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="higan-sfc-balanced"
PKG_VERSION="5e965d0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/nSide"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="A fork of higan v106 by byuu, which was renamed to exclude \"higan\" at byuu's request."
PKG_LONGDESC="$PKG_SHORTDESC"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  cd $PKG_BUILD/nSide
  make -f GNUmakefile compiler=$TOOLCHAIN/bin/$TARGET_NAME-g++ target=libretro binary=library
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp out/higan_sfc_balanced_libretro.so $INSTALL/usr/lib/libretro/
}
