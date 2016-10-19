# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ApoorvaJ/${PN}.git"
else
	SRC_URI="https://github.com/ApoorvaJ/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	
fi

DESCRIPTION="A GPU-powered image editor"
HOMEPAGE="https://github.com/ApoorvaJ/${PN}"
LICENSE="MIT"
SLOT="0"

IUSE=""

DEPEND="x11-libs/gtk+:2"
# todo run depcheck on binary
RDEPEND="${DEPEND}
	x11-libs/pango:0
	dev-libs/atk:0
	x11-libs/gdk-pixbuf:2
	dev-libs/glib:2
	media-libs/fontconfig:1.0
	media-libs/freetype:2
	x11-drivers/nvidia-drivers:0
	x11-libs/libxcb:0/1.12
	x11-libs/libXext:0
	x11-libs/libXfixes:0
	x11-libs/libXrender:0
	x11-libs/libXinerama:0
	x11-libs/libXrandr:0
	x11-libs/libXcursor:0
	x11-libs/libXcomposite:0
	x11-libs/libXdamage:0
	x11-libs/pixman:0
	media-libs/libpng:0/16
	x11-libs/libxcb:0/1.12
	sys-libs/zlib:0
	media-libs/harfbuzz:0/0.9.18
	dev-libs/libffi:0
	dev-libs/libpcre:3
	dev-libs/expat:0
	x11-libs/libXau:0
	x11-libs/libXdmcp:0
	media-gfx/graphite2:0
	dev-libs/libbsd:0
"

src_compile() {
	cd "${WORKDIR}/build/linux"
	emake makefile || die "make filed!"
}

src_install() {
	doexe "${WORKDIR}/build/linux/papaya"
}

