# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.fedorahosted.org/git/${PN}.git"
	KEYWORDS=""
else
	inherit versionator
	MY_PV="$(replace_version_separator 2 '-' ${PV})"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${MY_P}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

DESCRIPTION="Python interface for working with block devices"
HOMEPAGE="https://git.fedorahosted.org/git/pyblock.git?p=pyblock.git;a=summary"
LICENSE="GPL-2"
SLOT="0"
IUSE="selinux"

DEPEND="sys-devel/gettext"
RDEPEND="${DEPEND}
	sys-fs/lvm2
	sys-fs/dmraid
	dev-python/pyparted
	"
S="${WORKDIR}/${MY_P}"

src_compile() {
	local use_selinux=0
	use selinux && use_selinux=1
	export EPATCH_OPTS="-d${S}"
	epatch "${FILESDIR}"/Werror.patch
	emake USESELINUX="${use_selinux}"
}
