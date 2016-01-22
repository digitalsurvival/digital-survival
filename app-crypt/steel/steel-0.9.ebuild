# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit vcs-snapshot

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/Rosvall/steel.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://gitlab.com/Rosvall/${PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"
fi

DESCRIPTION="A command-line password manager supporting AES encryption and 256-bit keys"
HOMEPAGE="http://www.steelpasswordmanager.org/"
LICENSE="GPL-3"

SLOT="0"
IUSE=""

DEPEND="app-crypt/mhash
app-crypt/mcrypt
dev-db/sqlite:3
"

RDEPEND="${DEPEND}
"

src_install() {
    dodir /usr/bin
    emake PREFIX="${D}/usr" install
    dodoc steel.1
}
