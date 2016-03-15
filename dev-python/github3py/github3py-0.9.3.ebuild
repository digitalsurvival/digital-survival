# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Python library for interfacing with the GitHub API v3"
HOMEPAGE="https://github.com/sigmavirus24/github3.py
http://github3py.readthedocs.org/en/master/"
# Use github since pypi is missing test data
SRC_URI="https://github.com/sigmavirus24/github3.py/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
    esetup.py test
}
	
