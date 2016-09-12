#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}


lappend ::auto_path ../

package require twidget::editor
package require twidget::ibox
package require twidget::hook
package require img::png

proc ::evt_handler {args} {
	puts $args
	
	return 1
}

 
proc test-create {} {
	set editor [::twidget::editor new .editor ../../src/tkcon.tcl]
	
	$editor hook install <Menu> [list ::evt_handler Menu]
	$editor hook install <YScroll> [list ::evt_handler YScroll]
	$editor hook install <Cursor> [list ::evt_handler Cursor]
	$editor hook install <Document> [list ::evt_handler Document]
	$editor hook install <Selection> [list ::evt_handler Selection]
	$editor hook install <Content> [list ::evt_handler Content]
	
	$editor goto 5.2
	

	
	# test -images
	puts [$editor cget -images]
	$editor configure -images [list cut [image create photo -file file.png]]
	puts [$editor cget -images]
	
	#test -iboxobject
	set ibox [::twidget::ibox new]
	$ibox add folder.png
	$editor configure -iboxobject $ibox
	puts [$editor cget -images]
	
	#test -font , -tabwidth
	$editor configure -font [font create -size 18] -tabwidth 7
	
	#test -hookobject
#	set hook [::twidget::hook new]
#	$editor configure -hookobject $hook

	#	test close
	# $editor close
	
	#$editor selection set 1.0 end
	#puts [$editor selection get]
	
	$editor indent add
	$editor indent delete
		
	$editor mark toggle 5 5
	$editor mark next
	$editor mark prev
	puts [$editor mark list]
	$editor mark clear
	
	$editor linebox toggle

	$editor search -all 1 tkcon	
	
	pack [$editor cget -frame] -expand 1 -fill both
		
	button .btn -text "save" -command [list $editor save]
	button .btn2 -text "enc -> big5" -command [list $editor configure -encoding big5]
	button .btn3 -text "linebox toggle" -command [list $editor linebox_toggle]
	pack .btn .btn2 .btn3 -fill x

}

test-create


