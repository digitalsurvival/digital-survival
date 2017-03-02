# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/vjousse/${PN}-book.git"
else
	SRC_URI="https://github.com/vjousse/${PN}-book/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"	
fi

DESCRIPTION="Vim for humans ebook"
HOMEPAGE="https://vimebook.com/en"
LICENSE="CC-BY-4.0"
SLOT="0"

IUSE=""

DEPEND="app-text/texlive:0
dev-python/sphinx:0[latex]
dev-python/pygments:0
"
RDEPEND="${DEPEND}"


