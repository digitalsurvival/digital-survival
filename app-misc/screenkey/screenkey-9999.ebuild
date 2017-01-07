# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Display keypresses on the screen"
HOMEPAGE="https://www.thregr.org/~wavexx/software/screenkey/ https://github.com/wavexx/screenkey"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wavexx/screenkey
	git://github.com/wavexx/screenkey.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/wavexx/${PN}/archive/${P}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3+"
SLOT="0"
IUSE="fontawesome selection doc"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/setuptools-git[${PYTHON_USEDEP}]
	dev-python/python-distutils-extra[${PYTHON_USEDEP}]
	"
RDEPEND="dev-python/pygtk[${PYTHON_USEDEP}]
	fontawesome? ( media-fonts/fontawesome )
	selection? ( x11-misc/slop )
"

S="${PN}-${P}"

python_install_all() {
	use doc && dodoc NEWS.rst README.rst
	distutils-r1_python_install_all

	insinto /usr/share/applications
	doins data/*
}
