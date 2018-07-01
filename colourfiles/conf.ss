# status
regexp=\[.*\]
colours=green
=======
# Local Address:Port   Peer Address:Port
regexp=\s((?:\d+\.){3}\d+|\*|\[?[\da-fA-F\.:]+\]?|[\w\d\-\_\.]+)(%[\w\d]+)?:(\S+)\s+\s((?:\d+\.){3}\d+|\*|\[?[\da-fA-F\.:]+\]?|[\w\d\-\_\.]+):(\S+)
colours=default,bright_green,blue,bright_red,cyan,magenta
=======
# process name
regexp=\("([^"]+)",
colours=blue
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
