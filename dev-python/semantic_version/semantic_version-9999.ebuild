# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5} )

inherit distutils-r1

# Todo this ebuild is needed by dev-python/releases

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rbarrois/${PN}.git
	git://github.com/rbarrois/${PN}.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	https://github.com/rbarrois/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A library implementing the 'SemVer' scheme"
HOMEPAGE="https://python-semanticversion.readthedocs.io/en/latest/
https://pypi.python.org/pypi/${PN}
https://github.com/rbarrois/python-semanticversion
"
LICENSE="BSD"
SLOT="0"
# todo Find dependencies
IUSE="doc test"

DEPEND=">=dev-python/setuptools-0.8"

RDEPEND=""

DOCS="README.rst"

python_test() {
	# tox || die "tox tests failed under ${EPYTHON}"
    # "${PYTHON}" -m tornado.test.runtests || die "tests failed under ${EPYTHON}"
:
}


