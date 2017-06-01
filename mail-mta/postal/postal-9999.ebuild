# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/atech/${PN}.git"
else
	SRC_URI=""
	KEYWORDS="~amd64 ~x86"
	
fi

DESCRIPTION="An open source mail delivery platform"
HOMEPAGE="https://github.com/atech/postal"
LICENSE="MIT"
SLOT="0"

IUSE=""

DEPEND=">=dev-lang/ruby:2.3"
RDEPEND="${DEPEND}
virtual/mysql
net-misc/rabbitmq-server
net-libs/nodejs"
