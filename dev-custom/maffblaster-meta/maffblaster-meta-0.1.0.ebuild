# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Metapackage for maffblaster's recommended applications"
HOMEPAGE="maffblaster.github.io"
#SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+system +backups +utilities +dev +communication +consulting"

RDEPEND="
	system? (
		sys-fs/btrfs-progs
		app-admin/sudo
		app-arch/cpio
		app-arch/unzip
		app-arch/zip
		sys-fs/dosfstools
		sys-fs/exfat-utils
		sys-fs/f2fs-tools
		sys-fs/fuse-exfat
		sys-fs/hfsutils
		sys-fs/jfsutils
		sys-fs/ntfs3g
		sys-fs/reiserfsprogs
		sys-fs/squashfs-tools
		sys-fs/sshfs
	)
	utilities? (
		app-admin/superadduser
		app-admin/hddtemp
		app-backup/snapper
		app-benchmarks/i7z
		app-editors/hexedit
		app-misc/uptimed
		media-video/vlc
		net-misc/dhcpcd
		net-misc/zsync
		sys-apps/ethtool
		sys-block/parted
		sys-fs/ncdu
		sys-process/atop
		sys-process/htop
		sys-process/iotop
		x11-misc/redshift
		app-arch/dpkg
	)
	communication? (
	www-client/chromium
	www-client/firefox
	www-client/links
	net-irc/weechat
	media-sound/mumble
	mail-client/mutt
	)
	dev? (
		app-portage/elogv
		app-portage/eix
		app-portage/portage-utils
		app-editors/vim
		app-cdr/cdrtools
		app-cdr/isomaster
		app-crypt/efitools
		app-crypt/gkeys
		app-crypt/gnupg
		app-crypt/keybase
		app-misc/tmux
		app-office/dia
		app-portage/gentoolkit
		app-portage/layman
		app-text/wgetpaste
		dev-libs/elfutils
		dev-util/geany
		dev-vcs/git
		dev-vcs/cvs
		sys-apps/fakeroot
		sys-apps/mlocate
		dev-util/pycharm-community
		dev-util/catalyst
		dev-util/ccache
	)
	consulting? (
		net-analyzer/nmap
		net-analyzer/wireshark
	)
	backups? (
		app-backup/obnam
	)
"
