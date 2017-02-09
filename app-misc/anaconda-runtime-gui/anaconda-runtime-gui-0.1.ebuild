# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

DESCRIPTION="Anaconda GUI meta-package"
HOMEPAGE="https://github.com/rhinstaller/anaconda https://rhinstaller.github.io/anaconda/"
SRC_URI=""

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND=""
RDEPEND="app-misc/anaconda-runtime
	dev-python/libgnomecanvas-python
	dev-python/pygtk
	x11-themes/hicolor-icon-theme
	media-libs/fontconfig:1.0
	x11-libs/gtk+:2
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXmu
	x11-libs/libXrender
	x11-libs/pango
	x11-libs/pixman
	x11-libs/xcb-util
	dev-python/python-meh[gtk]"
