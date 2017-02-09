# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Robpol86/${PN}.git
	git://github.com/Robpol86/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/Robpol86/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Generate tables in the terminal with Python"
HOMEPAGE="https://robpol86.github.io/${PN}/
	https://github.com/Robpol86/${PN}"
LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"

RDEPEND=""

python_install() {
	distutils-r1_python_install
}
