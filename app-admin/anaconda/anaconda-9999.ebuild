# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit flag-o-matic libtool autotools eutils

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/${PN}.git"
else
	KEYWORDS="~x86 ~amd64"
	inherit versionator
	MY_MAJORV="$(get_major_version)"
	if [[ "${MY_MAJORV}" -gt "21" ]]; then
		MY_PV="$(replace_version_separator 2 '-' ${PV})"
		MY_P="${PN}-${MY_PV}"
	else
		MY_PV="$(replace_version_separator 4 '-' ${PV})"
		MY_P="${PN}-${MY_PV}"
	fi
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/${MY_P}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="A Python-based graphical Linux installer"
HOMEPAGE="https://github.com/rhinstaller/anaconda
	https://rhinstaller.github.io/anaconda/"

AUDIT_VER="1.7.9"
AUDIT_SRC_URI="http://people.redhat.com/sgrubb/audit/audit-${AUDIT_VER}.tar.gz"

SEPOL_VER="2.0"
LSELINUX_VER="2.0.85"
LSELINUX_SRC_URI="http://userspace.selinuxproject.org/releases/current/devel/libselinux-${LSELINUX_VER}.tar.gz"

#~ if [ "${PV}" = "9999" ]; then
	#~ SRC_URI="${AUDIT_SRC_URI} ${LSELINUX_SRC_URI}"
	#~ KEYWORDS=""
#~ else
	#~ SRC_URI="http://distfiles.sabayon.org/${CATEGORY}/${PN}-${PVR}.tar.bz2 ${AUDIT_SRC_URI} ${LSELINUX_SRC_URI}"
	#~ KEYWORDS="~amd64 ~x86"
#~ fi

S="${WORKDIR}"/${PN}-${PVR}
AUDIT_S="${WORKDIR}/audit-${AUDIT_VER}"
LSELINUX_S="${WORKDIR}/libselinux-${LSELINUX_VER}"

LICENSE="GPL-2 public-domain"
SLOT="0"
IUSE="+ipv6 +nfs ldap"

AUDIT_DEPEND="dev-lang/swig"
AUDIT_RDEPEND="ldap? ( net-nds/openldap )"
LSELINUX_DEPEND="=sys-libs/libsepol-${SEPOL_VER}* dev-lang/swig"
LSELINUX_RDEPEND="=sys-libs/libsepol-${SEPOL_VER}*"
LSELINUX_CONFLICT="!sys-libs/libselinux" # due to pythonX.Y/site-packages+/usr/sbin not being handled
COMMON_DEPEND="app-admin/system-config-keyboard
	>=app-arch/libarchive-2.8
	app-cdr/isomd5sum
	dev-libs/newt
	nfs? ( net-fs/nfs-utils )
	sys-fs/lvm2
	~sys-block/open-iscsi-2.0.872"
DEPEND="${COMMON_DEPEND} ${AUDIT_DEPEND} ${LSELINUX_DEPEND} sys-apps/sed"
RDEPEND="${COMMON_DEPEND} ${AUDIT_RDEPEND}
	${LSELINUX_RDEPEND} ${LSELINUX_CONFLICT}
	app-misc/anaconda-runtime
	app-misc/anaconda-runtime-gui"

src_prepare() {

	# Setup CFLAGS, LDFLAGS
	append-cflags "-I${D}/usr/include/anaconda-runtime"
	append-ldflags "-L${D}/usr/$(get_libdir)/anaconda-runtime"

	# Setup anaconda
	cd "${S}"
	./autogen.sh || die "cannot run autogen"

	##
	## Setup libaudit
	##
	cd "${AUDIT_S}"
	# Patch libaudit to fix new glibc incompatibility
	epatch "${FILESDIR}/audit-glibc-fix.patch"
	# Do not build GUI tools
	sed -i \
		-e '/AC_CONFIG_SUBDIRS.*system-config-audit/d' \
		"${AUDIT_S}"/configure.ac || die "cannot sed libaudit configure.ac"
	sed -i \
		-e 's,system-config-audit,,g' \
		-e '/^SUBDIRS/s,\\$,,g' \
		"${AUDIT_S}"/Makefile.am || die "cannot sed libaudit Makefile.am"
	rm -rf "${AUDIT_S}"/system-config-audit

	if ! use ldap; then
		sed -i \
		-e '/^AC_OUTPUT/s,audisp/plugins/zos-remote/Makefile,,g' \
		"${AUDIT_S}"/configure.ac || die "cannot sed libaudit configure.ac (ldap)"
		sed -i \
			-e '/^SUBDIRS/s,zos-remote,,g' \
			"${AUDIT_S}"/audisp/plugins/Makefile.am || die "cannot sed libaudit Makefile.am (ldap)"
	fi
	eautoreconf

	# Patch libselinux to fix new glibc incompatibility
	cd "${LSELINUX_S}"
	epatch "${FILESDIR}/libselinux-glibc-fix.patch"

}

