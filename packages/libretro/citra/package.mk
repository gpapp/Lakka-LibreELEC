# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="citra"
PKG_VERSION="a0c222c"
PKG_REV="1"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://github.com/libretro/citra"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain boost curl"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="A Nintendo 3DS Emulator"
PKG_LONGDESC="A Nintendo 3DS Emulator"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_OPTS_TARGET="-DENABLE_LIBRETRO=1 \
                       -DENABLE_SDL2=0 \
                       -DENABLE_QT=0 \
                       -DCMAKE_BUILD_TYPE=\"Release\" \
                       -DBOOST_ROOT=$(get_build_dir boost) \
                       -DUSE_SYSTEM_CURL=1 \
                       -DTHREADS_PTHREAD_ARG=OFF \
                       -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
                       -DCMAKE_VERBOSE_MAKEFILE=1 \
                       --target citra_libretro"

PKG_COPY_HEADER_FILES="stdlib.h math.h"

pre_configure_target() {
  if [ -n "$PKG_COPY_HEADER_FILES" ] ; then
    for x in $PKG_COPY_HEADER_FILES ; do
      cp -v $SYSROOT_PREFIX/usr/include/$x $TOOLCHAIN/$TARGET_NAME/include/
    done
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp src/citra_libretro/citra_libretro.so $INSTALL/usr/lib/libretro/
}

post_makeinstall_target() {
  if [ -n "$PKG_COPY_HEADER_FILES" ] ; then
    for x in $PKG_COPY_HEADER_FILES ; do
      rm -vf $TOOLCHAIN/$TARGET_NAME/include/$x
    done
  fi
}
