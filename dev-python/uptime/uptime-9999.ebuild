# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

EGIT_COMMIT="1ddfd06bb300c00e6dc4bd2a9ddf9bf1aa27b1bb"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Cairnarvon/${PN}"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Cross-platform uptime library"
HOMEPAGE="https://pypi.python.org/pypi/uptime
	https://github.com/Cairnarvon/uptime"

LICENSE="BSD-2"
SLOT="0"

IUSE="doc test"
DEPEND="doc? ( dev-python/sphinx[${PYTHON_USEDEP}] 
				app-arch/zip )
				"
RDEPEND=""

python_compile_all() {
    use doc && emake uptime.zip # weird make target for docs...
}

python_test() {
	# Avoid the Makefile for tests
    ${EPYTHON} tests/uptime_tests.py || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && dodoc -r doc/_build/*
    distutils-r1_python_install_all
}
