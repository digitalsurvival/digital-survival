# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/opentomb/${PN}.git"
else
	SRC_URI="https://github.com/opentomb/${PN}/archive/win32-2017-04-24_alpha.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	
fi

DESCRIPTION="Open-source Tomb Raider 1-5 engine remake"
HOMEPAGE="https://opentomb.github.io/"
LICENSE="GPL-3"
SLOT="0"

IUSE=""

DEPEND=">=dev-util/cmake-3.2.0
		sys-libs/zlib
		media-libs/openal
		media-libs/libsdl2[threads]
		media-libs/libpng
		>=dev-lang/lua-5.2.0
		virtual/libc
		"
RDEPEND=""
