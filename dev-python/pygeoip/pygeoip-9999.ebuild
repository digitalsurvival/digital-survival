# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit python-r1

DESCRIPTION="Pure Python GeoIP API"
HOMEPAGE="https://github.com/appliedsec/pygeoip"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/appliedsec/${PN}.git
	git://github.com/appliedsec/${PN}.git"
else
	SRC_URI="https://github.com/appliedsec/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""

RDEPEND="${DEPEND}
dev-python/tox
dev-python/nose
dev-python/sphinx
dev-python/sphinx_rtd_theme
"

src_configure() {
	econf --with-posix-regex
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc FAQ NEWS README
	dohtml EXTENDING.html ctags.html
}
