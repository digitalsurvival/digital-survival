# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/AltraMayor/${PN}.git
		git://github.com/AltraMayor/${PN}.git"
else
	SRC_URI="https://github.com/AltraMayor/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="Fight Flash Fraud, a cross platform H2testw clone."
HOMEPAGE="http://oss.digirati.com.br/f3/
	https://github.com/AltraMayor/f3"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="experimental"

DEPEND="virtual/libudev
	sys-block/parted"
RDEPEND="${DEPEND}"

src_compile() {
if use experimental; then
	emake PREFIX="${D}usr" all experimenal
else
	emake PREFIX="${D}usr" all
fi
}

src_install() {
emake PREFIX="${D}usr" install
}
