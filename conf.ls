# size
regexp=(\s|^)\d+([.,]\d+)?\s?([kKMG][bB]|[bB]|[kKMG])(?=[\s,]|$)
colours=yellow
=======
# time
regexp=(\s|^)\d+(:\d+)+(?=[\s,]|$)
colours=bold green
=======
# mounth
regexp=\s[a-z]{3}\s
colours=yellow
=======
#regexp=(?<=\d):(?=\d)
#colours=bold yellow
#=======
# root
regexp=root|wheel(?=\s|$)
colours=bold red
=======
# -rwxrwxrwx 
regexp=(-|([bcCdDlMnpPs?]))(?=[-r][-w][-xsStT][-r][-w][-xsStT][-r][-w][-xsStT])
colours=unchanged,unchanged,bold blue
=======
regexp=(?<=[-bcCdDlMnpPs?])(-|(r))(-|(w))(-|([xsStT]))(?=[-r][-w][-xsStT][-r][-w][-xsStT])
colours=unchanged,unchanged,bold green,unchanged,bold green,unchanged,bold green
=======
regexp=(?<=[-bcCdDlMnpPs?][-r][-w][-xsStT])(-|(r))(-|(w))(-|([xsStT]))(?=[-r][-w][-xsStT])
colours=unchanged,unchanged,bold yellow,unchanged,bold yellow,unchanged,bold yellow
=======
regexp=(?<=[-bcCdDlMnpPs?][-r][-w][-xsStT][-r][-w][-xsStT])(-|(r))(-|(w))(-|([xsStT]))
colours=unchanged,unchanged,bold red,unchanged,bold red,unchanged,bold red
