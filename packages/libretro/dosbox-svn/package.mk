# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dosbox-svn"
PKG_VERSION="461040f"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/fr500/dosbox-svn"
PKG_URL="https://github.com/fr500/dosbox-svn/archive/$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain SDL SDL_net"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Upstream port of DOSBox to libretro"
PKG_LONGDESC="Upstream port of DOSBox to libretro"
PKG_TOOLCHAIN="configure"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  ./autogen.sh
}

make_target() {
  if [ "$ARCH" = "aarch64" ]; then
    make -C libretro target=arm64 WITH_EMBEDDED_SDL=0
  elif [ "$ARCH" = "arm" ]; then
    make -C libretro target=arm WITH_EMBEDDED_SDL=0
  elif [ "$ARCH" = "x86_64" ]; then
    make -C libretro target=x86_64 WITH_EMBEDDED_SDL=0
  elif [ "$ARCH" = "i386" ]; then 
    make -C libretro target=x86 WITH_EMBEDDED_SDL=0
  else
    make -C libretro WITH_EMBEDDED_SDL=0
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_BUILD/libretro/dosbox_svn_libretro.so $INSTALL/usr/lib/libretro
}
