# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/digitalsurvival/${PN}.git
	git://github.com/digitalsurvival/${PN}.git"
	KEYWORDS=""
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/digitalsurvival/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Conveniently self-host (mirror) Gentoo repositories"
HOMEPAGE="https://github.com/digitalsurvival/${PN}"

LICENSE="GPL-2"
SLOT="0"
IUSE="+portage distfiles github"

src_install() {
	exeinto /opt/gentoo-rsync
	doexe "${S}"/rsync-gentoo-portage.sh

	insinto etc/rsync
	doins "${S}"/rsync/rsyncd.conf
	doins "${S}"/rsync/rsyncd.motd
	doins "${S}"/rsync/gentoo-mirror.conf
	dodir /opt/gentoo-rsync/portage
}

pkg_postinst() {
	elog "The rsync-mirror is now installed into /opt/gentoo-rsync"
	elog "The local portage copy resides in      /opt/gentoo-rsync/portage"
	elog "Please change /opt/gentoo-rsync/rsync-gentoo-portage.sh for"
	elog "configuration of your main rsync server and use it to sync."
	elog "Change /etc/rsync/rsyncd.motd to display your correct alias."
	elog
	elog "RSYNC_OPTS="--config=/etc/rsync/rsyncd.conf" needs"
	elog "to be set in /etc/conf.d/rsyncd to make allow syncing."
	elog
	elog "The service can be started using /etc/init.d/rsyncd start"
	elog "If you are setting up an official mirror, don't forget to add"
	elog "00,30 * * * *      root    /opt/gentoo-rsync/rsync-gentoo-portage.sh"
	elog "to your /etc/crontab to sync your tree every 30 minutes."
	elog
	elog "If you are setting up a private (unofficial) mirror, you can add"
	elog "0 3 * * *	root	/opt/gentoo-rsync/rsync-gentoo-portage.sh"
	elog "to your /etc/crontab to sync your tree once per day."
	elog
	elog "****IMPORTANT****"
	elog "If you are setting up a private mirror, DO NOT sync against the"
	elog "gentoo.org official rotations more than once a day.  Doing so puts"
	elog "you at risk of having your IP address banned from the rotations."
	elog
	elog "For more information visit: https://wiki.gentoo.org/wiki/Project:Infrastructure/Rsync"
}
