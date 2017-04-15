# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
# This is a go ebuild
if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ChrisRx/${PN}.git"
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
	
fi

DESCRIPTION="A FUSE filesystem and dungeon crawling adventure game engine"
HOMEPAGE="https://github.com/ChrisRx/"
LICENSE="DSB-2"
SLOT="0"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
