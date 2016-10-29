# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A C++ library for resampling audio signals"
HOMEPAGE="http://kokkinizita.linuxaudio.org/linuxaudio/"
SRC_URI="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+tools"

DEPEND="media-libs/libsndfile:0"
RDEPEND=""

src_compile() {
emake -C libs/ || die "lib make failed!"

if ! use tools ; then
	emake -C apps/ -I "${S}/libs" || die "apps make failed!"
fi
}

src_install() {
emake -C libs/ install || die "lib installation failed!"

if ! use tools ; then
	emake -C apps/ install || die "app installation failed!"
fi
}
