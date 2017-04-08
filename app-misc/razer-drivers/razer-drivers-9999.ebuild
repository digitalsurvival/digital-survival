# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1 eutils cmake-utils linux-mod

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/terrycain/${PN}.git
		git://github.com/terrycain/${PN}.git"
else
	SRC_URI="https://github.com/terrycain/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Razer keyboard and mouse drivers for Linux"
HOMEPAGE="https://pez2001.github.io/razer_chroma_drivers/
https://github.com/terrycain/razer-drivers"
LICENSE="GPL-2"

SLOT="0"
IUSE=""

DEPEND="
media-libs/libsdl2
sci-libs/fftw:3.0
app-misc/jq

dev-python/setuptools[${PYTHON_USEDEP}]
dev-python/pygobject[${PYTHON_USEDEP}]
dev-python/numpy[${PYTHON_USEDEP}]
dev-python/pyudev[${PYTHON_USEDEP}]
dev-python/dbus-python[${PYTHON_USEDEP}]
dev-python/functools32[${PYTHON_USEDEP}]
"

RDEPEND=""

MODULE_NAMES="
	razerkbd(hid:${S}/driver)
	razermouse(hid:${S}/driver)
	razerfirefly(hid:${S}/driver)
	razerkraken(hid:${S}/driver)
	razermug(hid:${S}/driver)
	razercore(hid:${S}/driver)
"

src_install() {
	linux-mod_src_install

}
