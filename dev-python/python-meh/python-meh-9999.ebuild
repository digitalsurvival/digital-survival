# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/${P}.tar.gz"
fi

DESCRIPTION="Python exception handling library"
HOMEPAGE="https://github.com/rhinstaller/python-meh"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk"

COMMON_DEPEND="dev-util/intltool
	sys-devel/gettext
	dev-python/dbus-python
	dev-libs/libreport
	"
DEPEND="${COMMON_DEPEND}
	dev-python/setuptools
	dev-python/six
	"
# FIXME: missing RDEPENDs: rpm, yum
RDEPEND="${COMMON_DEPEND}
	dev-libs/newt
	gtk? ( dev-python/pygtk:2 )
	
	dev-python/python-report
	net-misc/openssh
	"

src_prepare() {
	cd "${S}"
	epatch "${FILESDIR}/${PN}-keep_exc_win_above.patch"
}
