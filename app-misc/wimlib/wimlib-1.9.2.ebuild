# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit autotools linux-info

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://wimlib.net/${PN}"
	KEYWORDS=""
else
	SRC_URI="https://wimlib.net/downloads/${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

DESCRIPTION="A suite for manipulating WIM files"
HOMEPAGE="https://wimlib.net/"
LICENSE="GPL-3 LGPL-3"

SLOT="0"
IUSE="+fuse iso +ntfs openssl kernel_linux"

COMMON_DEPEND="
	dev-libs/libxml2
	fuse? ( sys-fs/fuse sys-apps/attr )
	ntfs? ( >=sys-fs/ntfs3g-2011.4.12[ntfsprogs] )
	openssl? ( dev-libs/openssl )
"

DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig
"

RDEPEND="${COMMON_DEPEND}
	iso? ( app-cdr/cdrkit sys-fs/mtools sys-boot/syslinux app-arch/cabextract )
"

pkg_setup() {
	if use fuse && use kernel_linux; then
		CONFIG_CHECK="~FUSE_FS"
		linux-info_pkg_setup
	fi
}

src_prepare() {
	default

	if [[ "${PV}" == "9999" ]]; then
		eautoreconf
	fi
}

src_configure() {
	econf $(use_with fuse) $(use_with ntfs ntfs-3g) $(use_with openssl libcrypto)
}
