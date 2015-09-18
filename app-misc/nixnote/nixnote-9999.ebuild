# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit eutils cmake-utils

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/baumgarr/nixnote2.git
		git://github.com/baumgarr/nixnote2.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/baumgarr/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi


DESCRIPTION="An open source Evernote clone for Linux."
HOMEPAGE="https://github.com/baumgarr/Nixnote2"
LICENSE="GPL-2"

SLOT="0"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

src_prepare() {

}

src_configure() {

}

pkg_postinst() {

}