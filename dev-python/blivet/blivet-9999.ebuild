# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	
	inherit versionator
	MY_MAJORV="$(get_major_version)"
	if [[ "${MY_MAJORV}" -gt "0" ]]; then
		MY_PV="$(replace_version_separator 3 '-' ${PV})"
		MY_P="${PN}-${MY_PV}"
	else
		MY_PV="$(replace_version_separator 4 '-' ${PV})"
		MY_P="${PN}-${MY_PV}"
	fi
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/${MY_P}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A Python module for configuration of block devices"
HOMEPAGE="https://github.com/rhinstaller/blivet
	https://fedoraproject.org/wiki/Blivet"
LICENSE="GPL-2"

SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"
