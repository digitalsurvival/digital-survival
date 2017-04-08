# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_3 pypy cpython )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="https://pypi.python.org/pypi/readme_renderer https://github.com/pypa/readme_renderer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz https://github.com/pypa/${PN}/archive/${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="
	>=dev-python/bleach-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/docutils0.13.1[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	
	test? ( dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pep8[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}] )
	"
RDEPEND=""

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && dodoc README.rst doc/*.txt
	distutils-r1_python_install_all
}
