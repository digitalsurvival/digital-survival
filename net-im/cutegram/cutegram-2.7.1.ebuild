# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/aseman-land/${PN}.git
		git://github.com/aseman-land/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/aseman-land/${PN}/archive/v${PV}-stable.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="A Telegram client built with Qt"
HOMEPAGE="http://aseman.co/cutegram"
LICENSE="GPL-3"

SLOT="0"
IUSE="unity"

#  Experimential
DEPEND="
	>=dev-qt/qtcore-5.5.1-r1
	>=dev-qt/qtdbus-5.5.1
	>=dev-qt/qtmultimedia-5.5.1-r1
	>=dev-qt/qtgui-5.5.1-r1
	>=dev-qt/qtdbus-5.5.1
	>=dev-qt/qtnetwork-5.5.1
	>=dev-qt/qtprintsupport-5.5.1
	>=dev-qt/qtquick1-5.5.1-r1
	>=dev-qt/qtquickcontrols-5.5.1-r1
	>=dev-qt/qtsql-5.5.1
	>=dev-qt/qtsvg-5.5.1-r1
	>=dev-qt/qtwidgets-5.5.1-r1
	>=dev-qt/qtgraphicaleffects-5.5.1-r1
	>=dev-qt/qtdeclarative-5.5.1-r1
	dev-libs/openssl:0
	unity? (
			dev-libs/libappindicator:2
			x11-libs/gtk+:2
			)
"

RDEPEND="${DEPEND}"

pkg_postinst() {
	elog "Thanks for installing ${PN}! :)"
}
