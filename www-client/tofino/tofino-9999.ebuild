# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Mozilla's experimental browser written in Rust"
HOMEPAGE="https://mozilla.github.io/tofino/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
