# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tonsky/${PN}.git
		git://github.com/tonsky/${PN}.git"
else
	SRC_URI="https://github.com/tonsky/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Monospaced font with programming ligatures"
HOMEPAGE="https://github.com/tonsky/FiraCode"
LICENSE="OFL-1.1"

#IUSE="examples"

SLOT="0"
DEPEND=""
RDEPEND=""
FONT_S="${S}/distr/eot ${S}/distr/otf ${S}/distr/ttf ${S}/distr/woff ${S}/distr/woff2"
FONT_SUFFIX="eot otf ttf woff woff2"
DOCS="LICENSE README.md CHANGLOG.md"
