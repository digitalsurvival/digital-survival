# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit autotools linux-info

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://wimlib.net/"${PN}""
else
	SRC_URI="https://wimlib.net/downloads/${P}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A suite for manipulating WIM files"
HOMEPAGE="https://wimlib.net/"
LICENSE="GPL-3 LGPL-3"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="+fuse iso +ntfs openssl kernel_linux"

DEPEND="dev-libs/libxml2
	virtual/pkgconfig
"

RDEPEND="
	fuse? ( sys-fs/fuse sys-apps/attr )
	iso? ( app-cdr/cdrkit sys-fs/mtools sys-boot/syslinux app-arch/cabextract )
	ntfs? ( >=sys-fs/ntfs3g-2011.4.12[ntfsprogs] )
	openssl? ( dev-libs/openssl )
"

pkg_setup() {
	if use fuse && use kernel_linux; then
		CONFIG_CHECK="~FUSE_FS"
		linux-info_pkg_setup
	fi
}

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	local MY_CONFIG
	# --without-fuse --without-ntfs-3g --without-libcrypto
	if use ntfs && use openssl ; then
		MY_CONFIG="--with-ntfs-3g --with-libcrypto"
	elif ! use ntfs && use openssl ; then
		MY_CONFIG="--without-ntfs-3g --with-libcrypto"
	elif use ntfs && ! use openssl ; then
		MY_CONFIG="--with-ntfs-3g --without-libcrypto"
	else
		MY_CONFIG="--without-ntfs-3g --without-libcrypto"
	fi
	# --prefix="${S}"
	eautoconf $(use_with fuse) \
	"${MY_CONFIG}"
}

src_install() {
	eautomake DESTDIR="${D}" install
}
