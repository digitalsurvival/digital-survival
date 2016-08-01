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
