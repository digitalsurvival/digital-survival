# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-utils

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/baumgarr/nixnote2.git
		git://github.com/baumgarr/nixnote2.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/baumgarr/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi


DESCRIPTION="An open source Evernote clone for Linux."
HOMEPAGE="https://github.com/baumgarr/Nixnote2"
LICENSE="GPL-2"

SLOT="0"
IUSE=""

DEPEND="
dev-qt/qtcore:4
dev-qt/qtgui:4
dev-qt/qtsql:4
dev-qt/qtwebkit:4
app-text/poppler
media-libs/opencv
app-text/hunspell
dev-libs/boost
dev-libs/libevent
sys-devel/automake
sys-devel/libtool
sys-devel/flex
sys-devel/bison
dev-util/pkgconfig
sys-devel/gcc
dev-libs/openssl
app-text/htmltidy
net-print/cups
"

RDEPEND="
dev-qt/qtsql:4
app-text/poppler
media-libs/opencv
app-text/htmltidy
"

src_prepare() {
qmake
}

src_configure() {

}

pkg_postinst() {

}
