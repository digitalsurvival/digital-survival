# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils
DESCRIPTION="hqx is a fast, high-quality magnification filter designed for pixel art"
HOMEPAGE="https://code.google.com/p/hqx/"
SRC_URI="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"

SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=">=media-libs/devil-1.1"
RDEPEND="${DEPEND}"

src_compile() {
	# Old enough that I force a re-autoconf.
	MAKEOPTS=-j1 emake || die "Emake failed"
}
