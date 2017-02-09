# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit 

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sesse.net/${PN}.git"
else
	SRC_URI="https://${PN}.sesse.net/${P}.tar.gz"
	KEYWORDS="~amd64"
	
fi

DESCRIPTION="A modern free software video mixer"
HOMEPAGE="https://${PN}.sesse.net/"
LICENSE="GPL-3"
SLOT="0"

IUSE=""

# Needs zita-resampler-1.6.0
DEPEND=""
RDEPEND="net-libs/libmicrohttpd:0/12
>=media-video/ffmpeg-3.1.0"
