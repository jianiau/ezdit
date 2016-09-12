namespace eval ::wnote {
	variable Priv
	array set Priv [list \
		hideCompleted 0 \
	]
}

proc ::wnote::binding_setup {} {
		$::dApp::Obj(pmgr) hook install <After-ProjectClose> [list apply {{args} {::wnote::refresh ; return 0}}]
		$::dApp::Obj(pmgr) hook install <ProjectActive> [list apply {{args} {::wnote::refresh ;  return 0}}]
		::wnote::refresh
}

proc ::wnote::ch_state {item} {
	variable Priv
	set ibox $::dApp::Obj(ibox)
	set tree $Priv(win,tree)	
	
	set rcDir [$::dApp::Obj(pmgr) active]
	if {$rcDir == ""} {return}
	
	set rcfile [file join $rcDir ".ezdit" "note.rc" ]
	if {![file exists $rcfile]} {return}
	
	set rc	[::twidget::rc new $rcfile]
	
	set state [$tree item state forcolumn $item 0]
	set id [$tree item element cget $item colDate txtTime -data]
	set title [$tree item element cget $item colTitle txtTitle -text]
	
	if {![$rc exists $id]} {$rc destroy ; return}

	if {$state == "NOT_STARTED"} {
		$tree item state forcolumn $item 0 [list !NOT_STARTED IN_PROGRESS !FINISHED]
		set nextState "IN_PROGRESS"
	} elseif {$state eq "IN_PROGRESS"} {
		$tree item state forcolumn $item 0 [list !NOT_STARTED !IN_PROGRESS FINISHED]
		set nextState "FINISHED"
	} else {
		$tree item state forcolumn $item 0 [list NOT_STARTED !IN_PROGRESS !FINISHED]
		set nextState "NOT_STARTED"
	}
	$rc delete $id
	$rc append $id $nextState $title
	$rc destroy
	return $nextState
}

proc ::wnote::compare_state {T C item1 item2} {
	set s1 [$T item state forcolumn $item1 $C]
	set s2 [$T item state forcolumn $item2 $C]
	if {$s1 eq $s2} {return 0}
	if {$s1 eq "FINISHED"} {return 1}
	if {$s2 eq "FINISHED"} {return -1}
	if {$s1 eq "IN_PROGRESS"} {return 1}
	return -1
}

