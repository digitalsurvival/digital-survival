# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils cmake-utils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lah7/${PN}.git
		git://github.com/lah7/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/lah7/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A graphical front end for managing Razer peripherals"
HOMEPAGE="https://github.com/lah7/polychromatic"
LICENSE="GPL-2"

SLOT="0"
IUSE=""

DEPEND=""

RDEPEND=""
