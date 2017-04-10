#!/usr/bin/env fish
if type -q grc
  # Default commands which will be colorized
  # Ignore ls by default
  set -l execs cat cvs df diff dig gcc g++ ifconfig \
               make mount mtr netstat ping ps tail traceroute \
               wdiff \
               blkid du docker docker-machine env ip iostat \
               last lsattr lsblk lspci lsmod getfacl getsebool ulimit uptime nmap \
               free semanage sar ss sysctl systemctl stat showmount tune2fs \
               vmstat w who

  function grcwrap -a executable
    set executable $argv[1]

    if test (count $argv) -gt 1
      set arguments $argv[2..(count $argv)]
    else
      set arguments
    end

    set options_variable "grc_"$executable
    set options $$options_variable

    command grc -es --colour=auto $executable $options $arguments
  end

  # Create functions (aliases)
  for executable in $execs
    # Only add grc wrapper if the original executable exist
    if type -q $executable
      function $executable --inherit-variable executable --wraps=$executable
        grcwrap $executable $argv
      end
    end
  end
else
  echo 'You need to install grc!'
end
