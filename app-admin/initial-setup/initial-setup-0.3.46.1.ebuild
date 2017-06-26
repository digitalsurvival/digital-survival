# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )

import distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	inherit versionator
	MY_PV=$(replace_version_separator 3 '-' )
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/r${MY_PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A utility for post-installation configuration"
HOMEPAGE="https://github.com/rhinstaller/initial-setup
	http://fedoraproject.org/wiki/InitialSetup"

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

S="${WORKDIR}/${PN}-${MY_PV}"
