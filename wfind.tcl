namespace eval ::wfind {
	variable Priv
	array set Priv [list \
		find,keyword "" \
		find,filter "*" \
		find,initdir [pwd] \
		find,matchcase 0 \
		find,regexp 0 \
		find,hidden 0 \
		find,start 0 \
		find,progress 0 \
		find,current "" \
	]
}

proc ::wfind::show {wpath} {
	variable Priv

	if {[winfo exists $wpath]} {
		raise $wpath
		return
	}	
	set win [toplevel $wpath]
	wm title $win [::msgcat::mc "Find in files"]
	wm minsize $win 500 500
	wm resizable $win 1 1
	set Priv(toplevel) $win
	set fme [ttk::frame $win.fme]
	pack $fme -expand 1 -fill both
	
	set Priv(find,initdir) [$::dApp::Obj(pmgr) active]
	if {$Priv(find,initdir) == ""} {set Priv(find,initdir) [pwd]}
		
	set lblKeyword [ttk::label $fme.lblKeyword -text [::msgcat::mc "Keyword:"] -anchor w -justify left]
	set txtKeyword [ttk::entry $fme.txtKeyword -textvariable ::wfind::Priv(find,keyword) -takefocus 1]
	set btnStart [ttk::button $fme.btnStart -text [::msgcat::mc "Start"] -command {::wfind::start} -default active]
	set btnStop [ttk::button $fme.btnStop -text [::msgcat::mc "Stop"] -command {set ::wfind::Priv(find,start) 0}]
	set lblFilter [ttk::label $fme.lblFilter -text [::msgcat::mc "Filter:"] -anchor w -justify left]
	set txtFilter [ttk::entry $fme.txtFilter -textvariable ::wfind::Priv(find,filter) -takefocus 1]
	set lblDir [ttk::label $fme.lblDir -text [::msgcat::mc "Directory:"] -anchor w -justify left]
	set cmbDir [ttk::combobox $fme.cmdDir \
		-values [$::dApp::Obj(pmgr) projects] \
		-textvariable ::wfind::Priv(find,initdir) \
		-takefocus 1]
	
		
	set btnDir [ttk::button $fme.btnDir -text [::msgcat::mc "Browse..."] -command [format {
		set ret [tk_chooseDirectory \
			-parent %s \
			-title [::msgcat::mc "Choose Directory"] \
			-mustexist 1]
		if {$ret == "" || $ret == "-1"} {return}
		set ::wfind::Priv(find,initdir) $ret
	} $win]]
	
	set fmeOptions [ttk::frame $fme.fmeOptions -borderwidth 2 -relief groove]
	set chkCase [ttk::checkbutton $fmeOptions.chkCase \
		-text [::msgcat::mc "Case Sensitive"] \
		-onvalue 1\
		 -offvalue 0 \
		 -variable ::wfind::Priv(find,matchcase)]
	set chkRegexp [ttk::checkbutton $fmeOptions.chkRegexp \
		-text [::msgcat::mc "Regular Expression"] \
		-onvalue 1 \
		-offvalue 0 \
		-variable ::wfind::Priv(find,regexp)]
	set chkHidden [ttk::checkbutton $fmeOptions.chkHidden \
		-text [::msgcat::mc "Search hidden files & folders"] \
		-onvalue 1 \
		-offvalue 0 \
		-variable ::wfind::Priv(find,hidden)]
	pack $chkCase $chkHidden $chkRegexp -side left -pady 1 -padx 3
	
	set fmeResult [ttk::frame $fme.fmeResult]
	set txtResult [text $fmeResult.txtResult -bd 2 -relief groove -state disabled \
		-spacing3 2 -spacing1 2 -bd 1 -relief flat -height 8 -width 8 -wrap none]

	set vs [ttk::scrollbar $fmeResult.vs -command [list $txtResult yview] -orient vertical]
	set hs [ttk::scrollbar $fmeResult.hs -command [list $txtResult xview] -orient horizontal]
	$txtResult configure -xscrollcommand [list $hs set] \
		-yscrollcommand [list $vs set] \
		-font $::dApp::Font(small) \
		-bd 2 \
		-relief groove
	
	::autoscroll::autoscroll $vs
	::autoscroll::autoscroll $hs
	
	grid $txtResult $vs -sticky "news"
	grid $hs - -sticky "we"
	grid rowconfigure $fmeResult 0 -weight 1
	grid columnconfigure $fmeResult 0 -weight 1		

	set lblCurr [ttk::label $fme.lblCurr -textvariable ::wfind::Priv(find,current) -width 40 -anchor w -justify left]
	set pbr [ttk::progressbar $fme.pbr -mode determinate -variable ::wfind::Priv(find,progress) -maximum 100]
	
	grid $lblKeyword $txtKeyword $btnStart -sticky "we" -padx 2 -pady 2
	grid $lblFilter $txtFilter $btnStop -sticky "we" -padx 2 -pady 2
	grid $lblDir $cmbDir $btnDir -sticky "we" -padx 2 -pady 2
	grid $fmeOptions - - -sticky "we" -padx 2 -pady 2
	grid $fmeResult - - -sticky "news" -padx 2
	grid $lblCurr - $pbr -sticky "we" -padx 2
	
	bind $txtKeyword <KeyRelease-Return> {::wfind::start}
	bind $txtKeyword <Visibility> {focus %W}
	
	grid rowconfigure $fme 4 -weight 1
	grid columnconfigure $fme 1 -weight 1
	set ::wfind::Priv(find,progress) 0
	set ::wfind::Priv(find,current) ""
	
	set Priv(win,txtResult) $txtResult
	set Priv(win,txtKeyword) $txtKeyword
	set Priv(win,txtFilter) $txtFilter
	set Priv(win,cmbDir) $cmbDir
	set Priv(win,btnDir) $btnDir
	set Priv(win,chkCase) $chkCase
	set Priv(win,chkRegexp) $chkRegexp
	set Priv(win,chkHidden) $chkHidden
	set Priv(win,pbr) $pbr
	
	$txtResult tag configure BG -font $::dApp::Font(small-bold)

	return $win
}

