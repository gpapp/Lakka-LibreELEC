# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="joyutils"
PKG_VERSION="1.2.15"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://atrey.karlin.mff.cuni.cz/~vojtech/joystick/"
PKG_URL="ftp://atrey.karlin.mff.cuni.cz/pub/linux/joystick/joystick-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="jscal, jstest, and jsattach utilities for the Linux joystick driver"
PKG_LONGDESC="jscal, jstest, and jsattach utilities for the Linux joystick driver"
PLG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  $CC -lm -o jscal jscal.c $CFLAGS
  $CC -lm -o jstest jstest.c $CFLAGS
  $CC -lm -o jsattach jsattach.c $CFLAGS
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp jscal $INSTALL/usr/bin/
  cp jstest $INSTALL/usr/bin/
  cp jsattach $INSTALL/usr/bin/
}
