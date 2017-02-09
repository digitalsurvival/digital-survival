# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

CMAKE_MIN_VERSION=2.8
inherit cmake-utils eutils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/erincatto/${MY_PN}.git
	"
	KEYWORDS=""
else
	# There are no releases on GitHub (yet)...
	SRC_URI="https://gitlab.com/erincatto/${PN}/repository/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="An open source physics engine"
HOMEPAGE="http://www.box2d.org"
EGIT_REPO_URI="https://github.com/erincatto/${PN}"

LICENSE="ZLIB"
SLOT="0"
IUSE=""

RDEPEND="media-libs/freeglut
	app-arch/unzip"
DEPEND=""

src_configure() {
	mycmakeargs="${mycmakeargs} -DBOX2D_BUILD_SHARED=ON"

	cmake-utils_src_configure
}
