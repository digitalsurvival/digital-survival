# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 pypy )

inherit distutils-r1

MY_PN="python-${PN}"

DESCRIPTION="Encode and decode Base64 without “=” padding"
HOMEPAGE="https://github.com/matrix-org/python-unpaddedbase64
https://pypi.python.org/pypi/unpaddedbase64"
SRC_URI="https://github.com/matrix-org/${MY_PN}/archive/v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="test? ( dev-python/tox[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pep8[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	 )"
RDEPEND=""

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}
