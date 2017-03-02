# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4} ) 

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/asweigart/${PN}.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
	
fi

DESCRIPTION="A simple, cross-platform screenshot module"
HOMEPAGE="https://github.com/asweigart/pyscreeze"
LICENSE="BSD"
SLOT="0"

IUSE="doc test"

DEPEND=""
RDEPEND="dev-python/pillow[${PYTHON_USEDEP}]"
