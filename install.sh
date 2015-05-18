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
cp -fv $MANDIR/man1/grc.1 $MANDIR
cp -fv $MANDIR/man1/grcat.1 $MANDIR
cp -fv grc.conf $CONFDIR
cp -fv grc.bashrc $PROFILEDIR
