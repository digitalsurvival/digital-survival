# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/adobe/${PN}.git"
	KEYWORDS=""
else
	inherit versionator
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/adobe/${PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="An open source text editor from Adobe"
HOMEPAGE="http://brackets.io/
	https://github.com/adobe/brackets"
LICENSE="MIT"
SLOT="0"
