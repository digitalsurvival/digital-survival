# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Anaconda runtime meta-package"
SRC_URI=""
HOMEPAGE="https://github.com/rhinstaller/anaconda https://rhinstaller.github.io/anaconda/"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND=""
RDEPEND="
	app-admin/system-config-date
	app-admin/system-config-keyboard
	app-admin/system-config-users
	=app-misc/gentoo-version-11
	app-text/xmlto
	dev-libs/elfutils
	dev-libs/libnl
	dev-libs/libxml2[python]
	dev-python/pyblock
	dev-python/python-cryptsetup
	dev-python/python-meh
	dev-python/python-nss
	dev-python/python-report
	dev-python/urlgrabber
	dev-util/pykickstart
	net-misc/curl
	net-misc/dhcp
	>=net-misc/networkmanager-0.7.2
	sys-apps/dmidecode
	sys-apps/keyboard-configuration-helpers
	sys-apps/language-configuration-helpers
	>=sys-boot/grub-1.98
	sys-boot/makebootfat
	sys-fs/btrfs-progs
	sys-fs/cryptsetup
	sys-fs/dosfstools
	sys-fs/e2fsprogs
	sys-fs/jfsutils
	sys-fs/mdadm
	sys-fs/multipath-tools
	sys-fs/ntfsprogs
	sys-fs/reiserfsprogs
	sys-fs/squashfs-tools
	sys-fs/xfsprogs
	sys-libs/cracklib
	sys-libs/libuser
	sys-libs/slang"
