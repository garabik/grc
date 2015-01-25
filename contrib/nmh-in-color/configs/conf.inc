#---------------------------------------------------------------------------
# $Id: conf.inc,v 1.5 2001/01/20 00:00:57 mig Exp mig $
#---------------------------------------------------------------------------
# GRC config file for use with nmh(1) command inc(1).
#---------------------------------------------------------------------------
# Replies...
regexp=\s+R[Ee]:\s+.*
colours=blue
count=more
-
# Current message:
regexp=^\s{0,3}\d{1,5}\+.*
colours=green
count=once
