DESTDIR =
PREFIX = /usr
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man
CONFDIR = /etc
CACHE_DIR = /var/cache/scratchpkg
PORT_DIR = /usr/ports
REVDEPD = $(PREFIX)/revdep.d
REVDEPCONF = $(PREFIX)/revdep.conf

install:
  mkdir -pv ${DESTDIR}{${BINDIR},${CONFDIR},${PORT_DIR},${REVDEPD}}
  mkdir -pv ${DESTDIR}${CACHE_DIR}/sources
  mkdir -pv ${DESTDIR}${CACHE_DIR}/packages
  mkdir -pv ${DESTDIR}${CACHE_DIR}/log
  mkdir -pv ${DESTDIR}${CACHE_DIR}/work
  install -m755 revdep pkgadd pkgdel pkgbuild pkgdeplist pkglibdepends scratch pkgbase ${DESTDIR}${BINDIR}
  install -m644 conf/scratchpkg.conf conf/scratchpkg.repo ${DESTDIR}${CONFDIR}
  install -m755 extra/* ${DESTDIR}${BINDIR}
  install -dm777 ${DESTDIR}${CACHE_DIR}/{packages,sources,log,work}
  install -m644 conf/revdep.conf ${DESTDIR}${REVDEPCONF}
