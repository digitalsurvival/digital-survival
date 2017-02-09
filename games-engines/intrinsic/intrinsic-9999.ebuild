# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit check-reqs eutils

if [[ "${PV}" == "9999" ]]; then
	EGIT_HAS_SUBMODULES=1
	EGIT_REPO_URI="https://github.com/begla/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/begla/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A Vulkan based cross-platform game and rendering engine"
HOMEPAGE="http://www.intrinsic-engine.com"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

# Requires vulkan sdk https://github.com/farmboy0/portage-overlay

DEPEND=">=dev-util/cmake-3.5.0"
# dev-cpp/microprofile

RDEPEND=""

#S="${WORKDIR}"
src_install() {
:
}

pkg_postinst() {
:
}
