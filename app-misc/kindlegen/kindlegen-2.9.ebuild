# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KINDLEGEN_URI="https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211"

SRC_URI=""
KEYWORDS="~amd64"
DESCRIPTION="Amazon's tool to convert source to KF8 and Mobi formats"
HOMEPAGE="https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211"
LICENSE="Amazon-Software-EULA"
SLOT="0"

IUSE=""

RESTICT="fetch preserve-libs strip"
QA_PREBUILT="*"

DEPEND=""
RDEPEND="${DEPEND}"
