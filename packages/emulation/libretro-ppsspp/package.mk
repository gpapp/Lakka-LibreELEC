# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-ppsspp"
PKG_VERSION="caa506bf2a253a99850a4248a1cb5a399f32467a"
PKG_SHA256="d59b4d044b761a73e744ab71e207e5b3bdbac819ed2201b79ed4455606ac0719"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/hrydgard/ppsspp"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain glew p8-platform SDL2 zlib"
PKG_SECTION="emulation"
PKG_SHORTDESC="A PSP emulator for Android, Windows, Mac, Linux and Blackberry 10, written in C++."
PKG_LONGDESC="A PSP emulator for Android, Windows, Mac, Linux and Blackberry 10, written in C++."
PKG_TOOLCHAIN="cmake-make"

PKG_LIBNAME="ppsspp_libretro.so"
PKG_LIBPATH="lib/$PKG_LIBNAME"
PKG_LIBVAR="PPSSPP_LIB"

PKG_CMAKE_OPTS_TARGET="-DLIBRETRO=ON"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -lpthread"
}

pre_make_target() {
  find . -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
