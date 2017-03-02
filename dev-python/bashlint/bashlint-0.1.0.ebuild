# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3} )

inherit distutils-r1

DESCRIPTION="Simple Bash linting tool written in Python"
HOMEPAGE="https://github.com/skudriashev/bashlint"
SRC_URI="https://github.com/skudriashev/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="test? (
	>=dev-python/nose-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/testtools-0.9.34[${PYTHON_USEDEP}] 
	)"
RDEPEND=""

RESTRICT="mirror"

python_test() {
	tox || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && dodoc README.rst
	distutils-r1_python_install_all
}
