# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/meteor/${PN}.git"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/meteor/${PN}/archive/release/METEOR@${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A javascript framework for building modern web applications"
HOMEPAGE="https://www.meteor.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# node_js
# scons
# dev-db/mongodb-????
DEPEND="
	"
RDEPEND="${DEPEND}"
