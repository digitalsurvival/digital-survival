# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A Python API documentation generator that works by static analysis"
HOMEPAGE="http://pypi.python.org/pypi/pydoctor"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# >=dev-python/nevow-0.9.18[${PYTHON_USEDEP}]
DEPEND="
	dev-python/epydoc[${PYTHON_USEDEP}]
	dev-python/twisted-core[${PYTHON_USEDEP}]
	"
RDEPEND="${DEPEND}"
