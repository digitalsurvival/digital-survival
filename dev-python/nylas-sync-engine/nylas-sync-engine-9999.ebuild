# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

MY_PN="sync-engine"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nylas/${MY_PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/nylas/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A Python IMAP/SMTP sync system with modern APIs"
HOMEPAGE="https://nylas.com/docs/platform"
LICENSE="AGPL-3"

SLOT="0"
IUSE=""

#TODO :
# add dev-python/nylas-production-python
# add dev-python/cpu_affinity
# update html2test to >=2014.9.8, currently it's 2014.9.8
# add dev-python/pyinstrument
# make sure dev-python/libnacl amd pynacl are the same package
# add dev-python/flanker
# add dev-python/arrow
# add dev-python/gevent-openssl
# add dev-python/backports-ssl
# update imapclient to 1.0.1
# add dev-python/tldextract
DEPEND=">=dev-python/gevent-1.0.1
	>=nylas-production-python-0.2.0
	>=dev-python/click-2.4
	>=dev-python/cpu_affinity-0.1.0
	dev-python/pyyaml
	=dev-python/sqlalchemy-1.0.11
	>=dev-python/alembic-0.6.4
	>=dev-python/requests-2.4.3
	>=dev-python/html2text-2014.9.8
	>=dev-python/pyinstrument-0.12
	>=dev-python/pymysql-0.6.2
	=dev-python/mysqlclient-1.3.7
	>=dev-python/setproctitle-1.1.8
	>=dev-python/pymongo-2.5.2
	=dev-python/python-dateutil-2.4.2
	>=dev-python/ipython-1.0.0
	=dev-python/enum34-1.0.4
	>=dev-python/gdata-2.0.18
	>=dev-python/icalendar-3.8.2
	>=dev-python/simplejson-3.6.0
	>=dev-python/flask-0.10.1
	=dev-python/flask-restful-0.3.2
	>=dev-python/libnacl-0.2.3
	>=dev-python/flanker-0.4.26
	>=dev-python/httplib2-0.8
	>=dev-python/six-1.8
	>=dev-python/vobject-0.8.1c
	>=dev-python/lxml-3.4.2
	=dev-python/arrow-0.5.4
	>=dev-python/statsd-3.1
	=dev-python/boto3-1.1.4
	=dev-python/pympler-0.4.2
	>=dev-python/pyopenssl-0.15.1
	=dev-python/gevent-openssl-1.2
	>=dev-python/backports-ssl-0.0.9
	=dev-python/imapclient-1.0.1
	=dev-python/tldextract-1.7.5
	"
RDEPEND=""
