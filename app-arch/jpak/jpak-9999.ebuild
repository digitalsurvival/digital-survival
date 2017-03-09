# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jpakkane/${PN}.git"
else
	SRC_URI="https://github.com/jpakkane/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Jpak compression format"
HOMEPAGE="https://github.com/jpakkane/jpak"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	virtual/pkgconfig
	dev-util/meson
	dev-util/ninja
	app-arch/xz-utils
	"
RDEPEND=""

src_compile() {
	meson "${S}" build || die
	cd "${S}/build"
	ninja || die
}

src_install() {
	dobin build/jpack
	dobin build/junpack
	dolib.a build/libhelpers.a
}
