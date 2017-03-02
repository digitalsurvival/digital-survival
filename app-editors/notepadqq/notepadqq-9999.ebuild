# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}/${PN}"
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Notepad++-like editor for Linux"
HOMEPAGE="http://notepadqq.altervista.org https://github.com/notepadqq/notepadqq"
LICENSE="GPL-3"
SLOT="0"

IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwebkit:5
	dev-qt/qtsvg:5

"
RDEPEND="${DEPEND}"

src_configure() {
	econf --prefix ${EPREFIX}
}
