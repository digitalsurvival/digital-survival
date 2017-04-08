# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} cpython pypy )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="https://github.com/mgedmin/check-manifest https://pypi.python.org/pypi/check-manifest"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz https://github.com/mgedmin/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="
	test? ( dev-python/nose[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/epydoc[${PYTHON_USEDEP}]
	dev-python/twisted-core[${PYTHON_USEDEP}]
	dev-python/twisted-web[${PYTHON_USEDEP}]
	)"
RDEPEND=""

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && dodoc README.rst doc/*.txt
	distutils-r1_python_install_all
}
