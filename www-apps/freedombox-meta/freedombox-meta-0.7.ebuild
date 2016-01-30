# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Metapackage for FreedomBox; pulls in Plinth environment"
HOMEPAGE="https://freedomboxfoundation.org/"
LICENSE="metapackage"

SLOT="0"
IUSE=""

KEYWORDS="~amd64 ~x86"

# ldapscripts needs packaged (it does not exist yet)
# See https://github.com/freedombox/Plinth/blob/master/INSTALL
RDEPEND="app-admin/augeas
app-text/dblatex
sys-devel/gettext
net-misc/networkmanager
dev-ruby/jquery-rails
dev-ruby/modernizr
"
