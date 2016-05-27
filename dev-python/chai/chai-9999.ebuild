# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} pypy)

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/agoragames/${PN}.git"
else
	inherit versionator
	MY_PV="$(replace_all_version_separators '_' ${PV} )"
	MY_P="${PN}-${MY_PV}"
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/agoragames/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Mocking framework for Python"
HOMEPAGE="https://github.com/agoragames/chai https://pypi.python.org/pypi/chai/1.1.0"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="doc test"

# Todo: fix deps
# FIXME: missing for running unittests:
# dev-python/nose-cov-1.6[${PYTHON_USEDEP}]

RDEPEND="
	>=dev-python/python-dateutil-2.1[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	test? (
		>=dev-python/nose-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/simplejson-3.6.5[${PYTHON_USEDEP}]
		)
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		)"

# Todo: fix $S

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}
