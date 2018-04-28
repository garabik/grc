#!/bin/sh

set -e

PREFIX=${1:-/usr/local}
ETCPREFIX=$2


BINDIR=$PREFIX/bin
LIBDIR=$PREFIX/share/grc
MANDIR=$PREFIX/share/man
CONFDIR=$ETCPREFIX/etc
PROFILEDIR=$CONFDIR/profile.d

mkdir -p $BINDIR || true
cp -fv grc grcat $BINDIR
mkdir -p $LIBDIR || true
cp -fv colourfiles/conf.* $LIBDIR
mkdir -p $MANDIR/man1
cp -fv grc.1 $MANDIR/man1
cp -fv grcat.1 $MANDIR/man1
mkdir -p $CONFDIR
cp -fv grc.conf $CONFDIR
cp -fv grc.zsh $CONFDIR
cp -fv grc.fish $CONFDIR
mkdir -p $PROFILEDIR
cp -fv grc.bashrc $PROFILEDIR

# probably we should not install it into site-functions in a debian package...
if [ "$PREFIX" = "/usr/local" ]; then
  mkdir -p $PREFIX/zsh/site-functions
  cp -fv _grc $PREFIX/zsh/site-functions
fi

