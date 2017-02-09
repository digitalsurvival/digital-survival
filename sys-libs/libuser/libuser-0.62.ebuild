# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit eutils

DESCRIPTION="An interface for manipulating and administering user and group accounts"
HOMEPAGE="https://fedorahosted.org/libuser"
SRC_URI="https://fedorahosted.org/releases/l/i/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="ldap +popt sasl selinux"

DEPEND="sys-devel/bison
	sys-devel/gettext"
RDEPEND="dev-libs/glib:2
	ldap? ( net-nds/openldap )
	popt? ( dev-libs/popt )
	sasl? ( dev-libs/cyrus-sasl )
	selinux? ( sys-libs/libselinux )"

src_configure() {
	epatch "${FILESDIR}/nodocs.patch"
	econf $(use_with ldap) $(use_with popt) $(use_with sasl) \
		$(use_with selinux) --with-python
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
