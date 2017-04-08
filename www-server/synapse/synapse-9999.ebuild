# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Matrix reference homeserver"
HOMEPAGE="https://matrix.org/"
SRC_URI="https://github.com/matrix-org/${PN}/archive/v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="
	test? ( 
	dev-python/twisted-core[${PYTHON_USEDEP}]
	dev-python/twisted-web[${PYTHON_USEDEP}]
	)"
RDEPEND=">=dev-python/netaddr-0.7.18[${PYTHON_USEDEP}]"

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && dodoc README.rst doc/*.txt
	distutils-r1_python_install_all
}

    ">=1.1.0": ["unpaddedbase64>=1.1.0"],
    "canonicaljson>=1.0.0": ["canonicaljson>=1.0.0"],
    "signedjson>=1.0.0": ["signedjson>=1.0.0"],
    "pynacl==0.3.0": ["nacl==0.3.0", "nacl.bindings"],
    "service_identity>=1.0.0": ["service_identity>=1.0.0"],
    "Twisted>=16.0.0": ["twisted>=16.0.0"],
    "pyopenssl>=0.14": ["OpenSSL>=0.14"],
    "pyyaml": ["yaml"],
    "pyasn1": ["pyasn1"],
    "daemonize": ["daemonize"],
    "py-bcrypt": ["bcrypt"],
    "pillow": ["PIL"],
    "pydenticon": ["pydenticon"],
    "ujson": ["ujson"],
    "blist": ["blist"],
    "pysaml2>=3.0.0,<4.0.0": ["saml2>=3.0.0,<4.0.0"],
    "pymacaroons-pynacl": ["pymacaroons"],
    "msgpack-python>=0.3.0": ["msgpack"],
    
    
    CONDITIONAL_REQUIREMENTS = {
    "web_client": {
        "matrix_angular_sdk>=0.6.8": ["syweb>=0.6.8"],
    },

    "email.enable_notifs": {
        "Jinja2>=2.8": ["Jinja2>=2.8"],
        "bleach>=1.4.2": ["bleach>=1.4.2"],
    },
    "matrix-synapse-ldap3": {
        "matrix-synapse-ldap3>=0.1": ["ldap_auth_provider"],
    },
    "psutil": {
        "psutil>=2.0.0": ["psutil>=2.0.0"],
    },
}

