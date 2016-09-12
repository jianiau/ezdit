#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}

lappend ::auto_path ../

package require twidget::rc

set rc	[twidget::rc new a.rc]

puts exists=[$rc exists Files]
puts gets=[$rc get Files]

$rc set Files "a.txt" "c:/new project/a.txt   " "   hello.exit"
# a.txt

$rc append Files "append.txt"

puts exists=[$rc exists Files]
puts gets=[$rc get Files]
#$rc delete Files
#puts exists=[$rc exists Files]
#puts gets=[$rc get Files]

$rc destroy
