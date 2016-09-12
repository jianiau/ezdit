#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}
set cmds [list]
set fd [open db.tcl w]
	foreach f [glob -directory [file join ./ tcl] -nocomplain -- *.tcl] {
		set fd2 [open $f r]
		foreach line [split [read $fd2] "\n"] {
			puts $fd $line
			if {[string first "TCLCMD" $line] > 0 || [string first "TKCMD" $line] > 0} {
				lassign [split $line " "] c a v
				lassign [split $a ","] a1 a2 a3
				lassign [split $a1 "("] a0 a1
				if {[lsearch $cmds $a1] == -1} {lappend cmds $a1}
			}
		}
		close $fd2
	}

	foreach f [glob -directory [file join ./ tk] -nocomplain -- *.tcl] {
		set fd2 [open $f r]
		foreach line [split [read $fd2] "\n"] {
			puts $fd $line
			if {[string first "TCLCMD" $line] > 0 || [string first "TKCMD" $line] > 0} {
				lassign [split $line " "] c a v
				lassign [split $a ","] a1 a2 a3
				lassign [split $a1 "("] a0 a1
				if {[lsearch $cmds $a1] == -1} {lappend cmds $a1}
				
			}
		}
		close $fd2
	}
	set cmds [lsort $cmds]
	puts $fd "set syndb(CMDS) \[list $cmds\]"
close $fd
puts "finish!!, created [pwd]/db.tcl"
