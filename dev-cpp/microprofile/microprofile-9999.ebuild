# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jonasmr/${PN}.git"
else
	SRC_URI=""
	KEYWORDS="~amd64"
fi

DESCRIPTION=""
HOMEPAGE=""
LICENSE=""
SLOT="0"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
