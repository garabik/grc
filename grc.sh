# aliases for grc(1)

# this will execute only if there is a line with
# GRC_ALIASES=true
# in /etc/default/grc or you export GRC_ALIASES=true prior to sourcing this

[ -f /etc/default/grc ] && . /etc/default/grc

[ x$GRC_ALIASES = xtrue ] || return 0

GRC="$(which grc)"
if tty -s && [ -n "$TERM" ] && [ "$TERM" != dumb ] && [ -n "$GRC" ]; then
    alias colourify="$GRC -es"
    alias blkid='colourify blkid'
    alias configure='colourify ./configure'
    alias df='colourify df'
    alias diff='colourify diff'
    alias docker='colourify docker'
    alias docker-compose='colourify docker-compose'
    alias docker-machine='colourify docker-machine'
    alias du='colourify du'
#    alias env='colourify env'
    alias free='colourify free'
    alias fdisk='colourify fdisk'
    alias findmnt='colourify findmnt'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias id='colourify id'
    alias ip='colourify ip'
    alias iptables='colourify iptables'
    alias as='colourify as'
    alias gas='colourify gas'
    alias journalctl='colourify journalctl'
    alias kubectl='colourify kubectl'
    alias ld='colourify ld'
    #alias ls='colourify ls'
    alias lsof='colourify lsof'
    alias lsblk='colourify lsblk'
    alias lspci='colourify lspci'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias ss='colourify ss'
    alias traceroute='colourify traceroute'
    alias traceroute6='colourify traceroute6'
    alias head='colourify head'
    alias tail='colourify tail'
    alias dig='colourify dig'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias mtr='colourify mtr'
    alias semanage='colourify semanage'
    alias getsebool='colourify getsebool'
    alias ifconfig='colourify ifconfig'
    alias sockstat='colourify sockstat'
fi

