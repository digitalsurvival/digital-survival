# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	inherit versionator
	MY_PV="$(replace_version_separator 2 '-' ${PV})"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/${MY_P}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A library for manipulating block devices"
HOMEPAGE="https://github.com/rhinstaller/libblockdev"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=""

S="${WORKDIR}/${MY_P}"

#~ src_compile() {
	#~ local use_selinux=0
	#~ use selinux && use_selinux=1
	#~ export EPATCH_OPTS="-d${S}"
	#~ epatch "${FILESDIR}"/Werror.patch
	#~ emake USESELINUX="${use_selinux}"
#~ }
