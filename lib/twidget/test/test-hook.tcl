#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}

lappend ::auto_path ../

package require twidget::hook

proc hook {args} {
	puts $args d sf
	
	return hook1
}

proc hook2 {args} {
	puts $args d sf
	
	return hook2
}

set h [::twidget::hook new]

set id [$h install <PAST> [list hook 1 2 3]]

set id2 [$h install <PAST> [list hook2 4 5 6]]

puts ret=[$h invoke <PAST> a b c]

$h uninstall <PAST>  $id

puts ret=[$h invoke <PAST> a b c]

$h destroy
