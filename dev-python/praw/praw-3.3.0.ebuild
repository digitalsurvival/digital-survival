# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5

inherit vcs-snapshot

DESCRIPTION="A Python Reddit API Wrapper"
HOMEPAGE="https://praw.readthedocs.org/en/stable/"

if [[ ${PV} == 9999 ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/praw-dev/praw.git
                git://github.com/praw-dev/praw.git"
else
        KEYWORDS="~x86 ~amd64"
        SRC_URI="https://github.com/praw-dev/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
		RESTRICT="primaryuri"
fi

LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~amd64 ~x86"

src_configure() {
    econf --with-posix-regex
}

src_install() {
    emake DESTDIR="${D}" install

    dodoc FAQ NEWS README
    dohtml EXTENDING.html ctags.html
}
