# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5

inherit vcs-snapshot

DESCRIPTION="Pure Python GeoIP API"
HOMEPAGE="https://github.com/appliedsec/pygeoip"

if [[ ${PV} == 9999 ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/appliedsec/pygeoip.git
                git://github.com/appliedsec/pygeoip.git"
else
        KEYWORDS="~x86 ~amd64"
        SRC_URI="https://github.com/appliedsec/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
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
