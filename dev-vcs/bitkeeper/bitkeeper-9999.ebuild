# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bitkeeper-scm/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://www.bitkeeper.org/downloads/${PV}ce/bk-${PV}ce.src.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="The original distributed source management system"
HOMEPAGE="https://www.bitkeeper.org/"
LICENSE="Apache-2.0"

SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

#use test && RESTRICT+=" sandbox"

src_prepare() {
:
}

src_install() {
:
}
