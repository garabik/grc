#!/usr/bin/env fish
# Main File: ~/.local/share/omf/pkg/grc/init.fish
# echo $grc_plugin_execs

set -U grc_plugin_execs cat cvs df diff dig gcc g++ ls ifconfig \
               make mount mtr netstat ping ps tail traceroute \
               wdiff \
               blkid du dnf docker docker-machine env ip iostat \
               last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap \
               fdisk findmnt free semanage sar ss sysctl systemctl stat showmount \
               tcpdump tune2fs vmstat w who id