proc ::wfind::add_found {fpath msg line pos} {
	variable Priv
	incr Priv(find,resultCount)
	
	set idx [string first ":" $msg]
	set msg1 [string range $msg 0 $idx]
	set msg2 [string range $msg [incr idx] end]
	
	set txt $Priv(win,txtResult)
	$txt configure -state normal
	$txt insert end $msg1  BG
	$txt insert end $msg2 
	set idx [$txt index end]
	$txt tag add tag$Priv(find,resultCount) "$idx -1 line linestart" "$idx -1 line lineend"
	$txt insert end "\n"
	$txt tag bind tag$Priv(find,resultCount) <ButtonPress-1> [list ::wfind::goto $fpath $line $pos]
	$txt tag bind tag$Priv(find,resultCount) <Enter> "$txt configure -cursor hand2 ; $txt tag configure tag$Priv(find,resultCount) -underline 1 -foreground blue"
	$txt tag bind tag$Priv(find,resultCount) <Leave> "$txt configure -cursor arrow ; $txt tag configure tag$Priv(find,resultCount) -underline 0 -foreground black"
	$txt configure -state disabled
	update
}

proc ::wfind::goto {fpath line pos} {
	
	set nbe $::dApp::Obj(nbe)
	set pmgr $::dApp::Obj(pmgr)
	$nbe open $fpath
	set editor [$nbe editor]
	set wtext [$editor cget -wtext]

	set idx $line.$pos
	$wtext tag add FIND "$idx wordstart" "$idx wordend"
	$wtext see "$idx -5 lines"
	$wtext mark set insert $idx	

}

proc ::wfind::progress_incr {} {
	variable Priv
	incr Priv(find,progress)
	if {$Priv(find,start) == 0} {return}
	after 100 ::wfind::progress_incr
	update
}

