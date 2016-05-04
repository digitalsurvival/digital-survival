# Copyright 2011 Gentoo Linux
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Gentoo Linux LiveDVD release file"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE=""
DEPEND=""

src_unpack () {
	# Set arch
	if use amd64; then
		ARCH=amd64;
	fi
	if use x86; then
		ARCH=x86;
	fi

	# Set kernel
	if use kernel_linux; then
		KERN=Linux
	fi

	# Write file
	echo "Gentoo ${KERN} ${ARCH} ${PV}" > livedvd-release

}

src_install () {
	insinto /etc
	doins livedvd-release
	dosym /etc/livedvd-release /etc/system-release
}

