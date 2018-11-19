# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="sixpair"
PKG_VERSION="23e6e08"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.pabr.org/sixlinux/"
PKG_URL="https://github.com/lakkatv/sixpair/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libusb libusb-compat"
PKG_SECTION="network"
PKG_SHORTDESC="Associate PS3 Sixaxis controller to system bluetoothd via USB"
PKG_LONGDESC="Associate PS3 Sixaxis controller to system bluetoothd via USB"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make sixpair LDLIBS=-lusb
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp sixpair $INSTALL/usr/bin
}
