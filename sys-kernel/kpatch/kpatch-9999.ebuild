# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit linux-info linux-mod

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dynup/${PN}.git"
else
	SRC_URI="https://github.com/dynup/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Dynamic kernel patching for Linux"
HOMEPAGE="https://github.com/dynup/kpatch"
LICENSE="GPL-2"
SLOT="0"
IUSE="test examples +module"

DEPEND="
	dev-libs/elfutils
	>=sys-devel/gcc:4.9.3
"

RDEPEND="
	app-crypt/pesign
	dev-libs/openssl
	sys-libs/zlib
	sys-apps/pciutils
	sys-devel/bison
	>=sys-libs/ncurses:5
	sys-apps/yum
	"

pkg_pretend() {
if kernel_is gt 3 9 0; then
	if ! linux_config_exists; then
		eerror "Unable to check the currently running kernel for kpatch support"
		eerror "Please be sure a .config file is available in the kernel src dir"
		eerror "and ensure the kernel has been built."
	else
		# Fail to build if these kernel options are not enabled (see kpatch/kmod/core/Makefile)
		CONFIG_CHECK="FUNCTION_TRACER HAVE_FENTRY MODULES SYSFS KALLSYMS_ALL"
		ERROR_FUNCTION_TRACER="CONFIG_FUNCTION_TRACER must be enabled in the kernel's config file"
		ERROR_HAVE_FENTRY="CONFIG_HAVE_FENTRY must be enabled in the kernel's config file"
		ERROR_MODULES="CONFIG_MODULES must be enabled in the kernel's config file"
		ERROR_SYSFS="CONFIG_SYSFS must be enabled in the kernel's config file"
		ERROR_KALLSYMS_ALL="CONFIG_KALLSYMS_ALL must be enabled in the kernel's config file"
	fi
else
	eerror "kpatch is not available for Linux kernels below 4.0.0"
	eerror "Upgrade the kernel sources before installing kpatch." && die
fi
check_extra_config
}

src_install() {
	# KPATCH_BUILD ?= /lib/modules/$(shell uname -r)/build
	use? module; emake DESTDIR="${D}" install
}
