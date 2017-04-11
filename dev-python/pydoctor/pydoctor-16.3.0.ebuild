# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1

DESCRIPTION="A Python API documentation generator that works by static analysis"
HOMEPAGE="https://pypi.python.org/pypi/pydoctor
	https://github.com/twisted/pydoctor"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	https://github.com/twisted/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND=" 
	test? ( dev-python/nose[${PYTHON_USEDEP}]
			dev-python/zope-interface[${PYTHON_USEDEP}]
			dev-pytho:n/epydoc[${PYTHON_USEDEP}]
			dev-python/twisted-core[${PYTHON_USEDEP}]
			dev-python/twisted-web[${PYTHON_USEDEP}]
			dev-python/docutils[${PYTHON_USEDEP}] )" 
			# dev-python/pyflakes[${PYTHON_USEDEP}]
RDEPEND=""

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && dodoc doc/*.txt
	distutils-r1_python_install_all
}