proc ::wnote::init {path} {
	variable Priv
	
	set ibox $::dApp::Obj(ibox)
	set fmeMain [ttk::frame $path -borderwidth 0 -relief flat -padding 1]

	set ::wnote::Priv(vars,txtKeyword) ""
	set Priv(vars,cmbState) [::msgcat::mc "All"]
	set fmeSearch [ttk::frame $path.fmeSearch]
	set lblSearch [ttk::label $fmeSearch.lblSearch -text [::msgcat::mc "Filter:"] -anchor w -justify left ]
	set cmbState [ttk::combobox $fmeSearch.cmbState \
		-textvariable ::wnote::Priv(vars,cmbState) \
		-width 10 \
		-state readonly \
		-values [list [::msgcat::mc "All"] [::msgcat::mc "Not Started"] [::msgcat::mc "In Progress"] [::msgcat::mc "Finished"] ]]
	set txtKeyword [ttk::entry $fmeSearch.txtKeyword \
		-textvariable ::wnote::Priv(vars,txtKeyword) \
		-width 20 ]
	set btnSearch [ttk::button $fmeSearch.btnSearch  \
		-style Toolbutton \
		-image [$ibox get note_filter] \
		-command ::wnote::item_search]
	set btnReset [ttk::button $fmeSearch.btnReset  \
		-style Toolbutton \
		-image [$ibox get note_reset] \
		-command ::wnote::refresh]
	bind $txtKeyword <Key-Return> {::wnote::item_search}
	
#	set btnExport [::ttk::button $fmeSearch.btnExport \
#			-style Toolbutton \
#			-image [$ibox get note_export] \
#			-command {::wnote::task_export}]
	set btnAdd [::ttk::button $fmeSearch.btnAdd \
			-style Toolbutton \
			-image [$ibox get note_add] \
			-command {::wnote::task_add}]

	::tooltip::tooltip $btnSearch [::msgcat::mc "Apply"]
	::tooltip::tooltip $btnReset [::msgcat::mc "Reset"]
	::tooltip::tooltip $btnAdd [::msgcat::mc "Add"]

#	pack $lblAdd -side left -padx 2 -pady 1
#	pack $txtAdd -side left  -padx 2 -pady 1

	
	#pack $lblSep -side right -padx 2 -pady 1 -fill y	
	pack $lblSearch $cmbState $txtKeyword $btnSearch $btnReset -padx 2 -pady 1 -side left
	#pack $btnExport -side right -padx 2 -pady 1			
	pack $btnAdd -side right -padx 2 -pady 1		
		
	set fmeTree [ttk::frame $path.fmeTree]
	set tree [treectrl $fmeTree.tree \
		-height 1 \
		-showroot no \
		-showline no \
		-selectmod browse \
		-showrootbutton no \
		-showbuttons no \
		-showheader yes \
		-scrollmargin 16 \
		-highlightthickness 0 \
		-relief groove \
		-bg white \
		-bd 2 \
		-font $::dApp::Font(middle)  \
		-usetheme 1 \
		-xscrolldelay "500 50" \
		-yscrolldelay "500 50"]

	set vs [ttk::scrollbar $fmeTree.vs -command [list $tree yview] -orient vertical]
	set hs [ttk::scrollbar $fmeTree.hs -command [list $tree xview] -orient horizontal]
	$tree configure -xscrollcommand [list $hs set] -yscrollcommand [list $vs set]
	
	::autoscroll::autoscroll $vs
	::autoscroll::autoscroll $hs	
	
	grid $tree $vs -sticky "news" 
	grid $hs - -sticky "news" 
	grid rowconfigure $fmeTree 0 -weight 1
	grid columnconfigure $fmeTree 0 -weight 1
		
	$tree state define MOUSEOVER 
	$tree state define NOT_STARTED
	$tree state define IN_PROGRESS
	$tree state define FINISHED
		
	#Not Started In Progress Finished
		
	$tree column create -tag colState \
		-itembackground {"#e0e8f0" {}} \
		-width 50 \
		-expand no \
		-text [::msgcat::mc "State"]
	$tree column create -tag colDate  \
		-itembackground {"#e0e8f0" {}} -expand no -text [::msgcat::mc "Time"]
	$tree column create -tag colTitle \
		-itembackground {"#e0e8f0" {}} -expand yes -text [::msgcat::mc "Description"] 

	$tree element create rectSel rect \
		-open nw -outline gray -outlinewidth 1 -showfocus 0

	$tree element create rect rect -open news -showfocus yes -fill [list "#a5c4c4" {selected}] 
	
	$tree element create imgCheck image \
		-image [list [$ibox get note_not_started] NOT_STARTED \
					 [$ibox get note_in_progress] IN_PROGRESS\
					 [$ibox get note_finished] FINISHED]
	$tree style create styCheck 
	$tree style elements styCheck [list rect imgCheck]
	$tree style layout styCheck imgCheck -padx {0 4} -expand news
	$tree style layout styCheck rect -union {imgCheck} -iexpand news -ipadx 2
	
	$tree element create txtTime text -datatype time -format "%d/%m/%y %I:%M:%p" -lines 1 
	$tree style create styTime 
	$tree style elements styTime [list rect txtTime]
	$tree style layout styTime txtTime -padx {0 4} -squeeze x -expand ns -pady {3 3}

	$tree style layout styTime rect -union {txtTime} -iexpand news -ipadx 2
	
	$tree element create txtTitle text -lines 1 
	$tree style create styTitle 
	$tree style elements styTitle [list rect txtTitle]
	$tree style layout styTitle txtTitle -padx {0 4} -squeeze x -expand ns -pady {3 3}
	$tree style layout styTitle rect -union {txtTitle} -iexpand news -ipadx 2
	
	$tree notify install <Edit-begin>
	$tree notify install <Edit-accept>
	$tree notify install <Edit-end>
	$tree notify install <Header-invoke>
	
	TreeCtrl::SetEditable $tree {{colTitle styTitle txtTitle}}
	TreeCtrl::SetSensitive $tree {{colState styCheck rect imgCheck} {colDate styTime rect txtTime} {colTitle styTitle rect txtTitle}}
	TreeCtrl::SetDragImage $tree {}

	bindtags $tree [list $tree TreeCtrlFileList TreeCtrl]
	set ::TreeCtrl::Priv(DirCnt,$tree) 1
	
	$tree notify bind $tree <Edit-begin> {
		%T item element configure %I %C %E -draw no + %E -draw no
		%T see %I
	}
	
	$tree notify bind $tree <Edit-accept> {
		set t1 [%T item element cget %I %C %E -text]
		set t2 %t
		if {$t1 != $t2} {
			%T item element configure %I %C %E -text $t2
			set id [%T item element cget %I colDate txtTime -data]
			::wnote::task_save $id $t2
		}
	}
	
	$tree notify bind $tree <Edit-end> {
		if {[%T item id %I] != ""} {
			%T item element configure %I %C %E -draw yes + %E -draw yes
		}
		catch {
			set t1 [%T item element cget %I %C %E -text]
			if {[string trim $t1] == ""} {after idle [list ::wnote::task_del %I]}
		}
	}
	
	bind $tree <Button-1> {
		set id [%W identify %x %y]
		
		if {[llength $id] != 6} {
			%W selection clear
		} else {
			lassign $id what itemId where columnId type name
			if { $what == "item" && $where == "column"} {
				%W selection modify $itemId	 all
				set tag [%W column cget $columnId -tag]
				if {$tag eq "colState"} {
					set state [::wnote::ch_state $itemId]
					if {$::wnote::Priv(hideCompleted) && $state == "FINISHED"} {
						after idle [list %W item delete $itemId]
					}
				}
			}
		}
	}
	
	bind $tree <<MenuPopup>> {
		set id [%W identify %x %y]
		if {$id eq ""} {
			%W selection clear
			::wnote::tree_menu_popup %X %Y	
		} else {
			if {[llength $id] == 6} {
				foreach {what itemId where columnId type name} $id {}
				if {$what eq "item" && $where eq "column"} {
					if {[%W selection count] <= 1} {%W selection modify $itemId all}
					set state [%W item state forcolumn $itemId 0]
					::wnote::item_menu_popup %X %Y $itemId
					
				}
			}
		}
	}

	bind $tree <F2> {
		set item [lindex [%W selection get] 0]
		if {$item ne ""} {
			%W selection clear
			%W selection add $item
			::TreeCtrl::FileListEdit %W $item colTitle txtTitle
		}
	}

	bind $tree <Delete> [list ::wnote::task_del_multiple ]
		
	bind $tree <Insert> {
		%W selection clear
		::wnote::task_add
	}
	
	$tree notify bind $tree <Header-invoke> {
		if {[%T column cget %C -arrow] eq "down"} {
			set order -increasing
			set arrow up
		} else {
			set order -decreasing
			set arrow down
		}
		foreach col [%T column list] {
			%T column configure $col -arrow none
		}
		%T column configure %C -arrow $arrow
		switch [%T column cget %C -tag] {
			bounce -
			colState {
				%T item sort root $order -column %C -command [list ::wnote::compare_state %T %C] }
			colDate {
				%T item sort root $order -column %C -dictionary
			}
			colTitle {
				%T item sort root $order -column %C -dictionary
			}
		}
	}
	
	$tree item sort root -decreasing -column colDate -dictionary
	
	set Priv(win,tree) $tree
	
	pack $fmeSearch -fill x -padx 1 -pady 3
	pack $fmeTree -fill both -expand 1 -padx 1 -pady 1
	


	return $path
}

