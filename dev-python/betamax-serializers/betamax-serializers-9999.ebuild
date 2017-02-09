# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/praw-dev/${PN}.git
	git://github.com/praw-dev/${PN}.git"
else
	SRC_URI="https://github.com/praw-dev/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Low-level communication layer for PRAW 4+."
HOMEPAGE="https://pypi.python.org/pypi/prawcore
https://github.com/praw-dev/prawcore
"
LICENSE="BSD-2"
SLOT="0"
IUSE="examples test"

DEPEND="<=dev-python/requests-3.0.0[${PYTHON_USEDEP}]"
# Todo write ebuilds for betamax_matchers, betamax-serializers
RDEPEND="
 test? ( <=dev-python/betamax-0.8.0[${PYTHON_USEDEP}]
	<=dev-python/betamax_matchers-0.4[${PYTHON_USEDEP}]
	<=dev-python/betamax-serializers-0.3[${PYTHON_USEDEP}]
	=dev-python/mock-1.0.1[${PYTHON_USEDEP}] 
	)"

python_test() {
:
    # "${PYTHON}" -m tornado.test.runtests || die "tests failed under ${EPYTHON}"
}

python_install_all() {
	use examples && local EXAMPLES=( examples/. )
	
	distutils-r1_python_install_all
}
