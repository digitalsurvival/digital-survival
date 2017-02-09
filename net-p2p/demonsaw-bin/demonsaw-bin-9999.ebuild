# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit pax-utils eutils

MY_PN="demonsaw"

# TODO patch or fix upstream .desktop file

KEYWORDS="~x86 ~amd64"
SRC_URI="amd64? ( https://www.demonsaw.com/download/${PV}/demonsaw_debian_64.tar.gz )
	x86? ( https://www.demonsaw.com/download/${PV}/demonsaw_debian_32.tar.gz )"
DESCRIPTION="A secure, anonymous, and cross-platform file sharing and chat client"
HOMEPAGE="https://www.demonsaw.com"
LICENSE=""
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

# Quiets Portage's QA output
#QA_PREBUILT="opt/rocketchat/*

S="${WORKDIR}"

src_install() {
	local OPT_DIR="/opt/${PN}"

	pax-mark m "${S}/${MY_PN}" || die "Cannot pax-mark ${MY_PN} binary"
	insinto "${OPT_DIR}"
	doins -r "${S}"/*

	insinto /usr/share/applications
	doins "${S}"/desktop/${MY_PN}.desktop

	fperms 755 "${OPT_DIR}/${MY_PN}"
	make_wrapper "${PN}" "${OPT_DIR}/${MY_PN}"
}


