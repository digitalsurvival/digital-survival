# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{3,4,5}} )

inherit cmake-utils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lpereira/${PN}.git"
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/lpereira/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="An experimental, scalable, high performance HTTP server"
HOMEPAGE="https://lwan.ws"

LICENSE="GPL-2"
SLOT="0"
IUSE="sqlite sql test valgrind"

DEPEND=">=dev-util/cmake-2.8.0
	sys-libs/zlib"
RDEPEND="
jemalloc? ( dev-libs/jemalloc )
lua ( || dev-lang/lua dev-lang/luajit )
sqlite? ( dev-db/sqlite:3 )
sql? ( || dev-db/mysql dev-db/mariadb )
test ( dev-lang/python
	dev-python/requests[${PYTHON_USEDEP}] )
valgrind ( dev-util/valgrind )
"
#dev-util/gperftools
