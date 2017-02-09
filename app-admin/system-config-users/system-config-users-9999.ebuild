# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.fedorahosted.org/git/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	inherit versionator
	MY_PV="$(replace_all_version_separators '_')"
	MY_P="${PN}-${MY_PV}"
	# If the first download fails, then S must be adjusted with MY_P
	SRC_URI="https://fedorahosted.org/released/${PN}/${P}.tar.bz2 https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${MY_P}.tar.xz"
fi

DESCRIPTION="Fedora's system-config-users tool"
HOMEPAGE="http://fedoraproject.org/wiki/SystemConfig/users https://git.fedorahosted.org/git/system-config-users.git"
LICENSE="GPL-2"

SLOT="0"
IUSE="X"

DEPEND="dev-util/desktop-file-utils
	dev-util/intltool
	sys-apps/findutils
	sys-devel/gettext"

# FIXME: would require rpm-python
RDEPEND="
	X? (	>=dev-python/pygtk-2.6
		x11-misc/xdg-utils
	)
	>=sys-libs/libuser-0.56
	sys-libs/cracklib
	sys-process/procps"

PATCHES=( "${FILESDIR}/${PN}-kill-rpm.patch" )

S="${WORKDIR}/${MY_P}"

#~ pkg_postrm() {
	#~ python_mod_cleanup /usr/share/${PN}
#~ }

# FIXME: this package should depend against sys-apps/usermode
# which has been removed from Portage in May, 2009.
# If you intend to provide a full package in future (and not
# just stuff required by app-admin/anaconda, please consider
# to re-add sys-apps/usermode (version bumping, QA checking)
# and remove the hackish code in src_install below
src_install() {
	base_src_install

	# See FIXME above
	rm -rf "${D}/usr/share/"{man,applications}
	rm -rf "${D}/etc/"{pam.d,sysconfig,security}
	rm -rf "${D}/etc/sysconfig"
	rm -rf "${D}/usr/bin"
	find "${D}" -name "*.pyc" | xargs rm -f
}
