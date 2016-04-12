# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools user

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/firehol/${PN}.git
		git://github.com/firehol/${PN}.git"
else
	SRC_URI="https://github.com/firehol/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="A web-based real-time performance monitoring app"
HOMEPAGE="http://netdata.firehol.org/
https://github.com/firehol/netdata"
LICENSE="GPL-3"

KEYWORDS="~x86 ~amd64"

SLOT="0"
IUSE="+zlib"

RDEPEND="zlib? ( sys-libs/zlib )"

pkg_setup() {
	enewgroup netdata
	enewuser netdata -1 /sbin/nologin / netdata --comment netdata --system
}

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --prefix="${D}" --sysconfdir="${D}/etc" --localstatedir="${D}/var" $(use_enable zlib) --with-math --with-user=netdata CFLAGS="${CFLAGS}"
}
