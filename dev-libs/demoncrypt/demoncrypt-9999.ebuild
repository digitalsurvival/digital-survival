# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/eijah/${PN}.git"
	KEYWORDS=""
else
	# There are no releases on GitHub (yet)...
	SRC_URI="https://gitlab.com/eijah/${PN}/repository/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A c++ crypto library for DemonSaw"
HOMEPAGE="https://www.demonsaw.com"
LICENSE="MIT"
SLOT="0"

RDEPEND="dev-libs/crypto++"
DEPEND=""

src_install() {
	emake DESTDIR="${D}" install
	dodoc README.md
}
