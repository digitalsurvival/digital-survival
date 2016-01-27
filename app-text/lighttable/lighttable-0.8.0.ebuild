# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

# Cleanly make necessary adjustments for SRC_URI
MY_PV="${PV/_/-}"
MY_PN="LightTable"

DESCRIPTION="A next-generation open source text editor for rapid software development."
HOMEPAGE="http://lighttable.com/"
SRC_URI="https://github.com/LightTable/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/atk
dev-libs/expat
dev-libs/glib
dev-libs/nspr
dev-libs/nss
gnome-base/gconf
media-libs/alsa-lib
media-libs/fontconfig
media-libs/freetype
net-print/cups
sys-apps/dbus
sys-devel/gcc
sys-libs/glibc
x11-libs/cairo
x11-libs/gdk-pixbuf
x11-libs/gtk+
x11-libs/libnotify
x11-libs/libX11
x11-libs/libXcomposite
x11-libs/libXcursor
x11-libs/libXdamage
x11-libs/libXext
x11-libs/libXfixes
x11-libs/libXi
x11-libs/libXrandr
x11-libs/libXrender
x11-libs/libXtst
x11-libs/pango
"

S="${WORKDIR}/${MY_PN}-${PV}"
