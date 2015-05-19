#!/bin/sh

set -e

PREFIX=$1
if [ -z $PREFIX ]; then
  PREFIX=/usr/local
fi

BINDIR=$PREFIX/bin
LIBDIR=$PREFIX/share/grc
MANDIR=$PREFIX/share/man
CONFDIR=/etc
PROFILEDIR=$CONFDIR/profile.d

mkdir -p $BINDIR || true
cp -fv grc grcat $BINDIR
mkdir -p $LIBDIR || true
cp -fv conf.* $LIBDIR
mkdir -p $MANDIR/man1
cp -fv grc.1 $MANDIR/man1
cp -fv grcat.1 $MANDIR/man1
cp -fv grc.conf $CONFDIR
cp -fv grc.bashrc $PROFILEDIR
