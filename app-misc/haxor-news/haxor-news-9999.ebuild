# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

if [[ ${PV} == 9999 ]]; then
inherit git-r3
EGIT_REPO_URI="https://github.com/donnemartin/${PN}.git
	git://github.com/donnemartin/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/donnemartin/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Read hacker news in a terminal"
HOMEPAGE="https://github.com/donnemartin/haxor-news"

LICENSE="Apache-2.0"
SLOT="0"

KEYWORDS="~amd64 ~x86"
