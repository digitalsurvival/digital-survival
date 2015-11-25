# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit vcs-snapshot

# Cleanly make necessary adjustments for SRC_URI
MY_PN="lighttable"
MY_PV="${PV/_/-}"
MY_P="${MY_PN}-${MY_PV}-linux"

DESCRIPTION="A next-generation open source text editor for rapid software development."
HOMEPAGE="http://lighttable.com/"
SRC_URI="https://github.com/LightTable/${MY_PN}/releases/download/${MY_PV}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/atk
dev-libs/expat
dev-libs/glib
dev-libs/nspr
dev-libs/nss
gnome-base/gconf
media-libs/alsa-lib
media-libs/fontconfig
media-libs/freetype
net-print/cups
sys-apps/dbus
sys-devel/gcc
sys-libs/glibc
x11-libs/cairo
x11-libs/gdk-pixbuf
x11-libs/gtk+
x11-libs/libnotify
x11-libs/libX11
x11-libs/libXcomposite
x11-libs/libXcursor
x11-libs/libXdamage
x11-libs/libXext
x11-libs/libXfixes
x11-libs/libXi
x11-libs/libXrandr
x11-libs/libXrender
x11-libs/libXtst
x11-libs/pango
"

src_unpack() {
	vcs-snapshot_src_unpack
}

S="${WORKDIR}/${P}"

src_install() {
	dodir /opt
	cp --archive "${S}/" "${D}/opt" || die "install failed!"
	chmod +x /opt/${P}/LightTable
	dodir /usr/bin
	dosym /opt/${P}/light /usr/bin/lighttable-bin || die "dosym failed!"
	#newexe light lighttable-bin || "newexe failed"
}
