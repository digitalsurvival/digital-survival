# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games

MY_P=${P/_/-}

DESCRIPTION="A super simple text-based Star Trek game."
HOMEPAGE="http://almy.us/sst.html"
SRC_URI="http://almy.us/files/sstsrc.zip" -> ${MY_P}.zip

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
