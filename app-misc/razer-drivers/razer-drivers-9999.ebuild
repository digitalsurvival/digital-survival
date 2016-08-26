# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils cmake-utils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/terrycain/${PN}.git
		git://github.com/terrycain/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/terrycain/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Razer keyboard and mouse drivers for Linux"
HOMEPAGE="http://pez2001.github.io/razer_chroma_drivers/"
LICENSE="GPL-2"

SLOT="0"
IUSE=""

DEPEND="media-libs/libsdl2
sci-libs/fftw:3.0
app-misc/jq"

RDEPEND=""
