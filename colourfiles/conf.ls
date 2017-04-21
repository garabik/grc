# The following matches file sizes as produced by ls -l or ls -lh
# The output produced by ls -s is probably not specific
# enough to be reliably matched, especially considering ls -s(k|m|g|G).
#
# Example lines:
# -rw-r--r--   1 user staff 344M Mar 22 22:51 MVI_8735.m4v
# -rw-r--r--   1 user staff 360050327 Mar 22 22:51 MVI_8735.m4v
#
# The regexp uses lookahead to match a date following the size

# size: 1M <= size < 10M
regexp=\s+(\d{7}|\d([,\.]\d+)?M)(?=\s[A-Z][a-z]{2}\s)
colours=green
=======
# size: 10M <= size < 100M
regexp=\s+(\d{8}|\d\d([,\.]\d+)?M)(?=\s[A-Z][a-z]{2}\s)
colours=yellow
=======
# size: 100M <= size < 1G
regexp=\s+(\d{9}|\d{3}M)(?=\s[A-Z][a-z]{2}\s)
colours=red
=======
# size: 1G <= size
regexp=\s+(\d{10,}|[\d\.,]+G)(?=\s[A-Z][a-z]{2}\s)
colours=bold red
=======
# device major minor numbers
regexp=\s(\d+),\s+(\d+)\s
colours=default,bright_yellow ,yellow
=======
# time
regexp=(\s|^)[0-2]?\d(:[0-5]\d)(?=[\s,]|$)
colours=white
=======
# month
#regexp=\s[A-Z][a-z]{2}\s
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
