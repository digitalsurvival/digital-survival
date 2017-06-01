# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1

DESCRIPTION="Pure Python GeoIP API"
HOMEPAGE="https://github.com/appliedsec/pygeoip https://pypi.python.org/pypi/pygeoip"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/appliedsec/${PN}.git
	git://github.com/appliedsec/${PN}.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	https://github.com/appliedsec/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="LGPL-3+"
SLOT="0"
IUSE="doc test"

DEPEND=" dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/tox[${PYTHON_USEDEP}]
			dev-python/nose[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}]
		   dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}] )"
			
RDEPEND=""

python_compile_all() {
    use doc && emake -C docs html
}

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README.*
	dohtml _docs/_build/html/*
}
