# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jamiemcg/${PN}.git"
else
	SRC_URI="https://github.com/jamiemcg/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x64"
	
fi

DESCRIPTION="A fully featured Markdown editor for Linux"
HOMEPAGE="http://remarkableapp.github.io/"
LICENSE="MIT"
SLOT="0"

IUSE=""

DEPEND=""
RDEPEND="
	dev-python/gtkspell-python:0[${PYTHON_USEDEP}]
	dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
	dev-libs/gobject-introspection[${PYTHON_USEDEP}]"
