# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nokiatech/${PN}.git
		git://github.com/nokiatech/${PN}.git"
else
	SRC_URI="https://github.com/nokiatech/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi
DESCRIPTION="High Efficiency Image File Format"
HOMEPAGE="https://nokiatech.github.io/heif/
	https://github.com/nokiatech/heif"

LICENSE="HEIF"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
