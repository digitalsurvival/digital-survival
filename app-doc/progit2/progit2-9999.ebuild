# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit ruby-fakegem

# https://wiki.gentoo.org/wiki/Project:Ruby/Packaging_RubyGems

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/progit/${PN}.git"
else
	SRC_URI="https://github.com/progit/${PN}/archive/${PV}.tar.gz"
	KEYWORDS="~amd64"
	
fi

DESCRIPTION="Pro Git 2nd Edition ebook"
HOMEPAGE="https://git-scm.com/book/en/v2"
LICENSE="CC-BY-NC-SA-3.0"
SLOT="0"

IUSE=""

DEPEND="dev-ruby/rake:0
dev-ruby/asciidoctor:0
dev-ruby/json:0
dev-ruby/awesome_print:0
dev-ruby/coderay:0
dev-ruby/pygments_rb:0
dev-ruby/thread_safe:0

# Todo
dev-ruby/asciidoctor-epub3-1.0.0.alpha.2
dev-ruby/asciidoctor-pdf-1.5.0.alpha.5
dev-ruby/epubcheck:0
dev-ruby/kindlegen:0
"
RDEPEND="${DEPEND}"
