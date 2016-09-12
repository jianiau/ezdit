#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}

namespace eval ::twidget {
	variable Priv
	
	package require Tk
	if {$::tcl_version < 8.6} {
		package require TclOO
	}
	package require msgcat
	package require tooltip
	package require treectrl	
	package require autoscroll	
	
	array set Priv [list \
		os "linux" \
		version 1.0 \
		prefix "::twidget"
	]
	
	bind Text <<Redo>> {}
	bind Text <<Undo>> {}
	bind Text <<PasteSelection>> {}

	bind Text <Control-x> {}
	bind Text <Control-c> {}
	bind Text <Control-v> {}
	bind Text <Control-a> {}
	bind Text <Control-y> {}
	bind Text <Control-l> {}
	bind Text <Control-p> {}
	bind Text <Control-k> {}
	bind Text <Control-i> {}
	bind Text <Control-j> {}
	bind Text <Control-g> {}
	bind Text <Control-f> {}			
	bind Text <<Copy>> {}
	bind Text <<Cut>> {}
	bind Text <<Paste>> {}
					
	event delete <<Paste>>
	event add <<Copy>> <Control-c>
	event add <<Paste>> <Control-v>
	event add <<Cut>> <Control-x>
	event add <<CopyLine>> <Control-y>
	event add <<PasteLine>> <Control-p>
	event add <<CutLine>> <Control-k>	
	
	event add <<Find>> <Control-f>
	event add <<Goto>> <Control-g>		
	
	event add <<Save>> <Control-s>
	event add <<SelectAll>> <Control-a>
	event add <<Redo>> <Control-r>
	event add <<Undo>> <Control-z>
	event add <<ShowFindDialog>> <Control-f>
	event add <<ShowGotoDialog>> <Control-g>
	event add <<Indent>> <Control-period>
	event add <<UnIndent>> <Control-comma>	
	event add <<MoveUpLine>> <Control-i>
	event add <<MoveDownLine>> <Control-j>
	
	event add <<TabClose>> <ButtonRelease-2>
	event add <<MenuPopup>> <ButtonRelease-3>
	
	event add <<MarkToggle>> <Key-F9>
	event add <<MarkNext>>  <Control-F9>
	event add <<MarkPrev>> <Shift-F9>

			
	foreach {btn val} [list L 1 R 3 M 2] {
		event add <<Button${btn}Click>> <Button-$val>
		event add <<Button${btn}DClick>> <Double-Button-$val>
		event add <<Button${btn}Press>> <ButtonPress-$val>			
		event add <<Button${btn}Release>> <ButtonRelease-$val>			
	}

	font create EzDefaultFont -size 12  -family "Times"
	font create EzEditorFont -size 14  -family "Times"
	font create EzTreeviewFont -size 14  -family "Times"
	font create EzNotebookFont -size 14 -family "Times"

}
#
#proc ::twidget::msgcat_mc {args} {
#	return [::msgcat::mc {*}$args ]
#}


package provide twidget::base $::twidget::Priv(version)
