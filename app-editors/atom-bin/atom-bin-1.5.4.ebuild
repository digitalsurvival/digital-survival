# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

# Cleanly make necessary adjustments for SRC_URI
#MY_PV="${PV/_/-}"
#MY_PN="LightTable"

DESCRIPTION="GitHub's hackable text editor."
HOMEPAGE="https://atom.io/"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
sys-devel/make
sys-devel/gcc[cxx]
gnome-base/gconf
net-libs/nodejs
dev-lang/python
gnome-base/libgnome-keyring
dev-vcs/git
"

S="${WORKDIR}/${MY_PN}-${PV}"
