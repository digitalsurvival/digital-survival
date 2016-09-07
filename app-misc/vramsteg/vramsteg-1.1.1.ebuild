# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-utils bash-completion-r1

DESCRIPTION="Vramsteg adds progress-bar capability to a script/program"
HOMEPAGE="http://tasktools.org/projects/vramsteg.html"
SRC_URI="http://taskwarrior.org/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x64-macos"
IUSE=""

src_prepare() {
	# use the correct directory locations
	sed -i -e "s:/usr/local/share/doc/vramsteg/rc:${EPREFIX}/usr/share/vramsteg/rc:" \
		doc/man/vramsteg.1.in || die
}

src_configure() {
	mycmakeargs=(
		-DTASK_DOCDIR="${EPREFIX}"/usr/share/doc/${PF}
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
