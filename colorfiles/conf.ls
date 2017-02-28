# size
regexp=(\s|^)\d+([.,]\d+)?\s?([kKMG][bB]|[bB]|[kKMG])(?=[\s,]|$)
colours=yellow
=======
# device major minor numbers
regexp=\s(\d+),\s+(\d+)\s
colours=default,bright_yellow ,yellow
=======
# time
regexp=(\s|^)\d+(:\d+)+(?=[\s,]|$)
colours=white
=======
# month
#regexp=\s[a-z]{3}\s
#colours=yellow
#=======
#regexp=(?<=\d):(?=\d)
#colours=bold yellow
#=======
# root
regexp=\s(root|wheel)(?=\s|$)
colours=unchanged,bold white on_red
=======
# SELinux
regexp=(\w+_u):(\w+_r):(\w+_t):(\w\d)
colours=default,green,yellow,cyan,magenta
-
# -rwxrwxrwx ============================
# File Type
regexp=(-|([bcCdDlMnpPs?]))(?=[-r][-w][-xsStT][-r][-w][-xsStT][-r][-w][-xsStT])
colours=unchanged,unchanged,bold white
-
# owner rwx
regexp=(?<=[-bcCdDlMnpPs?])(-|(r))(-|(w))(-|([xsStT]))(?=[-r][-w][-xsStT][-r][-w][-xsStT])
colours=unchanged,unchanged,bright_green,unchanged,bright_green,unchanged,bright_green
-
# group rwx
regexp=(?<=[-bcCdDlMnpPs?][-r][-w][-xsStT])(-|(r))(-|(w))(-|([xsStT]))(?=[-r][-w][-xsStT])
colours=unchanged,unchanged,yellow,unchanged,yellow,unchanged,yellow
-
# other rwx
regexp=(?<=[-bcCdDlMnpPs?][-r][-w][-xsStT][-r][-w][-xsStT])(-|(r))(-|(w))(-|([xsStT]))
colours=unchanged,unchanged,bright_red,unchanged,bright_red,unchanged,bright_red
-
# sStT all
regexp=(?<=[-bcCdDlMnpPs?])[-r][-w]([sStT])[-r][-w]([sStT])[-r][-w]([sStT])
colours=unchanged,bold green,bold yellow, bold red
-
# ACL
regexp=^\S{10}(\+)
colours=unchanged,on_cyan bold white
