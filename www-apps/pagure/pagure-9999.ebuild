# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://pagure.io/${PN}.git"
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
	
fi

DESCRIPTION="A git centered forge"
HOMEPAGE="https://pagure.io/pagure"
LICENSE="GPL-2"
SLOT="0"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
