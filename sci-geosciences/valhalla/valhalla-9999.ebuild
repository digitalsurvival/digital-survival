# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	
fi

# This repository contains submodules (lots of them from a brief look at it)

DESCRIPTION="Open Source Routing Engine for OpenStreetMap"
HOMEPAGE="https://github.com/valhalla/valhalla"
LICENSE="MIT"
SLOT="0"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
