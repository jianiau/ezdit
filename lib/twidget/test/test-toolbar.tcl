#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}

lappend ::auto_path ../

package require twidget::toolbar
package require twidget::ibox
package require img::png

package require tcltest
namespace import ::tcltest::*

proc test-toolbar {} {
	test toolbar {toolbar} -setup {
		set tbar [::twidget::toolbar new .tbar]
		pack [$tbar cget -frame] -fill x
	} -body {
		set b1 [$tbar add button -text B1]
		$tbar delete $b1
		$tbar add button -text B1
		
		$tbar add checkbutton -text chk1 -variable ::e -onvalue 1 -offvalue 0
		$tbar add checkbutton -text chk2 -variable ::e
		$tbar add checkbutton -text chk3 -variable ::e
		
		$tbar add combobox -values [list a b c]
		
		$tbar add space_expand
		
		$tbar add entry -textvariable ::e
		$tbar add space -width 10
		$tbar add label -textvariable ::e
		$tbar add separator
		
		
		return ""
	} -cleanup {
		#$tbar destroy
	} -result ""
}

test-toolbar

#exit



