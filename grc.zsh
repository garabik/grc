if [[ "$TERM" = dumb ]] || (( ! $+commands[grc] )); then
  return
fi

# Supported commands
cmds=(
  cc
  configure
  cvs
  df
  diff
  dig
  gcc
  gmake
  ifconfig
  last
  ldap
  ls
  make
  mount
  mtr
  netstat
  ping
  ping6
  ps
  traceroute
  traceroute6
  wdiff
  whois
  iwconfig
)

# Set alias for available commands.
for cmd in $cmds; do
  if (( $+commands[$cmd] )) ; then
    alias $cmd="grc --colour=auto $commands[$cmd])"
  fi
done

# Clean up variables
unset cmds cmd
