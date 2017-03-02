# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

if [[ ${PV} == 9999 ]]; then
inherit git-r3
EGIT_REPO_URI="https://github.com/VitaliyRodnenko/geeknote.git
	git://github.com/VitaliyRodnenko/geeknote.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/VitaliyRodnenko/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="An open source, command-line Evernote client"
HOMEPAGE="http://www.geeknote.me/"

LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64 ~x86"
