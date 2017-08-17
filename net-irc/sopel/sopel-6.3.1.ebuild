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
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/sopel-irc/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A Python powered IRC bot"
HOMEPAGE="http://sopel.chat/"
LICENSE="EFL-2"

SLOT="0"
IUSE="doc test"

DEPEND=""

# Todo pygeoip and praw
# pip install --user sopel installed the following for sopel-6.5.0
# praw-5.0.1 prawcore-0.11.0 pyenchant-1.6.8 pygeoip-0.3.2 requests-2.10.0 sopel-6.5.0 update-checker-0.16 xmltodict-0.11.0

RDEPEND=" test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/xmltodict[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/praw[${PYTHON_USEDEP}]
	dev-python/pyenchant[${PYTHON_USEDEP}]
	dev-python/pygeoip[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]

	dev-python/ipython[${PYTHON_USEDEP}]
	"
    # Found a runtime dependency on ipython after _not_ configuring the meetbot module

python_compile_all() {
    use doc && emake -C docs html
}

python_test() {
	pytest || die "Testing failed with ${EPYTHON}"
}

pkg_postinst() {
	elog "Configuration information can be found on Sopel's GitHub wiki at:"
	elog "https://github.com/sopel-irc/sopel/wiki"
}
