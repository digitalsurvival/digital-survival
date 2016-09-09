# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/microsoft/${PN}.git
		git://github.com/microsoft/${PN}.git"
else
	SRC_URI="https://github.com/microsoft/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="A web-based real-time performance monitoring app"
HOMEPAGE="http://code.visualstudio.com/
	https://github.com/Microsoft/vscode"
LICENSE="MIT"
KEYWORDS="~x86 ~amd64"
SLOT="0"
#IUSE=""

#RDEPEND=""

#pkg_setup() { }

#src_prepare() { }

#src_configure() { }
