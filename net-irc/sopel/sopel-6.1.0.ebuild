EAPI=5
inherit eutils

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sopel-irc/sopel.git
		git://github.com/sopel-irc/sopel.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/sopel-irc/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	RESTRICT="primaryuri"
fi

DESCRIPTION="An open source IRC bot written in Python."
HOMEPAGE="http://sopel.chat/"
LICENSE="EFL-2.0"

SLOT="0"
IUSE=""

DEPEND="dev-python/xmltodict
dev-python/pytz

"

RDEPEND="${DEPEND}"

src_configure() {

}

src_install()
{
}

pkg_postinst() {
	elog "Thanks for installing Sopel! :)"
}
