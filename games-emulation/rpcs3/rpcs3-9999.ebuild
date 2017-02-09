# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

WX_GTK_VER="3.0"

inherit cmake-utils eutils pax-utils toolchain-funcs versionator wxwidgets games

if [[ "${PV}" == "9999" ]]; then
	EGIT_HAS_SUBMODULES=1
	EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Very experimental PS3 emulator"
HOMEPAGE="http://www.emunewz.net/forum/forumdisplay.php?fid=162"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=media-libs/glew-1.10
	x11-libs/libXext
	x11-libs/libXrandr
	media-libs/openal
	virtual/opengl
	"

# It says = with llvm for a reason.
# rpcs3 uses a API that was removed in 3.7.

DEPEND="${RDEPEND}
	app-arch/zip
	media-libs/freetype
	media-libs/libsoundtouch
	>=sys-devel/gcc-4.9
	sys-devel/llvm:0/3.6
	x11-libs/wxGTK:${WX_GTK_VER}
	"

src_configure() {
	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX=${GAMES_PREFIX}"
		"-Dprefix=${GAMES_PREFIX}"
		"-Ddatadir=${GAMES_DATADIR}/${PN}"
		"-Dplugindir=$(games_get_libdir)/${PN}"
	)

	cmake-utils_src_configure
}

src_compile() {
	# Rebuild the custom ffmpeg (yes, it cannot be removed)
	# Read ; very much like PPSSPP, this build.
	cd ffmpeg || die "Missing ffmpeg dir"

	emake

	cmake-utils_src_compile
}

src_install() {
	# This is not working as expected - it appears to just install asmjit?
	# cmake-utils_src_install

	dobin "${BUILD_DIR}/${PN}/${PN}"

	make_desktop_entry "rpcs3" "rpcs3" "rpcs3" "Game;"

	prepgamesdirs
}

pkg_postinst() {
	# Add pax markings for hardened systems
	pax-mark -m "${EPREFIX}"/usr/games/bin/"${PN}"

}
