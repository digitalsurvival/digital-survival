# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/r${PV}.tar.gz -> ${P}.tar.gz"
fi
# https://github.com/rhinstaller/initial-setup/archive/r0.3.46-1.tar.gz
DESCRIPTION="A utility for post-installation configuration"
HOMEPAGE="https://github.com/rhinstaller/initial-setup
	http://fedoraproject.org/wiki/InitialSetup"

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
