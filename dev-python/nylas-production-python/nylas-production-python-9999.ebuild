# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nylas/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="https://github.com/nylas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Utilities for running Python code in production"
HOMEPAGE="https://github.com/nylas/nylas-production-python
	https://nylas.com/docs/platform"
LICENSE="|| ( Apache-2.0 MIT )"

SLOT="0"
IUSE=""

# Todo:
# bump raven
# add dev-python/structlog-15.0.0
# 
DEPEND=">=dev-python/raven-5.5.0
	>=dev-python/gevent-1.0.1
	>=dev-python/colorlog-1.8
	>=www-servers/gunicorn-19.0.0
	"
RDEPEND=""