proc ::wnote::item_add {id title state} {
	variable Priv
	set tree $Priv(win,tree)
	
	set item [$tree item create -button no]
	set dtime [clock format $id -format "%Y-%m-%d %H:%M:%S"]
	$tree item lastchild 0 $item
	$tree item style set $item 0 styCheck 1 styTime 2 styTitle
	$tree item text $item 1 $dtime 2 $title
	$tree item element configure $item 1 txtTime -data $id
	$tree item state forcolumn $item 0 $state

	return $item
}

proc ::wnote::item_del {item} {
	variable Priv
	set tree $Priv(win,tree)
	
	$tree item delete $item
}

proc ::wnote::item_search {} {
	variable Priv	
	
	set ibox $::dApp::Obj(ibox)
	set tree $Priv(win,tree)	
	
	set rcDir [$::dApp::Obj(pmgr) active]
	if {$rcDir == ""} {return}
	
	set rcDir [file join $rcDir ".ezdit"]
	if {![file exists $rcDir]} {return}
	set rcfile [file join $rcDir "note.rc" ]
	
	set rc	[::twidget::rc new $rcfile]
	
	if {$Priv(vars,cmbState) == [::msgcat::mc "Not Started"]} {
		set pat "NOT_STARTED"
	} elseif {$Priv(vars,cmbState) == [::msgcat::mc "In Progress"]} {
		set pat "IN_PROGRESS"
	} elseif {$Priv(vars,cmbState) == [::msgcat::mc "Finished"]} {
		set pat "FINISHED"
	} else {
		set pat "ALL"
	}
	
	::wnote::item_del all
	
	foreach {key} [$rc keys] {
		lassign [$rc get $key] state title
		if {$pat == "ALL" || $pat == $state } {
			if {[string match -nocase "*$Priv(vars,txtKeyword)*" $title]} {
				::wnote::item_add $key $title $state
			}
		}
		
	}
	$rc destroy	
	::wnote::item_sort	
	return	
}

