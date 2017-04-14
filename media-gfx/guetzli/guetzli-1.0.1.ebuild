# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Perceptual JPEG encoder"
HOMEPAGE="https://github.com/google/guetzli"
SRC_URI="https://github.com/google/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libpng:0"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i "s/-O3//g" guetzli.make || die "sed failed to change opt flags!"
	eapply_user
}

src_compile() {
	tc-export CXX
	emake guetzli verbose=1
}

src_install() {
	dobin bin/Release/guetzli
	dodoc CONTRIBUTING.md README.md
}
