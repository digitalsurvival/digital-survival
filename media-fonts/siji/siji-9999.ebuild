# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/stark/${PN}.git
		git://github.com/stark/${PN}.git"
	EGIT_COMMIT="95369afac3e661cb6d3329ade5219992c88688c1"
else
	SRC_URI="https://github.com/stark/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="An iconic bitmap font based on the Stlarch"
HOMEPAGE="https://github.com/stark/siji"
LICENSE="GPL-2"

#IUSE="examples"

SLOT="0"
DEPEND=""
RDEPEND=""
FONT_S="${S}/pcf"
FONT_SUFFIX="pcf"
DOCS="LICENSE Readme.md"
