# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://www.bearssl.org/git/bearssl"
else
	SRC_URI="https://bearssl.org/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="a smaller ssl/tls library"
HOMEPAGE="https://bearssl.org/"
LICENSE="MIT"
SLOT="0"

IUSE="tools test"

DEPEND="virtual/libc"

src_install() {
	:
}
