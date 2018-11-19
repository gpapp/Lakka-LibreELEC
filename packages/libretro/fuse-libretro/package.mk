# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="fuse-libretro"
PKG_VERSION="ab0c67e"
PKG_REV="1"
PKG_ARCH="i386 x86_64 arm"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/fuse-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="A port of the Fuse Unix Spectrum Emulator to libretro "
PKG_LONGDESC="A port of the Fuse Unix Spectrum Emulator to libretro "

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp fuse_libretro.so $INSTALL/usr/lib/libretro/
}
