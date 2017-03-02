# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bitprophet/${PN}.git
	git://github.com/bitprophet/${PN}.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	https://github.com/bitprophet/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Sphinx changelog-generator extension"
HOMEPAGE="http://releases.readthedocs.io/
https://pypi.python.org/pypi/${PN}
https://github.com/bitprophet/${PN}
"
LICENSE="Apache-2.0"
SLOT="0"
# todo Find dependencies
IUSE="doc test"

DEPEND=""

RDEPEND=""

DOCS="README.rst"

python_test() {
	# tox || die "tox tests failed under ${EPYTHON}"
    # "${PYTHON}" -m tornado.test.runtests || die "tests failed under ${EPYTHON}"
:
}


