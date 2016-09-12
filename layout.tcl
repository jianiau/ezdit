oo::class create ::dApp::layout {

	constructor {wpath} {
		my variable Priv
		
		array set Priv [list \
			L,show 1 \
			R,show 1 \
			B,show 1 \
			sn 0 \
		]

		my Ui_Init $wpath
	}
	
	destructor {
		my variable Priv
		
		array unset Priv
	}
	
	method add {pane win} {
		#pane :  L R C B
		my variable Priv
		
		set parent $Priv(win,fme$pane)
		set fme [::ttk::frame $parent.fme$Priv(sn)]
		pack $win -in $fme -expand 1 -fill both
		$parent add $fme -weight 1
		
		incr Priv(sn)
	}
	
	method make_frame_menu {m} {
	}
	
	method make_pane_menu {m} {
		my variable Priv
		
		foreach pane [lsort [my pane list]] {
			$m add checkbutton -compound left \
				-onvalue 1 \
				-offvalue 0 \
				-variable [self namespace]::Priv(var,pane$pane) \
				-label $pane \
				-command [list [self object] pane toggle $pane]
			set Priv(var,pane$pane) [my pane state $pane]
		}
		
	}
	
	method pane {cmd args} {
		return [my pane_$cmd {*}$args]
	}
	
	method pane_add {pane title win {fixed 0} {icon ""}} {
	# pane : L C R B
		my variable Priv
		set pane [string index $pane 0]
		set ibox $::dApp::Obj(ibox)
		set parent $Priv(win,fme$pane)
		if {$icon == ""} {set icon [$ibox get pane]}

		my Pane_Create $parent $title $icon $win $fixed
	}
	
	method pane_find {title} {
		my variable Priv
		
		foreach pane [list L C R B Hidden] {
			set parent $Priv(win,fme$pane)
			foreach fme [winfo children $parent] {
				if {[string first $parent.pane $fme] == 0} {
					if {[$fme.title cget -text] == $title} {return $fme}
				}
			}
		}
		return ""
	}	
	
	method pane_hide {title} {
		my variable Priv
		foreach pane [list L C R B] {
			set parent $Priv(win,fme$pane)
			foreach fme [winfo children $parent] {
				if {[string first $parent.pane $fme] != 0} {continue}
				lassign [my Pane_Info $fme] title2 icon win fixed
				if {$title2 != $title} {continue}
				
				set dest $Priv(win,fmeHidden)
				set data [winfo parent $fme]
				my Pane_Delete  $fme
				my Pane_Create $dest $title $icon $win $fixed $data
				return
			}
		}
	}
	method pane_list {} {
		my variable Priv
		
		set ret [list]
		foreach pane [list L C R B Hidden] {
			set parent $Priv(win,fme$pane)
			foreach fme [winfo children $parent] {
				if {[string first $parent.pane $fme] != 0} {continue}
				lassign [my Pane_Info $fme] title icon win fixed
				if {$fixed == 1} {continue}
				lappend ret [$fme.title cget -text]
				
			}
		}
		return $ret
	}
	
	method pane_show {title} {
		my variable Priv

		set parent $Priv(win,fmeHidden)
		foreach fme [winfo children $parent] {
			if {$title != [$fme.title cget -text]} {continue}
			
			set dest [$fme.data cget -text]
			lassign [my Pane_Info $fme] title icon win fixed
			my Pane_Delete $fme
			my Pane_Create $dest $title $icon $win $fixed
			return
		}
	}
	
	method pane_state {title} {
		my variable Priv
		
		set parent $Priv(win,fmeHidden)
		foreach fme [winfo children $parent] {
			if {$title == [$fme.title cget -text]} {
				return 0
			}
		}
		return 1
	}
	
	method pane_toggle {title} {
		if {[my pane_state $title]} {
			my pane_hide $title
		} else {
			my pane_show $title
		}
	}
	
	method cget {opt} {
		my variable Priv
		
		set opt [string trimleft $opt "-"]
		return $Priv(win,$opt)
	}
	
	method frame {cmd args} {
		my variable Priv
		
		lassign $args pane
		
		if {$pane == "L"} {set frame "fmeH" ; set idx 0}
		if {$pane == "R"} {set frame "fmeH"; set idx 1}
		if {$pane == "B"} {set frame "fmeV" ; set idx 0}
		return [my frame_$cmd $pane $frame $idx]
	} 
	
	method frame_hide {pane fme idx} {
		my variable Priv
		
		set pos 0
		if {$pane == "R"} {set pos [winfo width $Priv(win,frame)]}
		if {$pane == "B"} {set pos [winfo height $Priv(win,frame)]}

		set Priv($fme,$idx,pos) [$Priv(win,$fme) sashpos $idx]
		$Priv(win,$fme) sashpos $idx $pos
		set Priv($pane,show) 0
		
	} 
	
	method frame_show {pane fme idx} {
		my variable Priv
		
		$Priv(win,$fme) sashpos $idx $Priv($fme,$idx,pos)
		set Priv($pane,show) 1
	} 
	
	method frame_state {pane fme idx} {
		my variable Priv
		
		return $Priv($pane,show)
	} 
	
	method frame_toggle {pane fme idx} {
		my variable Priv

		if {$Priv($pane,show)} {
			my frame hide $pane $fme $idx
		} else {
			my frame show $pane $fme $idx
		}
		return $Priv($pane,show)
	} 				
	
	
	method rc_load {} {
		my variable Priv
		
		set rc $::dApp::Obj(rc)
		
		update
		if {[set val [$rc get "Layout.Ezdit.Geometry"]] != ""} {wm geometry . $val}
		
		foreach pane [list L C R B Hidden] {
			set parent $Priv(win,fme$pane)
			foreach item [$rc get "Layout.fme$pane.Panes"] {
				set fme [my pane_find $item]
				if {$fme == ""} {continue}
				set target "LEFT"
				if {$pane == "R"} {set target "RIGHT"}
				if {$pane == "B"} {set target "BOTTOM"}
				if {$pane == "Hidden"} {set target "HIDDEN"}
				if {$pane == "C"} {set target "CENTER"}
				my Pane_Move $fme.btn  $target
			}
		}
		update

		foreach {id} [list V H L C R B] {
			set p $Priv(win,fme$id)
			set idx 0
			while {![catch {set pos [$p sashpos $idx]}]} {
				if {[set val [$rc get "Layout.fme$id.Sashpos.$idx"]] != ""} {
					$p sashpos $idx $val
				}
				incr idx
			}
			update
		}
	}		
	
	method rc_save {} {
		my variable Priv

		set rc $::dApp::Obj(rc)
		$rc set "Layout.Ezdit.Geometry" [wm geometry .]
		foreach {id} [list V H B L C R] {
			set p $Priv(win,fme$id)
			set idx 0
			while {![catch {set pos [$p sashpos $idx]}]} {
				$rc set "Layout.fme$id.Sashpos.$idx" $pos
				incr idx
			}
		}
		
		foreach pane [list L C R B Hidden] {
			set parent $Priv(win,fme$pane)
			$rc delete "Layout.fme$pane.Panes"
			array set map [list]
			set cut 0
			foreach fme [winfo children $parent] {
				if {[string first $parent.pane $fme] != 0} {continue}
				$parent pane $fme -weight $cut
				set map($cut) $fme.title
				incr cut
			}
			
			for {set i 0} {$i < $cut} {incr i} {
				set w [$parent pane $i -weight]
				$rc append "Layout.fme$pane.Panes" [$map($w) cget -text]
			}
			array unset map
		}		
		
	}
	
	method Pane_Create {parent title icon win {fixed 0} {data ""}} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set fme [::ttk::frame $parent.pane$Priv(sn)]
		set lbl [::ttk::label $fme.title -text $title -image $icon -compound left]
		set btn [::ttk::button $fme.btn \
			-image [$ibox get pane_button] \
			-style Toolbutton \
			-command [list [self object] Pane_Menu $fme.btn]]
		set body [::ttk::frame $fme.body]

		::ttk::label $fme.data -text $data
		::ttk::label $fme.fixed -text $fixed			

		if {$fixed == 0} {
			grid $lbl $btn -sticky "we" -padx 3 -pady 2
			grid $body - -sticky "news" -padx 2 -pady 1
			
			grid rowconfigure $fme 1 -weight 1
			grid columnconfigure $fme 0 -weight 1
		} else {
			pack $body -expand 1 -fill both
		}

		pack $win -in $body -expand 1 -fill both
		
#		if {$parent == $Priv(win,fmeHidden)} {
#			pack $fme -in $parent
#		} else {
			$parent add $fme -weight 1
#		}
		incr Priv(sn)
	
	}
	
	method Pane_Delete {fme} {
		my variable Priv
		
		set win [lindex [pack slaves $fme.body] 0]
		pack forget $win
		
		set parent [winfo parent $fme]
		
#		if {$parent == $Priv(win,fmeHidden)} {
#			pack forget $fme
#		} else {
			$parent forget $fme
#		}
		destroy $fme
		
		if {[winfo children $parent] == ""} {
			set pane [string index $parent end]
			if {$pane == "L"} {my frame_hide $pane fmeH 0}
			if {$pane == "R"} {my frame_hide $pane fmeH 1}
			if {$pane == "B"} {my frame_hide $pane fmeV 0}
		}
		return $win
	}
	
	method Pane_Info {fme} {
		my variable Priv
		
		set title [$fme.title cget -text]
		set icon [$fme.title cget -image]
		set win [lindex [pack slaves $fme.body] 0]
		set fixed [$fme.fixed cget -text]
		
		return [list $title $icon $win $fixed]
	}	
	
	method Pane_Menu {btn} {
		my variable Priv
	
		set ibox $::dApp::Obj(ibox)
		lassign [winfo pointerxy $btn] X Y
		set X [winfo rootx $btn]
		set Y [expr [winfo rooty $btn] + [winfo height $btn]]
		set m $btn.menu
		if {[winfo exists $m]} {destroy $m}
		menu $m -tearoff 0
		
		set pane [string index [winfo parent [winfo parent $btn]] end]
		set fme $Priv(win,fme$pane)
	
		$m add command -compound left \
			-image [$ibox get move_hide] \
			-label [::msgcat::mc "Hide"] \
			-command [list [self object] Pane_Move $btn "HIDDEN"]	
		
		$m add separator
		
		if {$pane == "L"} {
			$m add command -compound left \
				-image [$ibox get move_up] \
				-label [::msgcat::mc "Move Up"] \
				-command [list [self object] Pane_Move $btn "UP"]
			$m add command -compound left \
				-image [$ibox get move_down] \
				-label [::msgcat::mc "Move Down"] \
				-command [list [self object] Pane_Move $btn "DOWN"]			
			$m add command -compound left \
				-image [$ibox get move_right] \
				-label [::msgcat::mc "Move to Right Frame"] \
				-command [list [self object] Pane_Move $btn "RIGHT"]
			$m add command -compound left \
				-image [$ibox get move_bottom] \
				-label [::msgcat::mc "Move to Bottom Frame"] \
				-command [list [self object] Pane_Move $btn "BOTTOM"]					
	   	}  
	   	if {$pane == "R"} {
			$m add command -compound left \
				-image [$ibox get move_up] \
				-label [::msgcat::mc "Move Up"] \
				-command [list [self object] Pane_Move $btn "UP"]
			$m add command -compound left \
				-image [$ibox get move_down] \
				-label [::msgcat::mc "Move Down"] \
				-command [list [self object] Pane_Move $btn "DOWN"]		   	
			$m add command -compound left \
				-image [$ibox get move_left] \
				-label [::msgcat::mc "Move to Left Frame"] \
				-command [list [self object] Pane_Move $btn "LEFT"]
			$m add command -compound left \
				-image [$ibox get move_bottom] \
				-label [::msgcat::mc "Move to Bottom Frame"] \
				-command [list [self object] Pane_Move $btn "BOTTOM"]									
	      }

	   	if {$pane == "B"} {
			$m add command -compound left \
				-image [$ibox get move_forward] \
				-label [::msgcat::mc "Move Forward"] \
				-command [list [self object] Pane_Move $btn "UP"]
			$m add command -compound left \
				-image [$ibox get move_backward] \
				-label [::msgcat::mc "Move Backward"] \
				-command [list [self object] Pane_Move $btn "DOWN"]		   	
			$m add command -compound left \
				-image [$ibox get move_right] \
				-label [::msgcat::mc "Move to Right Frame"] \
				-command [list [self object] Pane_Move $btn "RIGHT"]		   	
			$m add command -compound left \
				-image [$ibox get move_left] \
				-label [::msgcat::mc "Move to Left Frame"] \
				-command [list [self object] Pane_Move $btn "LEFT"]		
	      }
		
		tk_popup $m $X $Y
	}
	
	method Pane_Move {btn target}  {
		my variable Priv
		
		set fme [winfo parent $btn]
		
		lassign [my Pane_Info $fme] title icon win fixed
		
		if {$target == "UP"} {
			set dest [winfo parent $fme]
			$dest forget $fme
			$dest insert 0 $fme
			$dest pane $fme -weight 1
			return
		}
		
		if {$target == "DOWN"} {
			set dest [winfo parent $fme]
			$dest forget $fme
			$dest insert end $fme
			$dest pane $fme -weight 1
			return
		}		
		
		if {$target == "HIDDEN"} {
			set dest $Priv(win,fmeHidden)
			set data [winfo parent $fme]
			my Pane_Delete  $fme
			my Pane_Create $dest $title $icon $win $fixed $data
			return			
		}

		set pane [string index $target 0]
		set dest $Priv(win,fme$pane)
		if {[winfo parent $fme] == $dest} {return}
		
		my Pane_Delete  $fme
		my Pane_Create $dest $title $icon $win $fixed
	}

	method Ui_Init {wpath} {
		my variable Priv
		
		set body [::ttk::frame $wpath -borderwidth 0]
		set fmeT [::ttk::frame $body.fmeT -borderwidth 0]
		set fmeS [::ttk::frame $body.fmeS -borderwidth 0]
		
		set fmeV [::ttk::panedwindow $body.fmeV]
		
		set fmeH [::ttk::panedwindow $fmeV.fmeH -orient horizontal]
		set fmeB [::ttk::panedwindow $fmeV.fmeB -orient horizontal]
		
		$fmeV add $fmeH -weight 1
		$fmeV add $fmeB
		
		set fmeL [::ttk::panedwindow $fmeH.fmeL]
		set fmeC [::ttk::panedwindow $fmeH.fmeC]
		set fmeR [::ttk::panedwindow $fmeH.fmeR]
		
		$fmeH add $fmeL
		$fmeH add $fmeC -weight 1
		$fmeH add $fmeR
		
		pack $fmeT -expand 0 -fill x
		pack $fmeV -expand 1 -fill both -padx 2 -pady 2
		pack $fmeS -expand 0 -fill x -padx 2
		
		set Priv(win,fmeT) $fmeT
		set Priv(win,fmeS) $fmeS		
		set Priv(win,fmeV) $fmeV
		set Priv(win,fmeH) $fmeH
		set Priv(win,fmeB) $fmeB
		
		set Priv(win,fmeL) $fmeL
		set Priv(win,fmeC) $fmeC
		set Priv(win,fmeR) $fmeR
		
		set Priv(win,fmeHidden) [::ttk::panedwindow $body.fmeHidden]
		
		set Priv(win,frame) $body
		
		return $body
	}
	
	export Pane_Menu Pane_Move
	
}

set ::dApp::Obj(layout) [::dApp::layout new .layout]
pack [$::dApp::Obj(layout) cget -frame] -expand 1 -fill both
