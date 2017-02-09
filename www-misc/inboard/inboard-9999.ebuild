# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/socioboard/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/socioboard/${PN}/archive/v${PV}.tar.gz"
fi

DESCRIPTION="Socioboard's LinkedIn marketing, management, and analytics software"
HOMEPAGE="http://socioboard.org/"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="dev-lang/mono"
RDEPEND=""

