# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.fedorahosted.org/${PN}.git"
else
	inherit versionator
	MY_PV="$(replace_version_separator 3 '-' ${PV})"
	MY_P="${PN}-${MY_PV}"
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${MY_P}.tar.xz -> ${P}.tar.xz"
fi

DESCRIPTION="Python bindings for Network Security Services (NSS)"
HOMEPAGE="https://git.fedorahosted.org/git/?p=python-cryptsetup.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-fs/cryptsetup"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
