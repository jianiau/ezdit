#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}


lappend ::auto_path ../

package require twidget::notebook
package require twidget::ibox
package require twidget::hook
package require img::png

package require tcltest
namespace import ::tcltest::*

event add <<ClosePage>> <ButtonRelease-2>

proc ::evt_handler {args} {
	puts $args
	
	return 1
}

proc test-create {} {
	test notebook {notebook create} -setup {
		set nb [::twidget::notebook new .nb 1 2 3 4 5]
	} -body {
		pack [$nb cget -frame] -expand 1 -fill both
	} -cleanup {
		$nb destroy
	} 
}

proc test-add-select-delete {} {
	test notebook {notebook add select delete} -setup {
		set nb [::twidget::notebook new .nb]

		$nb hook install <Count> [list ::evt_handler Count]
		$nb hook install <Selection> [list ::evt_handler Selection]
		$nb hook install <Delete> [list ::evt_handler Delete]

	set ibox [::twidget::ibox new]
	$ibox add folder.png		
	$ibox add file.png		
		
	} -body {
		$nb configure -tabbg [list black {selected} white {}] -tabfg [list blue {selected} red {}]
		pack [$nb cget -frame] -expand 1 -fill both
		$nb add "Tab1" [text .t]
		set sel [$nb add "Tab2" [text .t2]]
		set i4 [$nb add "Tab3" [text .t3]]
		
		$nb tab configure $i4 -image [list [$ibox get file] {selected} [$ibox get folder] {}]
		
		$nb add "Tab4" [text .t4]
		$nb selection $sel
		set ret [$nb selection]
		puts [$nb tab cget $sel -window]
		puts [$nb tab cget $sel -text]
		$nb tab configure $sel -text "ttt"
		$nb tab configure $sel -window [text .t5]
		
		.t5 insert end "adfa"
		#$nb delete $sel
		#$nb delete all
		
		set ret
	} -cleanup {
		
		#$nb destroy
	} -result 2
} 


test-create
#test-add-select-delete

