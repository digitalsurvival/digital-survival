# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils cmake-utils

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://wimlib.net.net/"${PN}""
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://wimlib.net/downloads/"${P}".tar.gz -> "${P}".tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="A suite for manipulating .wim files"
HOMEPAGE="https://wimlib.net/"
LICENSE="GPL-3 LGPL-3"

SLOT="0"
IUSE="+fuse +attr ntfs openssl"

# Removed dev-util/pkgconfig per repoman

DEPEND="dev-libs/libxml2
"

RDEPEND="
	fuse? ( sys-fs/fuse )
	ntfs? ( >=sys-fs/ntfs3g-2011.4.12[ntfsprogs] )
	attr? ( sys-apps/attr )
	openssl? ( dev-libs/openssl )
"

src_prepare() { # --without-fuse --without-ntfs-3g --without-libcrypto
	econf \
		$(use_enable fuse) \
		$(use_enable ntfs) \
		$(use_enable openssl)
}

src_install() {
	emake DESTDIR="${D}" install
}
