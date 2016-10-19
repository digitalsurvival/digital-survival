# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/serge-rgb/${PN}.git"
else
	SRC_URI="https://github.com/serge-rgb/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A modern paint package"
HOMEPAGE="https://github.com/serge-rgb/${PN}"
LICENSE="MIT"
SLOT="0"

IUSE=""

DEPEND="x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

#src_install() {
#
#}
