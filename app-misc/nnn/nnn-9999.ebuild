# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jarun/${PN}.git"
else
	SRC_URI="https://github.com/jarun/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	
fi

DESCRIPTION="The missing terminal file browser for X"
HOMEPAGE="https://github.com/jarun/nnn"
LICENSE="BSD-2"
SLOT="0"

IUSE=""

DEPEND="sys-libs/ncurses:0
		sys-libs/readline:0"
RDEPEND=""
