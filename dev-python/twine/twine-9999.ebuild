# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy)

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pypa/${PN}.git
	git://github.com/pypa/${PN}.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	https://github.com/pypa/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Utilities for interacting with PyPI"
HOMEPAGE="https://pypi.python.org/pypi/twine
https://github.com/pypa/twine
"
LICENSE="Apache-2.0"
SLOT="0"
IUSE="doc test"


DEPEND="dev-python/clint:0[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.5.1[${PYTHON_USEDEP}]
	>=dev-python/setuptools-0.7.0[${PYTHON_USEDEP}]"
# Todo write ebuilds for betamax_matchers, betamax-serializers
RDEPEND=" test? ( 
	dev-python/coverage:0[${PYTHON_USEDEP}]
	dev-python/pretend:0[${PYTHON_USEDEP}] 
	dev-python/pytest:0[${PYTHON_USEDEP}]
	dev-python/flake8:0[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx:0[${PYTHON_USEDEP}]
	dev-python/sphinx_rtd_theme:0[${PYTHON_USEDEP}]
	dev-python/releases:0[${PYTHON_USEDEP}] )"

DOCS="README.rst"

python_test() {
	tox || die "tox tests failed under ${EPYTHON}"
    # "${PYTHON}" -m tornado.test.runtests || die "tests failed under ${EPYTHON}"
}


