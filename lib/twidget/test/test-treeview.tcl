#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}


lappend ::auto_path ../

package require twidget::treeview
package require twidget::ibox
package require twidget::hook
package require img::png



proc ::evt_handler {args} {
	puts $args
	
	return 1
}

 
proc test-create {} {
	set tree [::twidget::treeview new .tree]
	
	
	$tree hook install <Item-Menu> [list ::evt_handler Item-Menu]
	$tree hook install <Tree-Menu> [list ::evt_handler Tree-Menu]	
	
	set ibox [::twidget::ibox new]
	$ibox add folder.png
	$ibox add file.png
	
	set item1 [$tree item add 0 "item1" -open yes]
	
	set child1 [$tree item add $item1 "child1" -openimage [$ibox get folder] -closeimage [$ibox get file]]
	set child2 [$tree item add $item1 "child2" ]
	
	$tree item add $child1 "chch1"
	
	$tree item delete $child2
	
	pack [$tree cget -frame] -expand 1 -fill both
		


}

test-create


