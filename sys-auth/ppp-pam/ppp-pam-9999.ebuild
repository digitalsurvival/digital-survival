# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit eutils cmake-utils

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/digitalsurvival/ppp-pam.git
		git://github.com/digitalsurvival/ppp-pam.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/digitalsurvival/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi


DESCRIPTION="Two step authentication for SSH using one time passwords."
HOMEPAGE="https://github.com/digitalsurvival/ppp-pam"
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