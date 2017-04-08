# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 pypy cpython )

inherit distutils-r1

MY_PN="${PN}/-/."

DESCRIPTION=""
HOMEPAGE="https://github.com/zestsoftware/zest.releaser
https://zestreleaser.readthedocs.io/en/latest/
https://pypi.python.org/pypi/zest.releaser"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz https://github.com/zestsoftware/${MY_PN}/archive/${PN}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/six${PYTHON_USEDEP}]
	>=dev-python/twine-1.6.0[${PYTHON_USEDEP}]
	
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/check-manifest[${PYTHON_USEDEP}]
	dev-python/pyroma[${PYTHON_USEDEP}]
	
	dev-python/wheel[${PYTHON_USEDEP}]

	test? ( 
	)"
RDEPEND=""

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && dodoc README.rst doc/*.txt
	distutils-r1_python_install_all
}
