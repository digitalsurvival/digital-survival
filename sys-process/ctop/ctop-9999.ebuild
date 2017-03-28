# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

EGO_PN="github.com/bcicen/ctop"

if [[ "${PV}" == "9999" ]]; then
	inherit golang-vcs
else
	SRC_URI="https://${EGO_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Concise commandline monitoring for containers"
HOMEPAGE="https://bcicen.github.io/ctop/"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-go/glide"
RDEPEND=""


