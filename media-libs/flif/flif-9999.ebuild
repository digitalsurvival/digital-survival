# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/flif-hub/${PN}.git
		git://github.com/flif-hub/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	inherit versionator
	MY_PV="$(replace_version_separator '_' '-' ${PV})"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="https://github.com/flif-hub/${PN}/archive/v${MY_PV}.tar.gz"
fi

DESCRIPTION="Free Lossless Image Format"
HOMEPAGE="http://flif.info/
	https://github.com/FLIF-hub/FLIF"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/${MY_P}"

DEPEND=""
RDEPEND="${DEPEND}"