copy_audit_data_over() {
	dodir "/usr/$(get_libdir)/anaconda-runtime"
	cp -Ra "${AUDIT_S}/fakeroot/usr/$(get_libdir)/anaconda-runtime/"* \
		"${D}/usr/$(get_libdir)/anaconda-runtime" || die "cannot cp audit data"
	dodir "/usr/include/anaconda-runtime"
	cp -Ra "${AUDIT_S}/fakeroot/usr/include/anaconda-runtime/"* \
		"${D}/usr/include/anaconda-runtime" || die "cannot cp audit include data"
}

src_configure() {
	# configure audit
	cd "${AUDIT_S}"
	einfo "configuring audit"
	econf --sbindir=/sbin --libdir=/usr/$(get_libdir)/anaconda-runtime \
		--includedir=/usr/include/anaconda-runtime \
		--without-prelude || die

	# compiling audit here, anaconda configure needs libaudit
	einfo "compiling audit"
	cd "${AUDIT_S}" || die "cannot cd into ${AUDIT_S}"
	base_src_compile

	# installing audit
	einfo "installing audit libs into ${AUDIT_S}/fakeroot temporarily"
	cd "${AUDIT_S}" || die "cannot cd into ${AUDIT_S}"
	( rm -rf fakeroot && mkdir fakeroot ) || die "cannot mkdir"
	emake DESTDIR="${AUDIT_S}/fakeroot" install || die "cannot install libaudit"
	copy_audit_data_over # for proper linking

	# configure anaconda
	cd "${S}"
	einfo "configuring anaconda"
	econf \
		$(use_enable ipv6) $(use_enable selinux) \
		$(use_enable nfs) || die "configure failed"
}

src_compile() {

	cd "${S}"
	base_src_compile

	# compiling libselinux
	einfo "compiling libselinux"
	cd "${LSELINUX_S}" || die "cannot cd into ${LSELINUX_S}"
	LD_RUN_PATH="/usr/$(get_libdir)/anaconda-runtime" \
	emake \
		LDFLAGS="-fPIC ${LDFLAGS}" \
		PYLIBVER="python$(python_get_version)" \
		PYTHONLIBDIR="${D}/usr/$(get_libdir)/python$(python_get_version)" \
		SHLIBDIR="${D}/usr/$(get_libdir)/anaconda-runtime" \
		INCLUDEDIR="${D}/usr/include/anaconda-runtime" \
		all || die
	LD_RUN_PATH="/usr/$(get_libdir)/anaconda-runtime" \
	emake \
		LDFLAGS="-fPIC ${LDFLAGS}" \
		PYLIBVER="python$(python_get_version)" \
		PYTHONLIBDIR="${D}/usr/$(get_libdir)/python$(python_get_version)" \
		SHLIBDIR="${D}/usr/$(get_libdir)/anaconda-runtime" \
		INCLUDEDIR="${D}/usr/include/anaconda-runtime" \
		pywrap || die

		# add compatibility aliases to swig wrapper
		cat "${FILESDIR}/compat.py" >> "${LSELINUX_S}/src/selinux.py" || die

}

src_install() {

	# installing libselinux
	cd "${LSELINUX_S}"
	python_need_rebuild
	LD_RUN_PATH="/usr/$(get_libdir)/anaconda-runtime" \
	emake DESTDIR="${D}" \
		PYLIBVER="python$(python_get_version)" \
		PYTHONLIBDIR="${D}/usr/$(get_libdir)/python$(python_get_version)" \
		LIBDIR="${D}/usr/$(get_libdir)/anaconda-runtime" \
		SHLIBDIR="${D}/usr/$(get_libdir)/anaconda-runtime" \
		INCLUDEDIR="${D}/usr/include/anaconda-runtime" \
		install install-pywrap || die

	# fix libselinux.so link
	dosym libselinux.so.1 /usr/$(get_libdir)/anaconda-runtime/libselinux.so
	# LD_RUN_PATH works with ld >=2.20, so /etc/env.d/99anaconda for now
	# will be dropped in future
	echo "LDPATH=\"/usr/$(get_libdir)/anaconda-runtime\"" > 99anaconda
	doenvd 99anaconda

	cd "${S}"
	copy_audit_data_over # ${D} is cleared
	base_src_install

	# install liveinst for user
	dodir /usr/bin
	exeinto /usr/bin
	doexe "${FILESDIR}"/liveinst
	dosym /usr/bin/liveinst /usr/bin/installer

	# drop .la files for God sake
	find "${D}" -name "*.la" | xargs rm

	# Cleanup .pyc .pyo
	find "${D}" -name "*.py[co]" -type f -delete

	dodir /usr/libexec/fcoe
	cp "${S}/fcoe_edd.sh" "${D}/usr/libexec/fcoe/"
}

pkg_postrm() {
	python_mod_cleanup py${PN}
}

pkg_postinst() {
	python_mod_optimize py${PN}
}
