# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="psp1"
PKG_VERSION="edf1cb7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/PSP1"
PKG_URL="$LAKKA_MIRROR/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Non-shallow fork of PPSSPP for libretro exclusively."
PKG_LONGDESC="A fast and portable PSP emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  strip_lto
}

make_target() {
  cd $PKG_BUILD/libretro
  if [ "$OPENGLES" == "gpu-viv-bin-mx6q" ]; then
    CFLAGS="$CFLAGS -DLINUX -DEGL_API_FB"
    CXXFLAGS="$CXXFLAGS -DLINUX -DEGL_API_FB"
  fi
  if [ "$ARCH" == "arm" ]; then
    SYSROOT_PREFIX=$SYSROOT_PREFIX make platform=imx6
  else
    make
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp ../libretro/ppsspp_libretro.so $INSTALL/usr/lib/libretro/
}
