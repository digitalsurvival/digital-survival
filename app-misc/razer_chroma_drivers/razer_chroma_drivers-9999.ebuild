# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils cmake-utils

MY_PN="${PN}"
MY_PV="${PV/_/-}"
MY_P="${PN}-${MY_PV}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pez2001/${MY_PN}.git
		git://github.com/pez2001/${MY_PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/pez2001/${MY_PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="Razer Chroma keyboard drivers for Linux."
HOMEPAGE="http://pez2001.github.io/razer_chroma_drivers/"
LICENSE="GPL-2"

SLOT="0"
IUSE=""

DEPEND="media-libs/libsdl2
sci-libs/fftw:3.0
app-misc/jq

"

RDEPEND="${DEPEND}
"