proc ::wnote::item_sort {} {
	variable Priv
	set tree $Priv(win,tree)
	
	set column ""
	foreach col [$tree column list] {
		set arrow [$tree column cget $col -arrow]
		if {$arrow ne "none"} {
			set column $col
			break
		}
	}
	if {$arrow eq "none"} {return ""}

	if {$arrow eq "down"} {
		set order -decreasing
	} else {
		set order -increasing
	}
	
#	foreach col [$tree column list] {
#		$tree column configure $col -arrow "none"
#	}
	$tree column configure $column -arrow $arrow
	switch [$tree column cget $column -tag] {
		bounce -
		colState {
			$tree item sort root $order -column $column -command [list ::wnote::compare_state $tree $column] }
		colDate {
			$tree item sort root $order -column $column -dictionary
		}
		colTitle {
			$tree item sort root $order -column $column -dictionary
		}
	}
}

proc ::wnote::item_menu_popup {X Y item} {
	variable Priv

	set ibox $::dApp::Obj(ibox)
	set tree $Priv(win,tree)
	
	if {[winfo exists $tree.taskMenu]} {destroy $tree.taskMenu}

	set m [menu $tree.taskMenu -tearoff 0]
	$m add command -compound left \
		-label [::msgcat::mc "Add Item"] \
		-image [$ibox get empty] \
		-accelerator "Insert" \
		-command {::wnote::task_add}
	$m add separator	
	$m add command -compound left \
		-label [::msgcat::mc "Edit"] \
		-image [$ibox get empty] \
		-accelerator "F2" \
		-command [list ::TreeCtrl::FileListEdit $tree $item colTitle txtTitle]
	$m add command -compound left \
		-label [::msgcat::mc "Change State"] \
		-image [$ibox get empty] \
		-command [list ::wnote::ch_state $item]
	$m add command -compound left -label [::msgcat::mc "Delete"] \
		-image [$ibox get empty] \
		-accelerator "Del"\
		-command [list ::wnote::task_del_multiple]
	$m add separator
	$m add command -compound left \
		-image [$ibox get empty] \
		-label [::msgcat::mc "Delete Completed Items"] \
		-command {::wnote::task_del_completed}
	$m add checkbutton \
		-label [::msgcat::mc "Hide Completed Items"] \
		-variable ::wnote::Priv(hideCompleted) \
		-onvalue 1 \
		-offvalue 0 \
		-command {
			::wnote::refresh
		}		
	$m add separator
	$m add command -compound left \
		-label [::msgcat::mc "Refresh"] \
		-image [$ibox get empty] \
		-command {::wnote::refresh} 
	
	tk_popup $m $X $Y
}

proc ::wnote::tree_menu_popup {X Y} {
	variable Priv

	set ibox $::dApp::Obj(ibox)
	set tree $Priv(win,tree)
	
	if {[$::dApp::Obj(pmgr) active] == ""} {	return}

	if {[winfo exists $tree.taskMenu]} {destroy $tree.taskMenu}

	set m [menu $tree.taskMenu -tearoff 0]
	$m add command -compound left \
		-image [$ibox get empty] \
		-label [::msgcat::mc "Add Item"] \
		-accelerator "Insert" \
		-command {::wnote::task_add}
	$m add separator
	$m add checkbutton -label [::msgcat::mc "Hide Completed Items"] \
		-variable ::wnote::Priv(hideCompleted) \
		-onvalue 1 \
		-offvalue 0 \
		-command {
			::wnote::refresh
		}
	$m add command -compound left \
		-image [$ibox get empty] \
		-label [::msgcat::mc "Delete Completed Items"] \
		-command {::wnote::task_del_completed}
	$m add separator
	$m add command -compound left -label [::msgcat::mc "Refresh"] \
		-image [$ibox get empty] \
		-command {::wnote::refresh} 

	tk_popup $m $X $Y
}

