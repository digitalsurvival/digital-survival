# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/aluzzardi/${PN}.git"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz https://github.com/aluzzardi/${PN}/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64 ~x84"
fi

DESCRIPTION="SSH to WebSockets Bridge"
HOMEPAGE="https://github.com/progrium/wssh https://pypi.python.org/pypi/wssh"
LICENSE="MIT"
SLOT="0"

IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/gevent-0.13.6[${PYTHON_USEDEP}]
	>=dev-python/ws4py-0.2.4[${PYTHON_USEDEP}]"


src_prepare() {
	sed -e 's/==/>=/g' -i "${S}"/setup.py || die "setup.py sed failed"
}
