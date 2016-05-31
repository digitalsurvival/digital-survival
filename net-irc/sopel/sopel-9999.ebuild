# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit python-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sopel-irc/${PN}.git
		git://github.com/sopel-irc/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/sopel-irc/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="The Python IRC bot"
HOMEPAGE="http://sopel.chat/"
LICENSE="EFL-2"

SLOT="0"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
dev-python/xmltodict
dev-python/pytz
dev-python/praw
dev-python/pyenchant
dev-python/pygeoip
dev-python/requests"

pkg_postinst() {
	elog "Thanks for installing Sopel! :)"
	elog "More information can be found on Sopel's GitHub wiki at:"
	elog "https://github.com/sopel-irc/sopel/wiki"
}
