# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MY_PN="Milton"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/serge-rgb/${PN}.git"
else
	SRC_URI="https://github.com/serge-rgb/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A modern, cross platform paint package"
HOMEPAGE="https://github.com/serge-rgb/${PN}"
LICENSE="MIT"
SLOT="0"

IUSE=""

DEPEND="x11-libs/gtk+:2
"
RDEPEND="
x11-libs/libxcb
media-gfx/graphite2
"

src_install() {
	# Shaders must be generated
	newbin build/linux-clang-release-default/shadergen ${MY_PN}-shadergen || die
	dobin build/linux-clang-debug-default/${MY_PN} || die
}
