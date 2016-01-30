# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit vcs-snapshot

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nylas/N1.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/nylas/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="The extensible, open source mail client"
HOMEPAGE="https://nylas.com/N1"
LICENSE="GPL-3"

SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""
