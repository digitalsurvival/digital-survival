# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN="Rocket.Chat"
MY_P="${MY_PN}-${PV}"

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/RocketChat/${MY_PN}.git
		git://github.com/RocketChat/${MY_PN}.git"
else
	SRC_URI="https://github.com/RocketChat/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A Slack-like open source chat server"
HOMEPAGE="https://rocket.chat/"
LICENSE="MIT"

SLOT="0"
#IUSE=""

S="${WORK_DIR}/${MY_P}"

DEPEND="net-libs/nodejs"
RDEPEND=""

