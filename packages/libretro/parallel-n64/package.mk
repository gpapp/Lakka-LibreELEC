# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="parallel-n64"
PKG_VERSION="d4d8f47"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/parallel-n64"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Optimized/rewritten Nintendo 64 emulator made specifically for Libretro. Originally based on Mupen64 Plus."
PKG_LONGDESC="Optimized/rewritten Nintendo 64 emulator made specifically for Libretro. Originally based on Mupen64 Plus."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  DYNAREC=$ARCH

  if [ "$ARCH" == "i386" ]; then
    DYNAREC=x86
  fi

  if [ "$PROJECT" == "RPi" -o "$PROJECT" == "Gamegirl" -o "$PROJECT" == "Slice" ]; then
    make platform=rpi
  elif [[ "$TARGET_FPU" =~ "neon" ]]; then
    CFLAGS="$CFLAGS -DGL_BGRA_EXT=0x80E1" # Fix build for platforms where GL_BGRA_EXT is not defined
    make platform=armv-gles-neon
  elif [ "$PROJECT" ==  "Rockchip" -a "$ARCH" == "aarch64" ]; then
    LDFLAGS="$LDFLAGS -lpthread"
    make FORCE_GLES=1 HAVE_PARALLEL=1
  else
    LDFLAGS="$LDFLAGS -lpthread"
    make WITH_DYNAREC=$DYNAREC HAVE_PARALLEL=0
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp parallel_n64_libretro.so $INSTALL/usr/lib/libretro/
}
