# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/servo/${PN}.git"
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/servo/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A prototype web browser engine written in the Rust language"
HOMEPAGE="https://servo.org/"

LICENSE="MPL-2.0"
SLOT="0"
IUSE=""

# dev-python/virtualenv
# rust
# 
DEPEND="net-misc/curl
	media-libs/freeglut
	media-libs/freetype
	media-libs/mesa
	dev-util/gperf
	dev-python/pip
	dev-libs/openssl
	x11-libs/libXmu
	media-libs/glu
	x11-base/xorg-server"
RDEPEND="${DEPEND}"
