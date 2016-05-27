# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	inherit versionator
	MY_PV="r$(replace_version_separator 2 '-' )"
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A Python module for parsing and writing kickstart config files"
HOMEPAGE="http://fedoraproject.org/wiki/pykickstart
	https://github.com/rhinstaller/pykickstart"
LICENSE="GPL-2"
SLOT="0"

RDEPEND="${RDEPEND} sys-devel/gettext"
