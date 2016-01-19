# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5

DESCRIPTION="write build rules in POSIX shell"
HOMEPAGE="http://bkoropoff.github.io/makekit/"

if [[ ${PV} == 9999 ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/bkoropoff/makekit.git
                git://github.com/bkoropoff/makekit.git"
else
        KEYWORDS="~x86 ~amd64"
        SRC_URI="https://github.com/bkoropoff/${PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"
		RESTRICT="primaryuri"
fi

LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~amd64 ~x86"

src_configure() {
}

src_install() {
    emake DESTDIR="${D}" install

}
