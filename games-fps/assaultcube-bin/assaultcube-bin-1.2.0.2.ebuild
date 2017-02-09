# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit vcs-snapshot

# https://github.com/assaultcube/AC/releases/download/v1.2.0.2/AssaultCube_v1.2.0.2.tar.bz2

# Cleanly make necessary adjustments for SRC_URI
MY_PN="assaultcube"
MY_PV="v${PV}"
MY_P="${MY_PN}_${MY_PV}"

DESCRIPTION="A next-generation open source text editor for rapid software development."
HOMEPAGE="http://lighttable.com/"
SRC_URI="https://github.com/${MY_PN}/AC/releases/download/${MY_PV}/${MY_P}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="ZLIB freedist"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	vcs-snapshot_src_unpack
}

S="${WORKDIR}/${P}"

src_install() {
	dodir /opt
	cp -R "${S}/" "${D}/opt" || die "install failed!"
	dodir /usr/bin
	dosym /opt/${P}/assaultcube.sh /usr/bin/assaultcube-bin || die "dosym failed!"
}
