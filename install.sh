#!/bin/sh

set -e

DESTDIR=$1
BINDIR=$DESTDIR/usr/local/bin
LIBDIR=$DESTDIR/usr/local/share/grc
MANDIR=$DESTDIR/usr/local/share/man/man1
CONFDIR=$DESTDIR/etc

mkdir -p $BINDIR || true
cp -fv grc grcat $BINDIR
mkdir -p $LIBDIR || true
cp -fv conf.* $LIBDIR
mkdir -p $CONFDIR || true
cp -fv grc.conf $CONFDIR
