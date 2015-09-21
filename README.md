Generic Colouriser
==================

Author
------
Radovan Garabík  http://kassiopeia.juls.savba.sk/~garabik/software/grc.html

garabik @ kassiopeia.juls.savba.sk

Quick Usage
-----------
For the impatient - try following commands:

```shell
grc netstat
grc ping hostname
grc tail /var/log/syslog
grc ps aux
````

What is Colouriser
----------------

Being overflooded with different logfile colo(u)?ri(s|z)ers, colortails, gccolors, colormakes and similar programs for making  text files or outputs of different programs more readable by inserting ansi colour control codes into them, I decided to write  my very own colouriser, eventually providing the functions of all those others.

Two programs are provided: `grc` and `grcat`.  The main is `grcat`, which acts as a filter, i.e. taking standard input, colourising it and writing to standard output.

grcat - Configuring Colors and Usage
-------------------------------------

`grcat` takes as a parameter the name of configuration file.

Directories  `~/.grc/`, `/usr/local/share/grc/`, `/usr/share/grc/` are searched for the file (in this order). If the file is not found, it is assumed to be an absolute path of a configuration file located elsewhere.

Configuration file consists of entries, one per regexp, entries are separated with lines with first character non-alphanumeric (except #).

Lines beginning with # or empty lines are ignored.

Each entry consists of several lines.

Each line has form `keyword=value` where keyword is one of: `regexp`, `colours`, `command`, `skip`, `replace`, `count`.

Only `regexp` is mandatory, but it does not have much sense by itself unless you specify at least a `colour`, `skip`, `replace` or `command` keyword as well.

* `regexp` is the regular expression to match

* `colours` is the list of colours, separated by commas (you can specify only one colour), each colour per one regexp group specified in regexp. 

  If you use special colour name "previous", colour of the previous line of text will be used (actually, if both the first and last character of the previous line are of different colour than the default one, colour of the first one will be used). 

  Another special colour name "unchanged" will leave the colour unchanged, useful if you need some context for matching regular expression and you want to leave the colour of context unchanged.
  
  Yet another special name is an arbitrary string enclosed in straight quotes. This string will be inserted directly into the output in front of the matching expression. The string will be eval'ed, so you can use usual python escape sequences. This is useful on a 256-colour enabled xterm, where e.g. `colours="\033[38;5;22m"` will give you a dark green (inspired by Rutger Ovidius). Caveat: the string cannot contain a comma. This is due to my laziness :-)

* `command` is command to be executed when regexp matches. Its output will be mixed with normal stdout, use redirectors ( >/dev/null) if you want to suppress it.

* `skip` can be `skip=yes`, if that case the matched line is skipped (discarded from the output), or `skip=no`, when it is not skipped. Default (if you do not have skip keyword) is of course not skipped.

* `replace` means the regular expression match will be replaced by the value 

  All the preceeding regular expressions will be evaluated against the original text, but if they match and the replacement changes the length of the text, the colouring will *stay at the same positions*, which is probably not what you want - therefore put the `replace' rule preferrably at the beginning of config file

  All the following regular expressions will be evaluated against the replaced text, not the original replacement is done by re.sub(), therefore you can use anything python supports - in particular, \1, \2 etc... to include text from the original matching groups, e.g:
  
  	```INI
        regexp=(\d\d):(\d\d):(\d\d)
        replace=\1h\2m\3s
	``` 
  
  will change time format from `09:43:59` into `09h43m59s`

