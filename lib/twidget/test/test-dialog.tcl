#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}

lappend ::auto_path ../

package require twidget::dialog
package require twidget::ibox
package require img::png

package require tcltest
namespace import ::tcltest::*

proc test-dialog {} {
	test dialog {basic dialog yesno} -setup {
		set dlg [::twidget::dialog new .dialog \
			-title "dialog-test" \
			-default "yes" \
			-position center \
			-buttons [list yes Yes no No] \
		]
	} -body {
		oo::objdefine $dlg method body {parent} {
			set lbl [ttk::label $parent.lbl -text "Please press 'Yes' button."]
			pack $lbl -expand 1 -fill both
		}
		set ret [$dlg show]
	} -cleanup {
		$dlg destroy
				} -result yes
}

proc test-msgbox {} {
	test dialog {msgbox icon yes} -setup {
		set ibox [::twidget::ibox new]
		$ibox add file.png
		set dlg [::twidget::dialog new .dialog \
			-title "msgbox-test" \
			-default "yes" \
			-type "msgbox" \
			-position center \
			-message "This's message body" \
			-detail "This's detail" \
			-buttons [list yes Yes] \
			-icon [$ibox get file] \
		]
		
	} -body {
		set ret [$dlg show]
	} -cleanup {
		$dlg destroy
	} -result yes
}

proc test-input {} {
	test dialog {input icon okcancel} -setup {
		set ibox [::twidget::ibox new]
		$ibox add file.png
		set dlg [::twidget::dialog new .dialog \
			-title "inputbox-test" \
			-default "yes" \
			-type "inputbox" \
			-position center \
			-message "Please input '123'." \
			-detail "This's detail" \
			-value 345 \
			-buttons [list ok Ok cancel Cancel] \
			-icon [$ibox get folder] \
		]
		
	} -body {
		set ret [$dlg show]
	} -cleanup {
		$dlg destroy
	} -result [list ok 123] 
}

test-msgbox

#exit