proc ::wnote::refresh {} {
	variable Priv	
	set ibox $::dApp::Obj(ibox)
	set tree $Priv(win,tree)	
	
	$tree item delete all
	
	set rcDir [$::dApp::Obj(pmgr) active]
	if {$rcDir == ""} {return}
	
	set rcfile [file join $rcDir ".ezdit" "note.rc" ]

	if {![file exists $rcfile]} {return}

	set rc	[::twidget::rc new $rcfile]

	foreach {key} [$rc keys] {
		lassign [$rc get $key] state title
		if {$Priv(hideCompleted) == 1 && $state == "FINISHED"} {continue}
		
		::wnote::item_add $key $title $state
	}
	$rc destroy
	::wnote::item_sort
	return
}

proc ::wnote::task_add {} {
	variable Priv
	
	set tree $Priv(win,tree)

	set rcDir [$::dApp::Obj(pmgr) active]
	if {$rcDir == ""} {return}
	
	set rcDir [file join $rcDir ".ezdit"]
	if {![file exists $rcDir]} {file mkdir $rcDir}

	set id [clock scan now]

	set item [::wnote::item_add $id "" "NOT_STARTED"]
	$tree selection clear
	$tree selection add $item
	$tree see $item
	update
	::TreeCtrl::FileListEdit $tree $item colTitle txtTitle
	return	
}

proc ::wnote::task_del_completed {} {
	
	variable Priv
	set tree $Priv(win,tree)
	
	set ret [tk_messageBox -title [::msgcat::mc "Delete"] -type yesno \
			-icon info -message [::msgcat::mc "Are you sure you want to delete those items?"]]
	if {$ret == "no"} {return}

	foreach {item}  [$tree item children root] {
		set state [$tree item state forcolumn $item 0]
		if {$state == "FINISHED"} {::wnote::task_del $item 0}
	}
}

proc ::wnote::task_del {item {confirm 1}} {
	variable Priv
	
	set tree $Priv(win,tree)

	set txt [$tree item element cget $item colTitle txtTitle -text]
	set id [$tree item element cget $item colDate txtTime -data]	

	if {$confirm} {
		if {[string trim $txt] == ""} {
			set ret "yes"
		} else {
			set ret [tk_messageBox \
				-title [::msgcat::mc "Delete"] \
				-type yesno \
				-icon info \
				-message [::msgcat::mc "Are you sure you want to delete this item ?"]]
		}
		if {$ret == "no"} {return}	
	}
	::wnote::item_del $item

	set rcDir [$::dApp::Obj(pmgr) active]
	if {$rcDir == ""} {return}
	
	set rcDir [file join $rcDir ".ezdit"]
	if {![file exists $rcDir]} {return}
	set rcfile [file join $rcDir "note.rc" ]
	
	set rc	[::twidget::rc new $rcfile]
	$rc delete $id
	$rc destroy

	return
}

proc ::wnote::task_del_multiple {} {
	variable Priv
	
	set tree $Priv(win,tree)	
	set items [$tree selection get]
	if {$items == ""} {return}
	
	set cut [llength $items]
	set ans [tk_messageBox -type yesno -title [::msgcat::mc "Delete"] \
		-message [::msgcat::mc "Are you sure you want to delete %s items?" $cut]]
	if {$ans != "yes"} {return}
	foreach item $items {
		$tree item element configure $item colTitle txtTitle -text ""
		::wnote::task_del $item 0
	}
}

proc ::wnote::task_save {id txt} {
	
	set rcDir [$::dApp::Obj(pmgr) active]
	if {$rcDir == ""} {return}
	
	set rcDir [file join $rcDir ".ezdit"]
	if {![file exists $rcDir]} {file mkdir $rcDir}
	set rcfile [file join $rcDir "note.rc" ]
	
	set rc	[::twidget::rc new $rcfile]
	$rc delete $id
	$rc append $id NOT_STARTED $txt
	
	$rc destroy
}

