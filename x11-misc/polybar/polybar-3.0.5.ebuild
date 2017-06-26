# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jaagr/polybar.git"
	EGIT_CLONE_TYPE="shallow"
else
	SRC_URI="https://github.com/jaagr/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A fast and easy-to-use tool for creating status bars."
HOMEPAGE="https://github.com/jaagr/polybar"

LICENSE="MIT"
SLOT="0"

IUSE="alsa i3wm mpd github +network"
RDEPEND="
	x11-libs/libxcb
	dev-lang/python:2.7
	x11-proto/xcb-proto
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-image

	alsa? ( media-libs/alsa-lib )
	i3wm? ( dev-libs/jsoncpp )
	mpd? ( media-libs/libmpdclient )
	github? ( net-misc/curl )
	network? ( net-wireless/wireless-tools )
"
DEPEND="

${RDEPEND}"

CMAKE_BUILD_TYPE=Release

src_configure() {
	local mycmakeargs=(
		-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2
		-DENABLE_ALSA="$(usex alsa)"
		-DENABLE_MPD="$(usex mpd)"
		-DENABLE_NETWORK="$(usex network)"
		-DENABLE_I3="$(usex i3wm)"
		-DENABLE_CURL="$(usex github)"
	)
	cmake-utils_src_configure
}
