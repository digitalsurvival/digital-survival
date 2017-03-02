# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python{3_4,3_5} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/crsmithdev/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/crsmithdev/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Better dates and times in Python"
HOMEPAGE="http://arrow.readthedocs.io/en/latest/ https://github.com/crsmithdev/arrow/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="test"

RDEPEND="
	>=dev-python/python-dateutil-2.1[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	test? (
		>=dev-python/nose-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/simplejson-3.6.5[${PYTHON_USEDEP}] )
"
# FIXME: missing for running unittests:
# dev-python/nose-cov-1.6[${PYTHON_USEDEP}]
# dev-python/chai
