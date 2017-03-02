# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit

# Dep of dev-cpp/microprofile for games-engines/intrinsic
if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/richgel999/${PN}.git"
else
	SRC_URI="https://github.com/richgel999/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Single C source file zlib-replacement library"
HOMEPAGE="https://github.com/richgel999/miniz"
LICENSE="Unlicense"
SLOT="0"

IUSE="examples"

DEPEND=">=dev-util/cmake-2.8.0"
RDEPEND="${DEPEND}"


