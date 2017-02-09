# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit webapp

if [[ "${PV}" == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
	inherit git-r3
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://builds.piwik.org/${P}.zip"
	KEYWORDS="~amd64 ~x86"
fi
DESCRIPTION="Real time web analytics software"
HOMEPAGE="https://piwik.org/ https://github.com/piwik/piwik"

LICENSE="GPL-3"
SLOT="0"
IUSE="sql"

# most unconditional dependencies are for plugins.d/charts.d.plugin:
RDEPEND="
	sql? ( || dev-db/mariadb dev-db/mysql )"
#RDEPEND="dev-lang/php[pdo,ctype,xml] || ( <dev-lang/php-5.3[spl,reflection] >=dev-lang/php-5.3 )"

need_httpd
#need_php_httpd

pkg_setup() {
	webapp_pkg_setup
}

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	dodir "${MY_HTDOCSDIR}/"{tmp,config}
	doins -r piwik/*

	webapp_serverowned -R "${MY_HTDOCSDIR}/"{tmp,config}
	webapp_postinst_txt en "${FILESDIR}"/installdoc.txt
	webapp_configfile "${MY_HTDOCSDIR}/config/"{global.ini.php,manifest.inc.php}
	webapp_src_install
	fperms -R 0660 "${MY_HTDOCSDIR}/"{tmp,config}
}

pkg_postinst() {
	elog "Install and upgrade instructions can be found here:"
	elog "  http://piwik.org/docs/installation-optimization/"
	webapp_pkg_postinst
}
