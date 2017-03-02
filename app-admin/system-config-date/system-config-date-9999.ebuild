# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	inherit versionator
	MY_PV="$(replace_all_version_separators '_')"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${PN}-${MY_PV}.tar.xz"
fi

DESCRIPTION="Fedora's system-config-date tool"
HOMEPAGE="http://fedoraproject.org/wiki/SystemConfig/date https://git.fedorahosted.org/git/${PN}.git"
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE="gtk"

# FIXME: would also require a dependency against anaconda
DEPEND="app-text/docbook-xml-dtd
	app-text/docbook-sgml-dtd
	app-text/gnome-doc-utils
	app-text/rarian
	dev-libs/newt
	dev-util/desktop-file-utils
	dev-util/intltool
	sys-devel/gettext"

# also net-misc/ntp would be a soft-dependency
# but code is redhat-centric, so we won't really
# let user use this crap
# net-misc/ntp
RDEPEND="dev-libs/newt
	dev-python/python-slip
	dev-python/rhpl
	gtk? (  dev-python/pygtk:2
	dev-python/libgnomecanvas-python
	x11-themes/hicolor-icon-theme )"

S="${WORKDIR}/${MY_P}"

src_install() {
	base_src_install

	# removing .desktop file, not advertising this, it is
	# only needed by app-admin/anaconda
	rm -rf "${D}/usr/share/"{man,applications}
	rm -rf "${D}/etc/"{pam.d,security}
	rm -rf "${D}/usr/bin"
}

pkg_postrm() {
	python_mod_cleanup /usr/share/${PN}
}
