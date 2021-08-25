#!/usr/bin/env fish
#
# To load in ~/.config/fish/config.fish or a new file in
# ~/.config/fish/conf.d add:
# source /etc/grc.fish (path may vary depending on installation method)
#
# See also the plugin at https://github.com/oh-my-fish/plugin-grc

set -q grc_plugin_execs; or set -l grc_plugin_execs cat cvs df diff dig gcc g++ ls ifconfig \
       make mount mtr netstat ping ps tail traceroute \
       wdiff blkid du dnf docker docker-compose docker-machine env id ip iostat journalctl kubectl \
       last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap \
       fdisk findmnt free semanage sar ss sysctl systemctl stat showmount \
       tcpdump tune2fs vmstat w who sockstat

for executable in $grc_plugin_execs
    if type -q $executable
        function $executable --inherit-variable executable --wraps=$executable
            grc $executable $argv
        end
    end
end
