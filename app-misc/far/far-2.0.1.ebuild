# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Find and replace across a filesystem tree"
HOMEPAGE="http://findandreplace.sourceforge.net/"

#URL is messed up
SRC_URI="mirror://sourceforge/findandreplace/${PV}/${PN}-${PV}-sources.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="mirror"

DEPEND=">=dev-java/commons-logging-1.1[log4j]
	>=dev-java/log4j-1.2.17-r3
	test? ( dev-java/junit:0 )
"
RDEPEND=">=virtual/jre-1.8"

#src_install() {
#}
