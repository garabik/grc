#!/bin/sh

set -e

PREFIX=$1
ETCPREFIX=$2
if [ -z $PREFIX ]; then
  PREFIX=/usr/local
fi


BINDIR=$PREFIX/bin
LIBDIR=$PREFIX/share/grc
MANDIR=$PREFIX/share/man
CONFDIR=$ETCPREFIX/etc
PROFILEDIR=$CONFDIR/profile.d

mkdir -p $BINDIR || true
cp -fv grc grcat $BINDIR
mkdir -p $LIBDIR || true
cp -fv conf.* $LIBDIR
mkdir -p $MANDIR/man1
cp -fv grc.1 $MANDIR/man1
cp -fv grcat.1 $MANDIR/man1
mkdir -p $CONFDIR
cp -fv grc.conf $CONFDIR
mkdir -p $PROFILEDIR
cp -fv grc.bashrc $PROFILEDIR

