# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="emux-sms"
PKG_VERSION="bc2648a"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/emux"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Libretro port of Emux"
PKG_LONGDESC="Emux is a cross-platform emulator project supporting various machines with an architecture inspired by the Linux kernel."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make -C libretro -f Makefile.lakka MACHINE=sms
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp libretro/emux_sms_libretro.so $INSTALL/usr/lib/libretro/emux_sms_libretro.so
}
