# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/praw-dev/praw.git
	git://github.com/praw-dev/praw.git"
else
	SRC_URI="https://github.com/praw-dev/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

DESCRIPTION="A Python Reddit API Wrapper"
HOMEPAGE="https://praw.readthedocs.org/en/stable/"
LICENSE="GPL-3 BSD"
SLOT="0"
IUSE="doc text"

DEPEND="<=dev-python/decorator-4.1.0[${PYTHON_USEDEP}]
"

RDEPEND="
	test? ( =dev-python/mock-1.0.1[${PYTHON_USEDEP}]
	dev-python/betamax[${PYTHON_USEDEP}]
	dev-python/betamax-matchers[${PYTHON_USEDEP}]
	dev-python/betamax-serializers[${PYTHON_USEDEP}]
	=dev-python/pytest-2.7.8[${PYTHON_USEDEP}] )
"


