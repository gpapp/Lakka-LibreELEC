# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="openlara"
PKG_VERSION="7f37a21"
PKG_REV="1"
PKG_ARCH="i386 x86_64"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/libretro/openlara"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Classic Tomb Raider open-source engine"
PKG_LONGDESC="Classic Tomb Raider open-source engine"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  case $PROJECT in
    RPi|RPi2|Gamegirl|Slice|Slice3)
      CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads \
                      -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"
      make -C src/platform/libretro GLES=1
      ;;
    imx6)
      CFLAGS="$CFLAGS -DLINUX -DEGL_API_FB"
      CPPFLAGS="$CPPFLAGS -DLINUX -DEGL_API_FB"
      make -C src/platform/libretro
      ;;
    *)
      make -C src/platform/libretro
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp src/platform/libretro/*_libretro.so $INSTALL/usr/lib/libretro/
}
