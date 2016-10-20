# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sigmavirus24/${PN}.git
	git://github.com/sigmavirus24/${PN}.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	https://github.com/sigmavirus24/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A VCR imitation for python-requests"
HOMEPAGE="https://pypi.python.org/pypi/betamax-matchers
https://github.com/sigmavirus24/betamax_matchers
"
LICENSE="Apache-2.0"
SLOT="0"
IUSE="test"

CDEPEND=">=dev-python/betamax-0.3.2[${PYTHON_USEDEP}]"

DEPEND="${CDEPEND}
>=dev-python/requests-toolbelt-0.4.0[${PYTHON_USEDEP}]"
# Todo write ebuilds for betamax_matchers, betamax-serializers
RDEPEND=" test? ( ${CDEPEND}
	<=dev-python/betamax_matchers-0.4[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}] 
	dev-python/flake8[${PYTHON_USEDEP}] )"

DOCS="README.rst"

python_test() {
	tox || die "tox tests failed under ${EPYTHON}"
    # "${PYTHON}" -m tornado.test.runtests || die "tests failed under ${EPYTHON}"
}
