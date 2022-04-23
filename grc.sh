# aliases for grc(1)

# this will execute only if there is a line with
# GRC_ALIASES=true
# in /etc/default/grc or you export GRC_ALIASES=true prior to sourcing this

set_grc_aliases () {
    local grc="$(which grc)"
    [ -z "$GRC_ALIASES" ] && [ -f /etc/default/grc ] && . /etc/default/grc
    [ "$GRC_ALIASES" = "true" ] && tty -s && [ -n "$TERM" ] && [ "$TERM" != dumb ] && [ -n "$grc" ] ||
            return 0

    alias colourify="$grc -es"
    local cmds=(
        as
        blkid
        df
        diff
        dig
        docker
        docker-compose
        docker-machine
        du
        # env
        fdisk
        findmnt
        free
        g++
        gas
        gcc
        getsebool
        gpg
        head
        id
        ifconfig
        ip
        iptables
        journalctl
        kubectl
        ld
        # ls
        lsblk
        lsof
        lspci
        make
        mount
        mtr
        netstat
        ping
        ps
        semanage
        sockstat
        ss
        tail
        traceroute
        traceroute6
    )

    for name in ${cmds[@]}; do
        alias $name="colourify $name"
    done

    alias configure='colourify ./configure'
}

set_grc_aliases
