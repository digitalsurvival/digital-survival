# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/soveran/${PN}.git"
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A command line, stack-based calculator with postfix notation"
HOMEPAGE="https://github.com/soveran/clac"
LICENSE="BSD-2"
SLOT="0"

IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	emake PREFIX="${D}"usr install
}
