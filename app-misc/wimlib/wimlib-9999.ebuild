# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit autotools

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://wimlib.net/"${PN}""
else
	SRC_URI="https://wimlib.net/downloads/"${P}".tar.gz -> "${P}".tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="A suite for manipulating .wim files"
HOMEPAGE="https://wimlib.net/"
LICENSE="GPL-3 LGPL-3"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="+fuse iso +ntfs openssl"

# Removed dev-util/pkgconfig per repoman

DEPEND="
	dev-libs/libxml2
	virtual/pkgconfig
"

RDEPEND="
	fuse? ( sys-fs/fuse sys-apps/attr )
	iso? ( app-cdr/cdrkit sys-fs/mtools sys-boot/syslinux app-arch/cabextract )
	ntfs? ( >=sys-fs/ntfs3g-2011.4.12[ntfsprogs] )
	openssl? ( dev-libs/openssl )
"

pkg_setup() {
	use fuse && CONFIG_CHECK+=" ~FUSE_FS"
}

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {

local myconf
# --without-fuse --without-ntfs-3g --without-libcrypto
if use ntfs && use openssl ; then
	myconf="--with-ntfs-3g --with-libcrypto"
elif ! use ntfs && use openssl ; then
	myconf="--without-ntfs-3g --with-libcrypto"
elif use ntfs && ! use openssl ; then
	myconf="--with-ntfs-3g --without-libcrypto"
else
	myconf="--without-ntfs-3g --without-libcrypto"
fi

eautoconf --prefix="${S}" \
$(use_with fuse) \
${myconf}
}

src_install() {
	eautomake DESTDIR="${D}" install
}
