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
        ant
        blkid
        cc
        curl
        cvs
        df
        diff
        dig
        docker
        docker-compose
        docker-machine
        du
        dnf
        # env
        fdisk
        findmnt
        free
        g++
        gas
        gcc
        getfacl
        getsebool
        gmake
        gpg
        head
        id
        ifconfig
        iostat
        ip
        iptables
        iwconfig
        journalctl
        kubectl
        last
        ld
        # ls
        lsattr
        lsblk
        lsmod
        lsof
        lspci
        make
        mount
        mtr
        mvn
        netstat
        nmap
        ntpdate
        php
        ping
        ping6
        proftpd
        ps
        sar
        semanage
        sensors
        setfacl
        showmount
        sockstat
        ss
        stat
        sysctl
        systemctl
        tcpdump
        tail
        traceroute
        traceroute6
        tune2fs
        ulimit
        uptime
        vmstat
        wdiff
        who
        whois
    )

    for name in ${cmds[@]}; do
        alias $name="colourify $name"
    done

    alias configure='colourify ./configure'
}

set_grc_aliases
