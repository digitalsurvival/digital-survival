# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit fonts

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tonsky/${PN}.git
		git://github.com/tonsky/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/tonsky/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Monospaced font with programming ligatures"
HOMEPAGE="https://github.com/tonsky/FiraCode"
LICENSE="OFL-1.1"

IUSE="examples"

SLOT="0"
DEPEND=""
RDEPEND=""

src_install() {
	
}