* count is one of words: `once`, `more`, `stop`, `previous`, `block` or `unblock`

  * `once` means that if the regexp is matched, its first occurrence is coloured and the program will continue with other regexp's.
  * `more` means that if there are multiple matches of the regexp in one line, all of them will be coloured.
  * `stop` means that the regexp will be coloured and program will move to the next line (i.e. ignoring other regexp's) 
  * `previous` means the count will be the same as for the previous line
  * `block` marks a start of a multiline block of text, coloured with the same colour 
  * `unblock` obviously marks the end of such a block

Example:

```INI
# this is probably a pathname
regexp=/[\w/\.]+
colour=green
count=more
```
This will match `/usr/bin`, `/usr/local/bin/`, `/etc/init.d/syslogd` and similar strings and paint it with green.

Another example:

```INI
regexp=^-{1,2}\s{0,1}$
colours=red
count=block
-
regexp=^\s{0,5}$
colours=default
count=unblock
```

This will turn all correctly formatted mail signatures red.

Regular expressions are evaluated from top to bottom, this allows nested and overlapped expressions. (e.g. you colour everything inside parentheses with one colour, and if a following expression matches the text inside       parentheses, it will be also coloured)

Typical usage:

```Shell
grcat conf.log < /var/log/syslog
/usr/sbin/traceroute www.linux.org | grcat conf.traceroute
grcat conf.esperanto < Fundamento.txt  | less -r
```

grc
---

To facilitate the use, command grc acts as frontend for `grcat`, automatically  choosing the configuration files, so you can write:

```Shell
grc netstat
grc ping hostname
grc tail /var/log/syslog
```

etc...

`grc` will execute command command with optional parameters piping its stdout into `grcat`.

grc.conf
--------
Configuration file for grcat is determined by `/etc/grc.conf` or  `~/.grc/grc.conf` file.

Format of `/etc/grc.conf` or `~/.grc/grc.conf`: each entry consists of 2 lines, between entries there can be any number of empty lines or lines beginning with "#" (comments)

First line is regular expression, second line the name of configuration file for grcat.

Configuration file after the first regular expression matching the rest of line after grc will be passed to grcat as its configuration file

For example, if you have 

```INI
# log file
\b\w+\b.*log\b
conf.log

# traceroute command
(^|[/\w\.]+/)traceroute\s
conf.traceroute
```

in your `/etc/grc.conf`, then typing `grc cat /var/log/syslog` will use `conf.log` to colourise the output,
`grc /usr/sbin/traceroute www.linux.org` will use `conf.traceroute`.

Miscellaneous remarks
---------------------

You should get yourself familiar with regular expressions. Good reading is at http://docs.python.org/dev/howto/regex.html

The program is not yet optimized for speed. There are places that can give a big boost if optimized.

Regular expressions are handled by python, it means that they may be slightly different from those you know from perl or grep. It's not my fault in that case.

Colours are one of: 

* none
* default
* bold
* underline
* blink
* reverse
* concealed
* black
* green
* yellow
* blue
* magenta
* cyan
* white
* on_black
* on_green
* on_yellow
* on_blue
* on_magenta
* on_cyan
* on_white
* beep

Note: "on_red" means that the background (instead of foreground) is painted with red etc...

Additional colours can be: `dark`, `italic`, `rapidblink`, `strikethrough`. These are supported only on some terminals, so if you want to write portable configuration files, avoid uing them (idea by James Rowe).

There can be more attributes per line (separated by space), e.g.

```INI
# this is probably a pathname
regexp=/[\w/\.]+
colours=bold blink green
count=more
```

will display pathnames in bold blinking green

Python 3 compatibility
-----------------------

There is some preliminary python3 support, meaning that both `grc` and `grcat` will run under both python2 and python3. However, all the regular expressions are strings, and grcat works on string input (not bytes).

Therefore it will miserably fail if fed input with invalid UTF-8 characters.

Hints
-----

Following commands will display nice coloured log in virtual console 12:

If you have GNU tail:

```Shell
tail --follow=name /var/log/syslog | grcat conf.log >/dev/tty12 
```

or, if you have recent BSD tail:

```Shell
tail -F /var/log/syslog | grcat conf.log >/dev/tty12
```

If you want to start using grc automatically with supported commands, add source `/etc/grc.bashrc`
to your `.bash_profile` (assuming you copied `grc.bashrc` to `/etc`)
