# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_PN="pocket-lint"

SRC_URI="https://launchpad.net/pocket-lint/trunk/${PV}/+download/${P}.tar.gz"
DESCRIPTION="A composite linter and style checker for Python"
HOMEPAGE="https://launchpad.net/pocket-lint"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND=">=dev-python/pyflakes-0.5"

S="${WORKDIR}/${MY_P}"

src_compile() {
	local use_selinux=0
	use selinux && use_selinux=1
	export EPATCH_OPTS="-d${S}"
	epatch "${FILESDIR}"/Werror.patch
	emake USESELINUX="${use_selinux}"
}
