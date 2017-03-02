# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5} pypy )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Robpol86/${PN}.git
	git://github.com/Robpol86/${PN}.git"
else
	SRC_URI="https://github.com/Robpol86/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Generate tables in the terminal with Python"
HOMEPAGE="https://github.com/Robpol86/${PN}"
LICENSE="MIT"

SLOT="0"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="test? ( dev-python/tox[${PYTHON_USEDEP}]
	=dev-python/coverage-4.0.3[${PYTHON_USEDEP}]
	=dev-python/flake8-2.5.4[${PYTHON_USEDEP}]
	=dev-python/flake8-import-order-0.5[${PYTHON_USEDEP}]
	=dev-python/flake8-pep257-1.0.5[${PYTHON_USEDEP}]
	=dev-python/pep8-naming-0.3.3[${PYTHON_USEDEP}]
	=dev-python/pylint-1.5.4[${PYTHON_USEDEP}]
	)"

RESTRICT="mirror"

python_test() {
	tox || die "Tests failed under ${EPYTHON}"
}

python_install() {
	distutils-r1_python_install
}
