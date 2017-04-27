# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_SRC="github.com/ChrisRx"
EGO_PN="${EGO_SRC}/${PN}"

if [[ "${PV}" == "9999" ]]; then
	inherit golang-vcs
else
	inherit golang-vcs-snapshot
	SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A FUSE filesystem and dungeon crawling adventure game engine"
HOMEPAGE="https://github.com/ChrisRx/"
LICENSE="DSB-2"
SLOT="0"

IUSE=""

DEPEND=">=dev-lang/go-1.6.0"
RDEPEND="${DEPEND}"
