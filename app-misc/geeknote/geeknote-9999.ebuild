# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="An open source, command-line Evernote client"
HOMEPAGE="http://www.geeknote.me/"

if [[ ${PV} == 9999 ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/VitaliyRodnenko/geeknote.git
                git://github.com/VitaliyRodnenko/geeknote.git"
else
        KEYWORDS="~x86 ~amd64"
        SRC_URI="https://github.com/VitaliyRodnenko/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64 ~x86"
