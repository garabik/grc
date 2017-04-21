#!/usr/bin/env fish
#
# To load in ~/.config/fish/fish.conf or a new file in
# ~/.config/fish/conf.d add:
# source /etc/grc.fish (path may depend on install method)
#
# See also the plugin at https://github.com/oh-my-fish/plugin-grc

set -U grc_plugin_execs cat cvs df diff dig gcc g++ ls ifconfig \
       make mount mtr netstat ping ps tail traceroute \
       wdiff blkid du dnf docker docker-machine env id ip iostat \
       last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap \
       fdisk findmnt free semanage sar ss sysctl systemctl stat showmount tune2fs \
       tcpdump tune2fs \
       vmstat w who

for executable in $grc_plugin_execs
    if type -q $executable
        alias $executable "grc $executable"
    end
end

