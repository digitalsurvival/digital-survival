# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5} pypy )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hynek/${PN}.git"
else
	SRC_URI="https://github.com/hynek/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Structured Logging for Python"
HOMEPAGE="http://www.structlog.org/
	https://github.com/hynek/structlog"
LICENSE="|| ( Apache-2.0 MIT )"

SLOT="0"
IUSE="test doc extras"

DEPEND="dev-python/six[${PYTHON_USEDEP}]
	test? ( dev-python/coverage[${PYTHON_USEDEP}]
	>=dev-python/freezegun-0.2.8[${PYTHON_USEDEP}]
	dev-python/pretend[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	)
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	dev-python/twisted-core[${PYTHON_USEDEP}]
	)
	"
RDEPEND="extras? ( dev-python/colorama )"

python_test() {
	${EPYTHON} run_tests.py || die "Testing failed with ${EPYTHON}"
}
