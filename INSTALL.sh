#!/bin/bash

BINDIR=/usr/bin
CONFDIR=/etc
CACHE_DIR=/var/cache/scratchpkg
PORT_DIR=/usr/ports
REVDEPD=/etc/revdep.d
REVDEPCONF=/etc/revdep.conf

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
