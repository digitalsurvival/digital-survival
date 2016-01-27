# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit vcs-snapshot
inherit golang-build

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/github/git-lfs.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/github/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi
DESCRIPTION="An open source large file storage plugin for git"
HOMEPAGE="https://git-lfs.github.com/"
LICENSE="MIT"

SLOT="0"
IUSE=""

DEPEND=">=dev-lang/go-1.5.0"

RDEPEND="${DEPEND}"

src_compile() {
	 build_src_compile
}
