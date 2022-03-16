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
cp -fvp grc grcat $BINDIR
mkdir -p $LIBDIR || true
cp -fvp colourfiles/conf.* $LIBDIR
mkdir -p $MANDIR/man1
cp -fvp grc.1 $MANDIR/man1
cp -fvp grcat.1 $MANDIR/man1
mkdir -p $CONFDIR
cp -fvp grc.conf $CONFDIR
cp -fvp grc.zsh $CONFDIR
cp -fvp grc.fish $CONFDIR
mkdir -p $PROFILEDIR
cp -fvp grc.sh $PROFILEDIR

# probably we should not install it into site-functions in a debian package...
if [ "$PREFIX" = "/usr/local" ]; then
  mkdir -p $PREFIX/zsh/site-functions
  cp -fvp _grc $PREFIX/zsh/site-functions
fi

