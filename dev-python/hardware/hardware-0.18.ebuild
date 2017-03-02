# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/redhat-cip/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/redhat-cip/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Python module for hardware detection and classification"
HOMEPAGE="https://github.com/redhat-cip/${PN}"
LICENSE="Apache-2.0"

SLOT="0"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

RDEPEND="
	dev-python/netaddr[${PYTHON_USEDEP}]
"

python_install() {
	distutils-r1_python_install
}
