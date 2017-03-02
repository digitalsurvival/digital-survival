# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/freedombox/plinth.git
	git://github.com/freedombox/plinth.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/freedombox/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A python-powered web interface for FreedomBox"
HOMEPAGE="https://freedomboxfoundation.org/"
LICENSE="AGPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

RDEPEND=">=dev-python/django-1.7.0[${PYTHON_USEDEP}]
>=dev-python/cherrypy-3.0[${PYTHON_USEDEP}]
>=dev-python/coverage-3.7[${PYTHON_USEDEP}]
dev-python/pyyaml[${PYTHON_USEDEP}]
dev-python/python-augeas[${PYTHON_USEDEP}]
dev-python/psutil[${PYTHON_USEDEP}]
dev-python/django-stronghold[${PYTHON_USEDEP}]
"

python_install() {
	distutils-r1_python_install
}

pkg_postinst() {
	elog "Thanks for installing Plinth! :)"
}
