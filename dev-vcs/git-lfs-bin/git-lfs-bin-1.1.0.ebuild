# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build

MY_PN="${PN/-bin}"

KEYWORDS="~amd64"
SRC_URI="https://github.com/github/${MY_PN}/releases/download/v${PV}/${MY_PN}-linux-amd64-${PV}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="GitHub's large file storage plugin for git (binary package)"
HOMEPAGE="https://git-lfs.github.com/"
LICENSE="MIT"

SLOT="0"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
>=dev-lang/go-1.5.0"

src_compile() {
	 build_src_compile
}
