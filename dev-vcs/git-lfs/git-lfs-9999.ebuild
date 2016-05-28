# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/github"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/github/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://${GOLANG_PKG_IMPORTPATH}/${PN}/archive/v${PV}.tar.gz -> ${PV}.tar.gz"
fi

DESCRIPTION="GitHub's large file storage plugin for git"
HOMEPAGE="https://git-lfs.github.com/ https://${GOLANG_PKG_IMPORTPATH}/${PN}"
LICENSE="MIT"

SLOT="0"
IUSE=""

DEPEND=">=dev-lang/go-1.5.0"

RDEPEND="${DEPEND}"

use test && RESTRICT+=" sandbox"

src_prepare() {
        golang-single_src_prepare
}

src_install() {
        golang-single_src_install
}
