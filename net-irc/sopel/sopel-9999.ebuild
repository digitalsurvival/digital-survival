# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sopel-irc/${PN}.git
		git://github.com/sopel-irc/${PN}.git"
else
	SRC_URI="https://github.com/sopel-irc/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

DESCRIPTION="A Python powered IRC bot"
HOMEPAGE="http://sopel.chat/"
LICENSE="EFL-2"

SLOT="0"
IUSE="doc test"

DEPEND=""

# Todo pygeoip and praw
RDEPEND=" test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/xmltodict[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/praw[${PYTHON_USEDEP}]
	dev-python/pyenchant[${PYTHON_USEDEP}]
	dev-python/pygeoip[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"

python_compile_all() {
    use doc && emake -C docs html
}

python_test() {
	pytest || die "Testing failed with ${EPYTHON}"
}

pkg_postinst() {
	elog "More information can be found on Sopel's GitHub wiki:"
	elog "https://github.com/sopel-irc/sopel/wiki"
}
