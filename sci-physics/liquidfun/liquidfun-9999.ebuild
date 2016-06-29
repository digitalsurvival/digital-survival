# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils cmake-utils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com//${PN}.git
		git://github.com//${PN}.git"
		KEYWORDS=""
else
	SRC_URI="https://github.com/digitalsurvival/${PN}/archive/${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Two step authentication for SSH using one time passwords"
HOMEPAGE="https://github.com/digitalsurvival/ppp-pam"
LICENSE="GPL-2"
SLOT="0"

DEPEND=""

RDEPEND="virtual/pam
	${DEPEND}
	"


LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
