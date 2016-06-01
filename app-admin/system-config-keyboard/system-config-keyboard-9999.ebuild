# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.fedorahosted.org/git/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://fedorahosted.org/released/${PN}/${P}.tar.bz2 "
fi

DESCRIPTION="A Fedora keyboard management tool"
HOMEPAGE="https://fedorahosted.org/${PN}/wiki https://git.fedorahosted.org/git/${PN}.git"
LICENSE="GPL-2"

SLOT="0"
IUSE=""

DEPEND="dev-util/intltool
	sys-devel/gettext
	dev-util/desktop-file-utils"
RDEPEND="app-admin/firstboot"

#~ pkg_postrm() {
	#~ python_mod_cleanup /usr/share/${PN}
#~ }
