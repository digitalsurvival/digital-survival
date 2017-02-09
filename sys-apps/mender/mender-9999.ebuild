# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGO_SRC="github.com/mendersoftware/"
EGO_PN="github.com/mendersoftware/${PN}"

if [[ "${PV}" == "9999" ]]; then
	inherit golang-vcs
else
	inherit golang-vcs-snapshot
	SRC_URI="https://${EGO_PN}/archive/integration-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit golang-build

DESCRIPTION=""
HOMEPAGE="https://${EGO_PN}"
LICENSE="Apache-2.0"

SLOT="0"
IUSE=""

DEPEND=">=dev-lang/go-1.6.0
dev-db/sqlite:3
sys-devel/gcc:="

RDEPEND=""

#use test && RESTRICT+=" sandbox"

#src_prepare() {
#	eapply_user
#}

