# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit vcs-snapshot

MY_PN="lighttable"
MY_P="${MY_PN}-${PV/_/-}-linux"

DESCRIPTION="A next-generation open source text editor for rapid software development."
HOMEPAGE="http://lighttable.com/"
SRC_URI="https://github.com/LightTable/${MY_PN}/releases/download/${PV/_/-}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	vcs-snapshot_src_unpack
}

S=${WORKDIR}/${P}

src_install() {
	dodir /opt
	cp -R "${S}/" "${D}/opt" || die "install failed!"
	dodir /usr/bin
	dosym /opt/${P}/light /usr/bin/lighttable-bin || die "dosym failed!"
	#newexe light lighttable-bin || "newexe failed"
}
