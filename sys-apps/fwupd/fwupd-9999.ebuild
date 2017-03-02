# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hughsie/${PN}.git"
else
	SRC_URI="https://github.com/hughsie/${PN}/archive/${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A simple daemon to allow session software to update firmware"
HOMEPAGE="http://www.fwupd.org"
LICENSE="GPL-2"
SLOT="0"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
