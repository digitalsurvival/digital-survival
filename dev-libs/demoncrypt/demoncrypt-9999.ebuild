# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit vcs-snapshot

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/eijah/${PN}.git"
else
	# There are no releases on GitHub yet...
	SRC_URI="https://gitlab.com/eijah/${PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"
fi

DESCRIPTION="A c++ crypto library for DemonSaw"
HOMEPAGE="https://www.demonsaw.com"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/crypto++"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install
	dodoc README.md
}
