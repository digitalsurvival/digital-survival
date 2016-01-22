# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mgrouchy/django-stronghold.git
		git://github.com/mgrouchy/django-stronghold.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/mgrouchy/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Force logins on Django apps"
HOMEPAGE="http://mikegrouchy.com/django-stronghold/"
LICENSE="MIT"

SLOT="0"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
>=dev-python/django-1.4.0
"

pkg_postinst() {
	elog "Thanks for installing django-stronghold! :)"
}