proc ::wfind::scan {dpath} {
	variable Priv
	
	set filter [string trim $Priv(find,filter)] 
	if {$filter == ""} {set filter "*"}
	set flist [glob -directory $dpath -nocomplain -types {f r} -- {*}$filter]

	if {$Priv(find,hidden)} {
		set flist [concat $flist [glob -directory $dpath -nocomplain -types {f r hidden} -- {*}$filter]]
	}

	set flist [lsort -dictionary $flist]

	foreach f $flist {
		set Priv(find,current) $f ; update
		if {$Priv(find,start) == 0} {break}
		if {[file type $f] != "file" || ![file readable $f]} {continue}

		set fd [open $f r]
		set lineNum 0
		while {[set num [gets $fd data]] >= 0} {
			incr lineNum
			if {$Priv(find,regexp) == 1} {
				if {$Priv(find,matchcase)} {
					set idx [regexp -indices -inline -- $Priv(find,keyword) $data]
				} else {
					set idx [regexp -nocase -indices -inline -- $Priv(find,keyword) $data]
				}
				if {$idx != ""} {
					set idx  [lindex $idx 0 0]
					set dlen [string length $::wfind::Priv(find,initdir)]
					set txt [string trimleft [string range $f $dlen end] "/"]
					append txt " (L$lineNum): " [string range $data $idx  [expr $idx +20]]					"... "
					::wfind::add_found $f $txt $lineNum $idx
					break
				}			
				continue
			}
			
			if {$Priv(find,matchcase)} {
				set idx [string first $Priv(find,keyword) $data]
			} else {
				set idx [string first [string tolower $Priv(find,keyword)] [string tolower $data]]					
			}
			if {$idx >= 0} {
				set dlen [string length $::wfind::Priv(find,initdir)]
				set txt [string trimleft [string range $f $dlen end] "/"]
				append txt " (L$lineNum): " [string range $data $idx [expr $idx +20]]					"... "
				::wfind::add_found $f $txt $lineNum $idx
				break
			}				
		}
		close $fd
	}
	
	set dlist [glob -directory $dpath -nocomplain -types {d r} *]

	if {$Priv(find,hidden)} {
		set dlist [concat $dlist [glob -directory $dpath -nocomplain -types {d r hidden} *]]
	}

	set dlist [lsort -dictionary $dlist]

	foreach d $dlist {
		if {[file tail $d] == "." || [file tail $d] == ".."} {continue}
		set Priv(find,current) $d ;		update
		if {$Priv(find,start) == 0} {break}
		::wfind::scan $d
	}
}

proc ::wfind::start {} {
	variable Priv

	if {![file exists $Priv(find,initdir)] || ![file isdirectory $Priv(find,initdir)] } {
		tk_messageBox -type ok -title [::msgcat::mc "Error"] \
			-message [::msgcat::mc "Search directory not valid!"]
		return
	}
	if {[string trim $Priv(find,keyword)] == ""} {return	}
	
	$Priv(win,txtKeyword) configure -state disabled
	$Priv(win,txtFilter) configure -state disabled
	$Priv(win,cmbDir) configure -state disabled
	$Priv(win,btnDir) configure -state disabled
	$Priv(win,chkCase) configure -state disabled
	$Priv(win,chkRegexp) configure -state disabled
	$Priv(win,chkHidden) configure -state disabled
	
	set Priv(find,start) 1
	
	$Priv(win,pbr) configure -mode indeterminate
	set Priv(find,resultCount) 0
	set Priv(find,progress) 0
	set Priv(find,current) ""
	$Priv(win,txtResult) configure -state normal
	$Priv(win,txtResult) delete 1.0 end
	$Priv(win,txtResult) configure -state disabled
	set tid [after 100 ::wfind::progress_incr]
	::wfind::scan $Priv(find,initdir)
	after cancel $tid
	
	$Priv(win,pbr) configure -mode determinate
	set Priv(find,start) 0
	set Priv(find,progress) 0
	set Priv(find,current) "Finish $Priv(find,resultCount) items found."
	
	$Priv(win,txtKeyword) configure -state normal
	$Priv(win,txtFilter) configure -state normal
	$Priv(win,cmbDir) configure -state normal
	$Priv(win,btnDir) configure -state normal
	$Priv(win,chkCase) configure -state normal
	$Priv(win,chkRegexp) configure -state normal
	$Priv(win,chkHidden) configure -state normal
}
