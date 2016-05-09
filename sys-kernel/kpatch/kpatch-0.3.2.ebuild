# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit linux-info

DESCRIPTION="Dynamic kernel patching for Linux"
HOMEPAGE="https://github.com/dynup/kpatch"
SRC_URI="https://github.com/dynup/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="-* ~amd64"

DEPEND="dev-libs/elfutils
>=sys-devel/gcc-4.8.5
net-misc/wget
"

RDEPEND=""

pkg_pretend() {
if kernel_is gt 3 9 0; then
	if ! linux_config_exists; then
		eerror "Unable to check the currently running kernel for kpatch support"
		eerror "Please be sure a .config file is available in the kernel src dir"
		eerror "and ensure the kernel has been built."
	else
		# Fail to build if these kernel options are not enabled (see kpatch/kmod/core/Makefile)
		CONFIG_CHECK="FUNCTION_TRACER HAVE_FENTRY MODULES SYSFS KALLSYMS_ALL"
		ERROR_FUNCTION_TRACER="CONFIG_FUNCTION_TRACER must be enabled in the kernel"
		ERROR_HAVE_FENTRY="CONFIG_HAVE_FENTRY must be enabled in the kernel"
		ERROR_MODULES="CONFIG_MODULES must be enabled in the kernel"
		ERROR_SYSFS="CONFIG_SYSFS must be enabled in the kernel"
		ERROR_KALLSYMS_ALL="CONFIG_KALLSYMS_ALL must be enabled in the kernel"
	fi
else
	eerror "kpatch is not available for kernels below 4.0.0"
	eerror "Upgrade the kernel before installing kpatch."
fi
check_extra_config
}

src_install() {
	# KPATCH_BUILD ?= /lib/modules/$(shell uname -r)/build
	emake DESTDIR="${D}" install
}
