package require twidget::base
package provide twidget::dialog  $::twidget::Priv(version)

::oo::class create $::twidget::Priv(prefix)::dialog {
	constructor {path args} {
		my variable Priv opts
		
		array set opts [list \
			-title "" \
			-default "" \
			-buttons "" \
			-grab "none" \
			-type "basic" \
			-message "" \
			-position "near" \
			-icon "" \
			-detail "" \
			-value "" \
			-modal 1 \
			-cancel 0 \
			-font EzDefaultFont \
		]
		
		array set opts $args
		set Priv(win) $path
	}

	destructor {
		my variable Priv opts
		array unset Priv
		array unset opts
	}
	
	method body {parent} {
		
	}	
	
	method close {ret} {
		my variable Priv opts
		set Priv(ret) $ret
		
		after idle [destroy $Priv(win)]
	}

	method bottom {parent} {
		my variable Priv opts
		
		set win $Priv(win)
		set cut 0
		foreach {txt id} [lreverse $opts(-buttons)] {
			set btn [ttk::button $parent.$cut -text $txt -command [list [self object] close $id]]
			
			if {$id == $opts(-default)} {
				$btn configure -default active
				bind $win <Return> [list  $btn invoke]
			}
			pack $btn -side right -padx 3 -pady 3
			incr cut
		}
		
	}
	
	method fontbox {parent} {
		my variable Priv opts
		
		set fme $parent
		
		set opts(-fontPreview) [font create \
			-family [font configure $opts(-font) -family] \
			-size [font configure $opts(-font) -size]]
		set opts(-fontSize) [font configure $opts(-fontPreview) -size]
		set opts(-fontFamily) [font configure $opts(-fontPreview) -family]
		if {[string index $opts(-fontFamily) 0] == "\{" && [string index $opts(-fontFamily) end] == "\}"} {
			set opts(-fontFamily) [string range $opts(-fontFamily) 1 end-1]
		}
		
		set fonts [list] 
		foreach f [lsort -dictionary [font families]] {lappend fonts $f}
		set sizes [list] 
		foreach f [list 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24] {lappend sizes $f}			
		
		set lblFont [ttk::label $fme.lbl -text [::msgcat::mc "Font"]]
		set cmbFont [ttk::combobox $fme.cmbFont \
			-state readonly \
			-values $fonts \
			-textvariable [self namespace]::opts(-fontFamily)]

		set cmbSize [ttk::combobox $fme.cmbSize \
			-state readonly \
			-values $sizes \
			-textvariable [self namespace]::opts(-fontSize)]	
		
		set btnPreview [ttk::button $fme.btn -text [::msgcat::mc "Preview"] \
			-command [format {
				namespace eval %s {
					font configure $opts(-fontPreview) -size $opts(-fontSize) -family $opts(-fontFamily)
				}
		} [self namespace]]]
		
		set txt [text $fme.txt  -height 3 -bd 2 -width 25 \
			-relief groove \
			-font $opts(-fontPreview)]	
		$txt insert end "Test : 123 abc ABC"
		
		grid $lblFont $cmbFont $cmbSize -sticky "news" -padx 5 -pady 5
		grid $btnPreview -sticky "news" -padx 5 -pady 5
		grid $txt  - - -sticky "news" -padx 5 -pady 5
		
		grid rowconfigure $fme 2 -weight 1
		grid columnconfigure $fme 1 -weight 1		
		
	}	
	
	method inputbox {parent} {
		my variable Priv opts
		
		set fmeMain $parent
	
		if {[info exists opts(-icon)]} {
			set lblIcon [ttk::label $fmeMain.icon -image $opts(-icon)]
			pack $lblIcon -padx 2 -pady 2 -side left  -anchor nw
		}
	
		set body [ttk::frame $fmeMain.body]
		set lblMessage [ttk::label $body.lblMessage -text $opts(-message) -anchor nw]
		
		pack $lblMessage -expand 1 -fill both -padx 2 -pady 2 -side top
		
		if {[info exists opts(-detail)]} {
			set lblDetail [ttk::label $body.lblDetail \
								-text $opts(-detail) \
								-anchor nw ]
			pack $lblDetail -fill x -padx 2 -pady 2 -side top
		}
		
		set txtInput [ttk::entry $body.txt -textvariable [self namespace]::opts(-value)]
		$txtInput selection range 0 end
		focus $txtInput

		pack $txtInput -expand 1 -fill x -padx 2 -pady 2 -side top
		pack $body -expand 1 -fill both

	}
	
	method msgbox {parent} {
		my variable Priv opts
		
		set fmeMain $parent
	
		if {$opts(-icon) != ""} {
			set lblIcon [ttk::label $fmeMain.icon -image $opts(-icon)]
			pack $lblIcon -padx 2 -pady 2 -side left  -anchor nw
		}
	
		set body [ttk::frame $fmeMain.body]
		set  lblMessage [ttk::label $body.lblMessage -text $opts(-message) -anchor nw]
		
		pack $lblMessage -expand 1 -fill both -padx 2 -pady 2 -side top
		
		if {$opts(-detail) != ""} {
			set lblDetail [ttk::label $body.lblDetail \
								-text $opts(-detail) \
								-anchor nw ]
			pack $lblDetail -fill x -padx 2 -pady 2 -side top
		}
		
		pack $body -expand 1 -fill both -side left
	}	
	
	method move_center {{width ""} {height ""}} {
		my variable Priv opts
		
		update
		set win $Priv(win)
		foreach {s x y} [split [wm geometry [winfo parent $win]] "+"] {break}
		foreach {w h} [split $s "x"] {break}
		
		set oX [expr $x+$w/2]
		set oY [expr $y+$h/2]
	
		foreach {s x y} [split [wm geometry $win] "+"] {break}
		foreach {w h} [split $s "x"] {break}
		
		if {$width != ""} {set w $width}
		if {$height != ""} {set h $height}
	
		
		set oX [expr $oX-$w/2]
		set oY [expr $oY-$h/2]
	
		wm geometry $win ${w}x${h}+${oX}+${oY}
		
	}	
	
	method move_near {{width ""} {height ""}} {
		my variable Priv opts
		
		update
		
		set win $Priv(win)
		lassign [winfo pointerxy [winfo parent $win]] oX oY
	
		foreach {s x y} [split [wm geometry $win] "+"] {break}
		foreach {w h} [split $s "x"] {break}	
		
		set oX [expr $oX + 10]
		set oY [expr $oY - 10]
		
		if {$width != ""} {set w $width}
		if {$height != ""} {set h $height}		
	
		wm geometry $win ${w}x${h}+${oX}+${oY}
	}
	
	method show {{geometry ""}} {
		my variable Priv opts
		
		set win [toplevel $Priv(win)]
		pack [ttk::frame $win.body] -expand 1 -fill both -side top
		pack [ttk::frame $win.fmeBtn] -fill x
		
		if {$opts(-type) == "msgbox"} {my msgbox $win.body}
		if {$opts(-type) == "inputbox"} {my inputbox $win.body}
		if {$opts(-type) == "fontbox"} {my fontbox $win.body}
		
		my body $win.body
		
		if {$opts(-buttons) != ""} {my bottom $win.fmeBtn}
		
		wm title $win $opts(-title)
		wm transient $win .
		wm withdraw $win
		wm state $win normal
		
		if {$opts(-cancel)} {
			wm protocol $win WM_DELETE_WINDOW   [list [self object] close -1]
		} else {
			wm protocol $win WM_DELETE_WINDOW   {namespace eval :: {}}
		}

		if {$opts(-position) == "near" } {my move_near}
		if {$opts(-position) == "center" } {my move_center}

		if {$opts(-grab) == "global"} {
			grab -global  $win
		} elseif {$opts(-grab) == "local"} {
			grab $win	
		}

		if {$opts(-modal) == 0} {return}
		
		if {$geometry != ""} {wm geometry $win $geometry}
		update
		tkwait window $win
		
		if {$opts(-type) == "inputbox"} {set Priv(ret) [list $Priv(ret) $opts(-value)]}
		if {$opts(-type) == "fontbox"} {
			set Priv(ret) [list \
				$Priv(ret) \
				$opts(-fontFamily) \
				$opts(-fontSize) \
			]
			font delete $opts(-fontPreview)
		}
		
		return $Priv(ret)
	}
}
