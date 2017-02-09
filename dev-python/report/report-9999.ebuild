# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit autotools eutils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.fedorahosted.org/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${P}.tar.xz"
fi

DESCRIPTION="Provides a single configurable problem/bug/issue reporting API."
HOMEPAGE="https://git.fedorahosted.org/cgit/report.git/"

LICENSE="GPL-2"
SLOT="0"

DEPEND="app-arch/rpm
	net-misc/curl"
RDEPEND="dev-libs/openssl
	net-misc/curl
	dev-libs/libxml2
	"

src_prepare() {
	eautoreconf || die "cannot run eautoreconf"
	autoreconf -i || die "wtf"
	eautomake || die "cannot run eautomake"
}

src_configure() {
	econf --prefix=/usr || die "configure failed"
}

src_compile() {
	# workaround crappy build system
	mkdir -p "${S}/python/report/templates/RHEL-template/bugzillaCopy"
	touch "${S}/python/report/templates/RHEL-template/bugzillaCopy/VERSION"
	emake || die "make failed"
}

src_install() {
	base_src_install

	# remove Red Hat stuff
	rm "${D}"/etc/report.d/RHEL.ini
	rm "${D}"/etc/report.d/dropbox.redhat.com.ini
	rm "${D}"/etc/report.d/bugzilla.redhat.com.ini

	# XXX: {not yet implemented} install Sabayon configuration
	# cp "${FILESDIR}"/bugs.sabayon.org.ini "${D}/etc/report.d/"
	find "${D}"/ -name "bugzilla-template" -type d | xargs rm -rf
	find "${D}"/ -name "RHEL-template" -type d | xargs rm -rf
	find "${D}"/ -name "strata-template" -type d | xargs rm -rf
}
