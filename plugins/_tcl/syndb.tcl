
proc ::tcltk::syndb_init {plugdir} {
	variable syndb
	
	set syndb(re,tclvar)  {(\$\{[\w\s]+\}|\$\w+|\$\{(::\w+)+\}|\$(::\w+)+)}
	
	source -encoding utf-8 [file join $plugdir db.tcl]
#	foreach f [glob -directory [file join $plugdir tcl] -types {f} *.tcl] {
#		source -encoding utf-8 $f
#	}
#	foreach f [glob -directory [file join $plugdir tk] -types {f} *.tcl] {
#		source -encoding utf-8 $f
#	}	

	set syndb(if,else,type) "TCLCMD"
	set syndb(if,elseif,type) "TCLCMD"
	set syndb(if,then,type) "TCLCMD"
	set syndb(if,on,type) "TCLCMD"
	set syndb(if,trap,type) "TCLCMD"
	set syndb(if,finally,type) "TCLCMD"

}


proc ::ez_chooseFont {} {
	variable Priv

	 set path "._ez_font_chooser"
	 
	set dlg [::twidget::dialog new ._ez_font_chooser \
		-cancel 1 \
		-title [::msgcat::mc "Choose  Font"] \
		-type "fontbox" \
		-default cancel \
		-position auto \
		-buttons [list ok [::msgcat::mc "Ok"] cancel [::msgcat::mc "Cancel"]] \
	]
	lassign [$dlg show] ret family size
	$dlg destroy	
	if {$ret != "ok"} {return}	

	return [format {[font create -family "%s" -size %s]} $family $size]
}

proc ::ez_chooseImage {} {
	set types {
		 {{PNG Files}        {.png}        }
	    {{BMP Files}        {.bmp}       }
	    {{GIF Files}        	{.gif}        		}
	    {{JPEG Files}        {.jpg}        }
		 {{PGM Files}        {.pgm}       }
		 {{PPM Files}        {.ppm}       }
	    {{All Files}        *             }
	}

	set f [tk_getOpenFile -filetypes $types]
	if {![file exists $f]} {return ""}
	return [format {[image create photo -file "%s"]} $f]
}


proc ::ez_chooseBitmap {} {
	set types {
	    {{All Files}        *             }
	}

	set f [tk_getOpenFile -filetypes $types]
	if {![file exists $f]} {return ""}
	return [format {[image create bitmap -file "%s"]} $f]
}

proc ::ez_chooseCursor {} {
	
	
	set dlg [::twidget::dialog new ._ez_font_chooser \
		-cancel 1 \
		-title [::msgcat::mc "Choose Cursor"] \
		-default cancel \
		-position auto \
		-buttons [list ok [::msgcat::mc "Ok"] cancel [::msgcat::mc "Cancel"]] \
	]
	
	oo::objdefine $dlg method body {fme} {
		set tree [ttk::treeview $fme.tree \
			-show tree \
			-selectmode browse \
			-padding 3 -height 3]
		set vs [ttk::scrollbar $fme.vs -command [list $tree yview] -orient vertical]
		set hs [ttk::scrollbar $fme.hs -command [list $tree xview] -orient horizontal]
		$tree configure -xscrollcommand [list $hs set] -yscrollcommand [list $vs set]
		::autoscroll::autoscroll $vs
		::autoscroll::autoscroll $hs
	
		set cursors [list X_cursor arrow based_arrow_down based_arrow_up boat bogosity \
			bottom_left_corner bottom_right_corner bottom_side bottom_tee box_spiral \
			center_ptr circle clock coffee_mug cross cross_reverse crosshair diamond_cross \
			dot dotbox double_arrow draft_large draft_small draped_box exchange fleur gobbler \
			gumby hand1 hand2 heart icon iron_cross left_ptr left_side left_tee leftbutton \
			ll_angle lr_angle man middlebutton mouse none pencil pirate plus question_arrow \
			right_ptr right_side right_tee rightbutton rtl_logo sailboat sb_down_arrow \
			sb_h_double_arrow sb_left_arrow sb_right_arrow sb_up_arrow sb_v_double_arrow \
			shuttle sizing spider spraycan star target tcross top_left_arrow top_left_corner \
			top_right_corner top_side top_tee trek ul_angle umbrella ur_angle watch xterm]
	
		foreach c  [list copyarrow aliasarrow contextualmenuarrow text cross-hair \
								closedhand openhand pointinghand resizeleft resizeright \
								resizeleftright resizeup resizedown resizeupdown notallowed \
								poof countinguphand countingdownhand countingupanddownhand \
								spinning] {
				lappend cursors "$c (mac)"
		}
	
		foreach c  [list arrow cross crosshair ibeam none plus watch xterm] {
				lappend cursors "$c (win)"
		}
	
		foreach item $cursors {
			$tree insert {} end  -id $item -text $item
		}
	
		bind $tree <<TreeviewSelect>> {
			set tree %W
			set sel [$tree selection]
			if {$sel != ""} {
				set sel [lindex [lindex $sel 0] 0]
				catch {$tree configure -cursor $sel}
				set ::_ez_choose_cursor $sel
			}
		}
	
		grid $tree $vs -padx 2 -pady 2 -sticky "news"
		grid $hs - -padx 2 -pady 2 -sticky "news"
	
		grid rowconfigure $fme 0 -weight 1
		grid columnconfigure $fme 0 -weight 1		
	
	}
	
	
	set ret [$dlg show]
	$dlg destroy	
	if {$ret != "ok"} {return}
	set ret $::_ez_choose_cursor
	

	unset ::_ez_choose_cursor

	return $ret
}
