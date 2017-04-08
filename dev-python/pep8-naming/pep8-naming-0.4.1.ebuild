# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5} pypy )

inherit distutils-r1

DESCRIPTION="Naming Convention checker for Python"
HOMEPAGE="https://pypi.python.org/pypi/pep8-naming
	https://github.com/PyCQA/pep8-naming"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	https://github.com/PyCQA/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test doc"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/tox[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	>=dev-python/twine-1.4.0[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	)"
RDEPEND=""

python_test() {
	tox || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && dodoc README.rst
	distutils-r1_python_install_all
}
