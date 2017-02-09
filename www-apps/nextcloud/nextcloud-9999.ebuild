# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils webapp

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}/server.git"
	KEYWORDS=""
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://download.nextcloud.com/server/releases/${P}.zip -> ${PF}.zip
	https://github.com/nextcloud/server/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A safe home for all your data (Owncloud fork)"
HOMEPAGE="https://nextcloud.com/
	https://github.com/nextcloud/server"

LICENSE="AGPL-3"

IUSE="+curl mysql postgres +sqlite"
REQUIRED_USE="|| ( mysql postgres sqlite )"

DEPEND=""
RDEPEND="dev-lang/php[curl?,filter,gd,hash,json,mysql?,pdo,posix,postgres?,session,simplexml,sqlite?,xmlreader,xmlwriter,zip]
	virtual/httpd-php"

S=${WORKDIR}/${PN}

pkg_setup() {
	webapp_pkg_setup
}

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r .
	dodir "${MY_HTDOCSDIR}"/data

	webapp_serverowned -R "${MY_HTDOCSDIR}"/apps
	webapp_serverowned -R "${MY_HTDOCSDIR}"/data
	webapp_serverowned -R "${MY_HTDOCSDIR}"/config
	webapp_configfile "${MY_HTDOCSDIR}"/.htaccess

	webapp_src_install
}

pkg_postinst() {
	elog "Additional applications (calendar, ...) are no longer provided by default."
	elog "You can install them after login via the applications management page"
	elog "(check the recommended tab). No application data is lost."
	webapp_pkg_postinst
}
