# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils
inherit qmake-utils

MY_PN="libqtelegram-aseman-edition"
MY_P="${MY_PN}-${PV}-stable"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/aseman-land/${MY_PN}.git
		git://github.com/aseman-land/${MY_PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/aseman-land/${MY_PN}/archive/v${PV}-stable.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="A fork of libqtelegram that uses qmake"
HOMEPAGE="https://github.com/Aseman-Land/libqtelegram-aseman-edition"
LICENSE="GPL-3"

SLOT="0"
#IUSE="kde"

#  Experimential
DEPEND="
	>=dev-qt/qtcore-5.5.1-r1
	>=dev-qt/qtdbus-5.5.1
	>=dev-qt/qtmultimedia-5.5.1-r2
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
"
# Fedora dependancy list (for KDE deskop notifications?) includes dev-libs/libappindicator:2, kde-plasma/plasma-nm, dev-libs/openssl:0, kde-plasma-applicationname?
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

#src_prepare() {
#	mkdir "${WORKDIR}"/build
#}

src_configure() {
	eqmake5 PREFIX="${EPREFIX}/usr" -recursive libqtelegram-ae.pro
}

src_install() {
	 emake DESTDIR="${D}" INSTALL_ROOT="${D}" install
}

pkg_postinst() {
	elog "Thanks for installing ${PN}! :)"
}
