# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

AUTOTOOLS_IN_SOURCE_BUILD=1 
AUTOTOOLS_AUTORECONF=1 

inherit base autotools-utils 

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mariusae/${PN}.git"
else
	SRC_URI="https://github.com/mariusae/${PN}/archive/release/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi	

HOMEPAGE="https://github.com/mariusae/trickle" 
DESCRIPTION="A portable lightweight userspace bandwidth shaper"
LICENSE="BSD-3"
SLOT="0"
IUSE=""
DEPEND="dev-libs/libevent"
RDEPEND="${DEPEND}"

src_configure() {
	econf --with-posix-regex
}
src_compile() {
	sed -i '/#define in_addr_t/ s:^://:' config.h
	emake DESTDIR="${D}" install 
}
