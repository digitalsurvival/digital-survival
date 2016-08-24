# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
inherit git-r3
EGIT_REPO_URI="https://github.com/Gallopsled/${PN}.git
	git://github.com/Gallopsled/${PN}.git"
	KEYWORDS=""
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/Gallopsled/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="CTF framework and exploit development library"
HOMEPAGE="http://pwntools.com"

LICENSE="MIT GPL-2 BSD-2"
SLOT="0"

KEYWORDS="~amd64 ~x86"
