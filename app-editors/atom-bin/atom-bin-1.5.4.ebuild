# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit unpacker

MY_PN="atom"

DESCRIPTION="GitHub's hackable text editor (binary)"
HOMEPAGE="https://atom.io/"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/releases/download/v${PV}/${MY_PN}-amd64.deb -> ${P}.deb"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
sys-devel/make
sys-devel/gcc[cxx]
gnome-base/gconf
net-libs/nodejs
dev-lang/python
gnome-base/libgnome-keyring
dev-vcs/git
"

S="${WORKDIR}/"

src_unpack() {
	unpack_deb ${A}
}
#~ src_install() {
	#~ local IMAGE_DIR="/opt/${PN}"
	#~ local WORK_DIR="opt/${PN}"

	#~ pax-mark m "${WORK_DIR}/${MY_PN}" || die "Cannot pax-mark rocketchat binary"
	#~ insinto "${IMAGE_DIR}"
	#~ doins -r "${WORK_DIR}"/*

	#~ insinto /usr/share/applications
	#~ doins usr/share/applications/*

	#~ fperms 755 "${IMAGE_DIR}/${MY_PN}"
	#~ make_wrapper "${MY_PN}" "${IMAGE_DIR}/${MY_PN}"
#~ }
