#!/bin/sh

DESTDIR=$1
BINDIR=$DESTDIR/usr/bin
LIBDIR=$DESTDIR/usr/share/grc
MANDIR=$DESTDIR/usr/share/man/man1
CONFDIR=$DESTDIR/etc

mkdir -p $BINDIR || true
cp -fv grc grcat $BINDIR
mkdir -p $LIBDIR || true
cp -fv conf.* $LIBDIR
mkdir -p $CONFDIR || true
cp -fv grc.conf $CONFDIR
