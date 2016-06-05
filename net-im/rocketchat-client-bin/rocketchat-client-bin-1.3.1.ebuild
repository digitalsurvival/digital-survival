# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit unpacker pax-utils eutils

MY_PN="rocketchat"

KEYWORDS="~amd64"
SRC_URI="https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/${PV}/${MY_PN}-v${PV}-linux-x64.deb"
DESCRIPTION="Linux desktop client for RocketChat (binary)"
HOMEPAGE="https://rocket.chat/"
LICENSE="MIT"

SLOT="0"
IUSE="+notify"

RDEPEND="
	>=dev-qt/qtcore-5.5.1-r1:5
	>=dev-qt/qtdbus-5.5.1:5
	>=dev-qt/qtmultimedia-5.5.1-r1:5
	>=dev-qt/qtgui-5.5.1-r1:5
	>=dev-qt/qtdbus-5.5.1:5
	>=dev-qt/qtnetwork-5.5.1:5
	>=dev-qt/qtprintsupport-5.5.1:5
	>=dev-qt/qtquick1-5.5.1-r1:5
	>=dev-qt/qtquickcontrols-5.5.1-r1:5
	>=dev-qt/qtsql-5.5.1:5
	>=dev-qt/qtsvg-5.5.1-r1:5
	>=dev-qt/qtwidgets-5.5.1-r1:5
	>=dev-qt/qtgraphicaleffects-5.5.1-r1:5
	>=dev-qt/qtdeclarative-5.5.1-r1:5
	dev-libs/openssl:0
	notify? (
		dev-libs/libappindicator:2
		x11-libs/gtk+:2
		)
	"
# Quiets Portage's QA output
QA_PREBUILT="opt/rocketchat/*"

S="${WORKDIR}"

src_unpack() {
	unpack_deb "${A}"
}

src_prepare() {
	epatch "${FILESDIR}/${P}-fix-xdg-categories.patch"
	eapply_user
}

src_install() {
	local IMAGE_DIR="/opt/${MY_PN}"
	local WORK_DIR="opt/${MY_PN}"

	pax-mark m "${WORK_DIR}/${MY_PN}" || die "Cannot pax-mark rocketchat binary"
	insinto "${IMAGE_DIR}"
	doins -r "${WORK_DIR}"/*

	insinto /usr/share/applications
	doins usr/share/applications/*

	fperms 755 "${IMAGE_DIR}/${MY_PN}"
	make_wrapper "${PN}" "${IMAGE_DIR}/${MY_PN}"
}
