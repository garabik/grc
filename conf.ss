# Local Address:Port
regexp=\s((?:\d+\.){3}\d+|\*|::1?|[\w\d\-\_\.]+):(\S+)\s+\s((?:\d+\.){3}\d+|\*|::1?|[\w\d\-\_\.]+):(\S+)
colours=default,bright_green,bright_red,cyan,magenta
=======
# ipx hostname
regexp=^IPX.*[\dABCDEF]+:[\dABCDEF]+
colours=green
=======
# protocols
regexp=(^tcp|^udp|^unix|^IPX|STREAM|DGRAM)
colours=magenta
=======
# protocols UDP
regexp=^udp
colours=yellow
=======
# protocols TCP
regexp=^tcp
colours=blue
=======
# status UNCONN
regexp=UNCONN
colours=dark red
=======
# status
regexp=FIN_WAIT.*
colours=red
=======
# status
regexp=SYN.*?
colours=bold red
=======
# status
regexp=LISTEN(ING)?
colours=bold blue
=======
# status
regexp=TIME_WAIT
colours=bold red
=======
# status
regexp=CLOS(E(_WAIT)?|ING)
colours=red
skip=yes
=======
# status
regexp=LAST_ACK
colours=red
=======
# status
regexp=ESTAB.*?\b|CONNECTED
colours=bold yellow
=======
# status
regexp=FREE
colours=bold green
=======
# status
regexp=DISCONNECTING
colours=red
=======
# status
regexp=CONNECTING
colours=green
=======
# status
regexp=UNKNOWN
colours=blink bold red
=======
# status
regexp=\[.*\]
colours=green
=======
# path
regexp=(\@)[\dabcdef]+
colours=green, bold green
=======
# timer
regexp=\d+sec
colours=yellow
=======
#Skip header
regexp=(Netid|State).*$
colours=default
