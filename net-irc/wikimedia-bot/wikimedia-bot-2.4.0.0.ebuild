# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

if [[ "${PV}" == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/benapetr/${PN}.git"
else
	EGIT_BRANCH="master"
	EGIT_COMMIT="220fff686fdcd82f93286188065714cd3b5415a2"
	EGIT_REPO_URI="https://github.com/benapetr/${PN}.git"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="C# IRC bot designed for wikimedia intergration"
HOMEPAGE="https://meta.wikimedia.org/wiki/Wm-bot
		  https://github.com/benapetr/wikimedia-bot"
LICENSE=""
SLOT="0"

IUSE=""

DEPEND="dev-lang/mono"
RDEPEND=""
