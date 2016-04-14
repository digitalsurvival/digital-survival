# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/telegramdesktop/${PN}.git
		git://github.com/telegramdesktop/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/telegramdesktop/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="The official Telegram desktop messaging app"
HOMEPAGE="https://desktop.telegram.org/"
LICENSE="GPL-3"

SLOT="0"
#IUSE=""

# Deps still needed (https://github.com/telegramdesktop/tdesktop/blob/master/doc/building-qmake.md):
#	breakpad
#	crashpad
#	linux-syscall-support ? 
#	Needs a .desktop icon
#	telegram protocol?
DEPEND="
	>=dev-qt/qtcore-5.5.1-r1
	>=dev-libs/openssl-1.0.2g-r2
	>=sys-libs/zlib-1.2.8-r1
	>=media-libs/libexif-0.6.20
	>=app-arch/lzma-9.20
	media-libs/openal
	media-libs/opus
	media-video/ffmpeg
	media-fonts/open-sans
"

RDEPEND="${DEPEND}"

pkg_postinst() {
	elog "Thanks for installing ${PN}! :)"
}
