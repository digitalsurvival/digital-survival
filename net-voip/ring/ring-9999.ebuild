# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gerrit-ring.savoirfairelinux.com/${PN}"
else
	SRC_URI=""
	KEYWORDS="~amd64"
	
fi

DESCRIPTION="Ring is a Voice-over-IP software phone."
HOMEPAGE="https://ring.cx/"

LICENSE="GPL"
SLOT="0"

IUSE=""

DEPEND="
	net-libs/opendht
	>=net-libs/pjsip-2.4[ring]"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
