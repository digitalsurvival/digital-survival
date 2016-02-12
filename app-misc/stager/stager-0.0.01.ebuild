# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5

DESCRIPTION="the perfect Gentoo installer"
HOMEPAGE="https://github.com/gentoo/stager"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gentoo/stager.git
	git://github.com/gentoo/stager.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/gentoo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi

LICENSE="MIT"
SLOT="0"

KEYWORDS="~amd64 ~x86"
