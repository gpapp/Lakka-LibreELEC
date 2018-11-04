# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-vram-test"
PKG_VERSION="8452cd9"
PKG_SHA256="0803a06c42acc78b12dd71183ffbed62ef3630cf82a3714ab1dd705467bb51ca"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-samples"
PKG_URL="https://github.com/libretro/libretro-samples/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="VRAM Test from libretro"
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="testsw_vram_libretro.so"
PKG_LIBPATH="$PKG_BUILD/video/software/rendering_direct_to_vram/$PKG_LIBNAME"
PKG_LIBVAR="VRAM-TEST_LIB"

make_target() {
  cd $PKG_BUILD/video/software/rendering_direct_to_vram
  make
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
