# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A composite linter and style checker for Python"
HOMEPAGE="https://github.com/rhinstaller/pocketlint"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="dev-python/pylint"

#S="${WORKDIR}/${MY_P}"

src_compile() {
	local use_selinux=0
	use selinux && use_selinux=1
	export EPATCH_OPTS="-d${S}"
	epatch "${FILESDIR}"/Werror.patch
	emake USESELINUX="${use_selinux}"
}
