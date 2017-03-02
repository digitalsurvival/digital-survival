# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nrosvall/${PN}.git"
else
	SRC_URI="https://github.com/nrosvall/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A commandline password manager supporting AES encryption and 256-bit keys"
HOMEPAGE="https://github.com/nrosvall/titan"
LICENSE="MIT"

SLOT="0"
IUSE=""

DEPEND="
	dev-libs/openssl:0
	dev-db/sqlite:3
"

RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
	doman ${PN}.1
}
