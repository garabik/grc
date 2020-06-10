if [[ "$TERM" != dumb ]] && (( $+commands[grc] )) ; then

  # Supported commands
  cmds=(
    as \
    blkid \
    cc \
    configure \
    df \
    dig \
    diff \
    docker \
    docker-machine \
    du \
    env \
    free \
    fdisk \
    findmnt \
    g++ \
    gcc \
    getsebool \
    head \
    id \
    ifconfig \
    ip \
    iptables \
    gas \
    ld \
    ls \
    lsof \
    lsblk \
    lspci \
    make \
    mount \
    mtr \
    netstat \
    ping \
    ps \
    semanage \
    traceroute \
    traceroute6 \
    tail \
    whois \
  );

  # Set alias for available commands.
  for cmd in $cmds ; do
    if (( $+commands[$cmd] )) ; then
      alias $cmd="grc --colour=auto $(whence $cmd)"
    fi
  done

  # Clean up variables
  unset cmds cmd
fi
