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
sys-libs/glibc
x11-libs/gtk+
dev-libs/atk
media-libs/harfbuzz
x11-libs/pango
x11-libs/cairo
media-libs/freetype
media-libs/fontconfig
x11-libs/gdk-pixbuf
dev-libs/glib
sys-apps/dbus
x11-libs/libX11
x11-libs/libXrandr
x11-libs/libXext
gnome-base/gconf

x11-libs/libxcb
x11-libs/libxshmfence
x11-libs/libXxf86vm
dev-libs/libtasn1
dev-libs/nettle
dev-libs/gmp
media-gfx/graphite2
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
