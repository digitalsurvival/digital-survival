# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nylas/${PN}.git"
else
	SRC_URI="https://github.com/nylas/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="An extensible mail client built with web technology (formerly N1)"
HOMEPAGE="https://nylas.com/nylas-mail/"
LICENSE="GPL-3"

SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""
