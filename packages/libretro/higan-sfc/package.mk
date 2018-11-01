# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="higan-sfc"
PKG_VERSION="d3f5920"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://gitlab.com/higan/higan"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_GIT_BRANCH="libretro"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="higan, the multi-system emulator"
PKG_LONGDESC="higan emulates a number of classic video-game consoles of the 1980s and 1990s, allowing you to play classic games on a modern general-purpose computer"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  cd $PKG_BUILD/higan
  make -f GNUmakefile compiler=$TOOLCHAIN/bin/$TARGET_NAME-g++ target=libretro binary=library
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp out/higan_sfc_libretro.so $INSTALL/usr/lib/libretro/
}
