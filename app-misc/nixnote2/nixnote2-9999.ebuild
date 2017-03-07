# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils

MY_PV="${PV/_/-}"
MY_P="${PN}-${MY_PV}"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/baumgarr/${PN}.git
		git://github.com/baumgarr/${PN}.git"
else
	SRC_URI="https://github.com/baumgarr/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="An open source Evernote clone for Linux."
HOMEPAGE="https://github.com/baumgarr/Nixnote2"
LICENSE="GPL-2"

SLOT="0"
IUSE="+qt4 qt5 opencv3"

# Removed dev-util/pkgconfig per repoman
# opencv might need qt4 use flag when qt4 is used, same for qt5?

REQUIRED_USE="^^ ( qt4 qt5 )
	qt5? ( opencv3 )"

DEPEND="
	app-text/hunspell
	dev-libs/boost
	qt4? (
		app-text/poppler[qt4]
		dev-qt/qtwebkit:4
		dev-qt/qtcore:4
		dev-qt/qtgui:4
		dev-qt/qtsql:4
		opencv3? ( >=media-libs/opencv-3.1.0:=[qt4] )
		!opencv3? ( <media-libs/opencv-3.1.0:=[qt4] )
		)
	qt5? (
		app-text/poppler[qt5]
		dev-qt/qtwebkit:5
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtsql:5
		>=media-libs/opencv-3.1.0:=[qt5]
		)
	dev-libs/libevent
	sys-devel/automake:*
	dev-libs/openssl:0
	sys-devel/libtool
	sys-devel/flex
	sys-devel/bison
	virtual/pkgconfig
	net-print/cups
"

RDEPEND="
	app-text/htmltidy
	"

S="${WORKDIR}"/"${MY_P}"

src_prepare() {
	eapply_user
	# Fix VideoCapture undefined reference error with opencv-3
	if use opencv3; then
		sed -i 's/LIBS += /LIBS +=  -lopencv_videoio/g' NixNote2.pro || die "Could not fix NixNote.Pro file for openvc3"
		sed -i '/\#include "opencv\/cv.h"/i\#include "opencv2\/videoio.hpp"' dialog/webcamcapturedialog.h || die "Could not fix NixNote.Pro file for openvc3"
	fi
	lupdate -pro NixNote2.pro -no-obsolete || die "lupdate could not run"
	lrelease NixNote2.pro || die "lrelease could not run"
}

src_configure() {
	if use qt4 ; then
		eqmake4 NixNote2.pro
	else
		eqmake5 NixNote2.pro
	fi
}

src_install() {
	insinto /usr/share/"${PN}"
	doins -r images java qss translations/*.qm shortcuts.txt *.ini
	#rm -r "${D}"/usr/share/"${PN}"/translations/*.ts
	dobin "${PN}"

	dodoc -r help copyright changelog.txt license.html README.md README.txt install.txt

	insinto /usr/share/applications
	doins "${PN}".desktop

	doman "${S}"/man/nixnote2.1
}
