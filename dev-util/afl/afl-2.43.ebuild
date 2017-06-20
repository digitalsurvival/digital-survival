# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PV="${PV}b"
MY_P="${PN}-${MY_PV}"

if [[ "${PV}" == "9999" ]]; then
	SRC_URI="http://lcamtuf.coredump.cx/afl/releases/${PN}-latest.tgz -> ${P}.tar.tgz"
else
    SRC_URI="http://lcamtuf.coredump.cx/afl/releases/${PN}-${MY_PV}.tgz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A security-oriented fuzzer"
HOMEPAGE="http://lcamtuf.coredump.cx/afl/"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
