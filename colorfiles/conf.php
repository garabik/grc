# this configuration file is suitable for displaying php error log files
regexp=\] PHP [^\s]+ error:
colours=on_red
count=once
======
regexp=\] PHP Notice:
colours=on_yellow black
count=once
======
regexp=\] PHP Warning:
colours=on_cyan
count=once
======
regexp=(PHP )?Stack trace:
colours=on_green
count=once
======
regexp=] PHP [ \d]{2}\d\.
colours=on_green
count=once
======
# display this line in yellow and stop further processing
regexp=.*last message repeated \d+ times$
colours=yellow
count=stop
======
# this is date
regexp=^... (\d| )\d \d\d:\d\d:\d\d(\s[\w\d]+?\s)
colours=green, green, red
count=once
======
# everything in parentheses
regexp=\(.+?\)
colours=green
count=more
======
# everything in `'
regexp=\`.+?\'
colours=bold yellow
count=more
======
# this is probably a pathname
regexp=/[\w/\.]+
colours=bold green
count=more
======
# name of process and pid
regexp=([\w/\.\-]+)(\[\d+?\])
colours=bold blue, bold red
count=more
======
# ip number
regexp=\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}
colours=bold magenta
count=more
======
# connect requires special attention
regexp=connect
colours=on_red
count=more
======
regexp=not found or unable to stat
colours=black
count=block
======
regexp=File does not exist
colours=italic black
count=block
======
regexp=^\[
colours=default
count=unblock

