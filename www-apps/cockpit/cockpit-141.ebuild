# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6


if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cockpit-project/${PN}.git
		git://github.com/cockpit-project/${PN}.git"
else
	SRC_URI="https://github.com/cockpit-project/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A web-based, modern Linux admin interface"
HOMEPAGE="http://cockpit-project.org/
    https://github.com/cockpit-project/cockpit"
LICENSE="LGPL-2.1"

SLOT="0"
#IUSE=""

S="${WORK_DIR}/${MY_P}"

DEPEND="net-libs/nodejs"
RDEPEND=""

