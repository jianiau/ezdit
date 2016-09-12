package require twidget::hook
package require twidget::ibox
package provide twidget::editor  $::twidget::Priv(version)

::oo::class create $::twidget::Priv(prefix)::editor {
	constructor {wpath {filepath ""} {enc "utf-8"} {fmt "lf"}} {
		# SYNOPSIS : 
		my variable Priv
		
		set Priv(obj,hook) [$::twidget::Priv(prefix)::hook new]
		set Priv(obj,ibox) [$::twidget::Priv(prefix)::ibox new]
		
		set Priv(obj,hook,share) 0
		set Priv(obj,ibox,share) 0 

		my Ui_Init $wpath

		set Priv(opts,fileformat) $fmt
		set Priv(opts,enc) $enc
		
		my linebox_update
		
		if {[file exists $filepath]} {my open $filepath $enc}
		
	}

	destructor {
		my variable Priv
		
		foreach {tag} [bind $Priv(win,linebox)] {bind $Priv(win,linebox) $tag {}}
		foreach {tag} [bind $Priv(win,text)] {bind $Priv(win,text) $tag {}}
		destroy $Priv(win,frame)
		if {$Priv(obj,hook,share) == 0} {$Priv(obj,hook) destroy}
		if {$Priv(obj,ibox,share) == 0} {$Priv(obj,ibox) destroy}
		
		array unset Priv
	}
	
	method bracket {cmd args} {
		return [my bracket_$cmd {*}$args]
	}

	method bracket_clear {} {
		my variable Priv
		set wtext $Priv(win,text)
		
		$wtext tag remove BRACKET 1.0 end
	}

	method bracket_find {} {
		my variable Priv	
	
		set wtext $Priv(win,text)
		
		set ret [my bracket_match]
		if {$ret == ""} {return}
		
		set ch [$wtext get $ret]
		if {[string first $ch "\}\]\)"] >= 0} {set ret "$ret + 1 chars"}
		
		$wtext mark set insert $ret
		$wtext see $ret
		
		my cursor_update
	}

	method bracket_match {} {
		my variable Priv
		
		array set map [list "\{" "\}" "\[" "\]" "\(" "\)"  "\}" "\{" "\]" "\[" "\)" "\(" "\"" "\""]
		
		set wtext $Priv(win,text)
		set ch [$wtext get insert]
		
		if {[string first $ch "\{\[\("] >= 0} {
			set idx1 [$wtext index "insert +1 chars"]
			set data [$wtext get $idx1 end]
			set len [string length $data]
			set stk [list insert $map($ch)]
			set last [lindex $stk end]
			set m1 $ch
	
			for {set i 0} {$i < $len} {incr i} {
				set ch [string index $data $i]
				if {$ch == "\\"} {incr i ; continue }
				if {$ch == $last} {
					set stk [lrange $stk 0 end-2]
					set last [lindex $stk end]
					if {$last == ""} {
						$wtext tag add BRACKET insert
						$wtext tag add BRACKET  "$idx1 + $i chars"
						return [$wtext index "$idx1 + $i chars"]
					}
					
					continue
				}
	
				if {$ch == $m1 || $ch == "\"" || $ch == "\{" || $ch == "\(" || $ch == "\[" } {
					set last $map($ch)
					lappend stk "$idx1 + $i chars" $last
				}
			}
	
			foreach {i ch} $stk {$wtext tag add BRACKET $i}
			return [$wtext index $i]
		}
	
		set idx1 [$wtext index "insert -1 chars"]
		set ch [$wtext get $idx1]
		
		if {[string first $ch "\}\]\)"] < 0} {return}
	
		set data [$wtext get 1.0 $idx1]
		set len [string length $data]
		set stk [list $idx1 $map($ch)]
		set last [lindex $stk end]
		set m1 $ch
		
		set cut 0
		for {set i [incr len -1]} {$i >= 0} {incr i -1} {
			incr cut
			set ch [string index $data $i]
			set ch2 [string index $data [expr $i-1]]
			if {$ch2 == "\\"} {incr i -1 ; incr cut ; continue }
			if {$ch == $last} {
				set stk [lrange $stk 0 end-2]
				set last [lindex $stk end]
				if {$last == ""} {
					$wtext tag add BRACKET $idx1
					$wtext tag add BRACKET "$idx1 - $cut chars"
					return [$wtext index "$idx1 - $cut chars"]
				}
				
				continue
			}
	
			if {$ch == $m1 || $ch == "\"" || $ch == "\}" || $ch == "\)" || $ch == "\]" } {
				set last $map($ch)
				lappend stk "$idx1 - $cut chars" $last
			}
		}	
		foreach {i ch} $stk {$wtext tag add BRACKET $i}
		return  [$wtext index $i]
	}
	
	method bracket_select {} {
		my variable Priv	
	
		set wtext $Priv(win,text)
		
		set ret [my bracket_match]
		if {$ret == ""} {return}
		
		set ch [$wtext get $ret]
		if {[string first $ch "\}\]\)"] >= 0} {set ret "$ret + 1 chars"}
		
		$wtext tag delete sel
		
		set ret [$wtext index $ret]
		set idx1 [$wtext index insert]
		set idx2 $idx1
	
		lassign [split $ret "."] i1 f1
		lassign [split $idx1 "."] i2 f2
		
		if {$i1 > $i2} {set idx2 $ret}
		if {$i1 < $i2} {set idx1 $ret}
		if {$i1 == $i2} {
			if {$f1 > $f2} {
				set idx2 $ret
			} else {
				set idx1 $ret
			}		
		}
		$wtext tag add sel $idx1 $idx2
		return
	}
	
	method bracket_state {} {
		my variable Priv
		set wtext $Priv(win,text)
		
		return [$wtext tag range BRACKET] 
	}
	
	method cget {opt} {
		my variable Priv
		
		if {$opt == "-file"} {return $Priv(opts,file)}
		if {$opt == "-format"} {return $Priv(opts,fileformat)}
		if {$opt == "-mtime"} {return $Priv(opts,mtime)}
		if {$opt == "-tabwidth"} {return $Priv(opts,tabwidth)}
		if {$opt == "-encoding"} {return $Priv(opts,enc)}
		if {$opt == "-lines"} {return $Priv(opts,lines)}
		if {$opt == "-pos"} {return $Priv(opts,pos)}
		if {$opt == "-modified"} {return $Priv(opts,modified)}
		if {$opt == "-wtext"} {return $Priv(win,text)}
		if {$opt == "-frame"} {return $Priv(win,frame)}
		if {$opt == "-images"} {return [$Priv(obj,ibox) dump]}
		if {$opt == "-hookobject"} {return $Priv(obj,hook)}
		if {$opt == "-iboxobject"} {return $Priv(obj,ibox)}
		return [$Priv(win,text) cget $opt]
	}
	
	method close {} {
	   my variable Priv
	   
		set wtext $Priv(win,text)
		
		$Priv(obj,hook) invoke <Document> "CLOSE"
	
		set Priv(opts,file) ""
		set Priv(opts,data) ""
		
		$wtext delete 1.0 end
		$wtext edit reset
		return
	}	
	
	method configure {args} {
	   my variable Priv
	   
		set wtext $Priv(win,text)
		
		set cmd [list $wtext configure]
		
		foreach {key val} $args {
			if {$key == "-tabwidth"} {
				set f [$wtext cget -font]
				$wtext configure -tabs [list [expr ceil([font measure $f "   "]*$val/3.0)] left]
				set Priv(opts,tabwidth) $val
				continue
			}
			if {$key == "-encoding"} {
				if {$Priv(opts,enc) == $val} {continue}
				if {![file exists $Priv(opts,file)] || $Priv(opts,file) == "" } {
					set Priv(opts,enc) $val
					continue
				}
				if {$Priv(opts,modified)} {
					set ans [tk_messageBox \
						-title [::msgcat::mc "Question"] \
						-icon question \
						-message [::msgcat::mc "The operation will reload this file. Save it ?"] \
						-type "yesnocancel"
						]
					if {$ans == "cancel"} {return}
					if {$ans == "yes"} {my save}
				}

				my open $Priv(opts,file) $val
				
				set idx1 [$wtext index "@0,0"]
				set idx2 [$wtext index "@[winfo width $wtext],[winfo height $wtext]"]
				$Priv(obj,hook) invoke <YScroll> $idx1 $idx2	
				continue
			}
			if {$key == "-images"} {
				foreach {name img} $val {$Priv(obj,ibox) replace $name $img}
				continue
			}
			
			if {$key == "-iboxobject"} {
				$Priv(obj,ibox) destroy
				set Priv(obj,ibox) $val
				set Priv(obj,ibox,share) 1
				continue
			}
			
			if {$key == "-hookobject"} {
				$Priv(obj,hook) destroy
				set Priv(obj,hook) $val
				set Priv(obj,hook,share) 1				
				continue
			}
			
			if {$key == "-font"} {
				$wtext configure -font $val
				$Priv(win,linebox) configure -font $val
				continue
			}
			
			if {$key == "-pos"} {
				my goto $val
				continue
			}
			
			if {$key == "-format"} {
				if {$Priv(opts,fileformat) == $val} {continue}
				set Priv(opts,modified) 1
				$wtext edit modified 1
				set Priv(opts,fileformat) $val
				$Priv(obj,hook) invoke <Document>  "CHANGED"
				continue
			}
			
			lappend cmd $key $val
		}

		
		return [eval $cmd]
	}
	
	method copy {{idx1 ""} {idx2 ""}} {
	   my variable Priv
	   
	   if {$idx1 == "line"} {return [my copy_line]}
	   if {$idx2 != ""} {return [my copy_range $idx1 $idx2]}
	   
		tk_textCopy $Priv(win,text)
		return
	}

	method copy_line {} {
	   my variable Priv
	   
		 set wtext $Priv(win,text)
		
		clipboard clear
		clipboard append [$wtext get "insert linestart" "insert lineend + 1 chars"]
		$wtext tag remove sel 1.0 end
		$wtext tag add sel "insert linestart" "insert lineend"			
		
		return
	}
	
	method copy_range {idx1 idx2} {
	   my variable Priv
	   
		 set wtext $Priv(win,text)
		
		clipboard clear
		clipboard append [$wtext get $idx1 $idx2]
		$wtext tag remove sel 1.0 end
		$wtext tag add sel $idx1 $idx2			
		
		return		
	}

	method cursor_update {} {
		variable Priv
		
		set wtext $Priv(win,text)
		set pos [$wtext index insert]
		set Priv(opts,pos) $pos
		
		$wtext tag delete LINEMARK
		set sel [$wtext tag range sel]
		if {$sel != ""} {
			$Priv(obj,hook) invoke <Cursor>  $pos
			return
		}
		$wtext tag add LINEMARK "$pos linestart" "$pos  lineend + 1 chars" 
		$wtext tag configure LINEMARK -background "#c5e0e0"
		$wtext tag lower LINEMARK
		
		my bracket clear
		set ch [$wtext get insert]
		if {[string first $ch "\{\[\("] >= 0} {my bracket match}
		set ch [$wtext get "insert -1 chars"]
		if {[string first $ch "\]\)\}"] >= 0} {my bracket match}
		
		$Priv(obj,hook) invoke <Cursor>  $pos
		
		my mark_refresh
	}

	method cut {{idx1 ""}} {
	   my variable Priv
	   
	   if {$idx1 == "line"} {return [my cut_line]}
	   
	   set wtext $Priv(win,text)
		set Priv(opts,sel) [$wtext index insert]
		
		tk_textCut $wtext
		my cursor_update
		my linebox_update
		return
	}

	method cut_line {} {
	   my variable Priv
	
		set wtext $Priv(win,text)
		$wtext tag remove sel 1.0 end
		$wtext tag add sel "insert linestart" "insert lineend + 1 chars"
		tk_textCut $wtext
		
		set Priv(opts,sel) [$wtext index insert]
		my cursor_update
		my linebox_update
		return
	}	
	
	method delete {} {
	   my variable Priv
	   
		set wtext $Priv(win,text)
		
		set sel [$wtext tag ranges sel]
		if {$sel == ""} {return}
		lassign $sel idx1 idx2
		$wtext delete $idx1 $idx2
		
		set Priv(opts,sel) $idx1
		
		$wtext mark set insert $idx1
		$wtext see $idx1
		my cursor_update
		my linebox_update
		return
	}

	method goto {idx} {
	  my variable Priv
	   
		set wtext $Priv(win,text)
		
		focus $wtext
		$wtext tag remove sel 1.0 end
		$wtext see "$idx -5 lines" 
		$wtext mark set insert $idx
		my linebox_update
		my cursor_update
		return
	}
	
	method goto_dialog {} {
		set dlg [$::twidget::Priv(prefix)::editor::gotobox new [my cget -frame].goto [self object]]
		$dlg show
		$dlg destroy	
	}	

	method hook {cmd args} {
		return [my hook_$cmd {*}$args]
	}

	method hook_install {tag script} {
		my variable Priv
		
		if {[lsearch -exact $Priv(evt,names)]} {
			set id [$Priv(obj,hook) install $tag $script]
		} else {
			bind $Priv(win,text) $tag $script
			set id ""
		}
		
		return $id
	}

	method hook_uninstall {tag id} {
		my variable Priv
		
		if {[lsearch -exact $Priv(evt,names)]} {
			$Priv(obj,hook) uninstall $tag $id
		} else {
			bind $Priv(win,text) $tag {}
		}		
		
	}	
	
	method indent {cmd} {
		return [my indent_$cmd ]
	}	
	
	method indent_add {} {
	   my variable Priv
	   
		set wtext $Priv(win,text)
		set sel [$wtext tag range sel]
		if {$sel == ""} {
			$wtext insert "insert linestart" "\t"
			return
		}
		
		set Priv(opts,sel) $sel
		
		lassign $sel idx1 idx2
		lassign [split $idx1 "."] line1
		lassign [split $idx2 "."] line2
		set data \t[$wtext get $line1.0 $line2.0]
		regsub -all "\n" $data "\n\t" data
		
		$wtext replace $line1.0 $line2.0 $data
		$wtext tag add sel "$idx1 linestart"  "$idx2 lineend"
		focus $wtext
		
		set idx1 [$wtext index "$idx1 linestart"]
		set idx2  [$wtext index "$idx2 lineend"]
	
		$Priv(obj,hook) invoke <YScroll> $idx1 $idx2
	
		return	
	}	
	
	method indent_delete {} {
	   my variable Priv
	   
		set wtext $Priv(win,text)
		set sel [$wtext tag range sel]
		if {$sel eq ""} {
			set sIdx [$wtext index "insert linestart"]
			set eIdx [$wtext index "insert lineend"]
		} else {
			lassign $sel sIdx eIdx
			set sIdx "$sIdx linestart"
			set eIdx "$eIdx lineend"
		}
		set Priv(opts,sel) $sel
		set data [split [$wtext get $sIdx $eIdx] "\n"]
		set data2 ""
		foreach item $data {
			if {[regexp -indices -- {^\s*(\t{1})} $item idx subIdx]} {
				set subIdx [lindex $subIdx 0]
				set tmp [string replace $item $subIdx $subIdx ""]
			} else {
				set tmp [regsub [format {^\s{0,%d}} $Priv(opts,tabwidth)] $item ""]
			}
			append data2 $tmp "\n"
		}
	
		$wtext replace $sIdx $eIdx [string range $data2 0 end-1]
		if {$sel != ""} {
			$wtext tag add sel $sIdx  "$eIdx lineend"
			focus $wtext	
			set idx1 [$wtext index $sIdx]
			set idx2 [$wtext index "$eIdx lineend"]		
		} else {
	 		set idx1 [$wtext index "insert linestart"]
			set idx2 [$wtext index "insert lineend"]		 		
	  	}
	
		$Priv(obj,hook) invoke <YScroll> $idx1 $idx2
		
		return	
	}	
	
	method linebox {cmd} {
		return [my linebox_$cmd]
	}
	
	method linebox_hide {} {
	   my variable Priv
	   
	   	set hs $Priv(win,hs)
		set vs $Priv(win,vs)
		set fme $Priv(win,frame)
		set linebox $Priv(win,linebox)
		set wtext $Priv(win,text)
		
		grid forget $wtext $vs $hs $linebox
		grid $wtext $vs -sticky "news"
		grid $hs - -sticky "news"
		grid rowconfigure $fme 0 -weight 1
		grid columnconfigure $fme 0 -weight 1
		grid columnconfigure $fme 1 -weight 0
		set Priv(opts,linebox) 0		
		
	}
	
	method linebox_show {} {
	   my variable Priv
	   
	   	set hs $Priv(win,hs)
		set vs $Priv(win,vs)
		set fme $Priv(win,frame)
		set linebox $Priv(win,linebox)
		set wtext $Priv(win,text)		
		
		grid forget $wtext $vs $hs $linebox
		grid $linebox $wtext $vs -sticky "news"
		grid $hs - - -sticky "news"
		grid rowconfigure $fme 0 -weight 1
		grid columnconfigure $fme 0 -weight 0
		grid columnconfigure $fme 1 -weight 1		
		set Priv(opts,linebox) 1		
		
	}
	
	method linebox_toggle {} {
	   my variable Priv	   
		if {$Priv(opts,linebox) == 1} {
			my linebox_hide
		} else {
			my linebox_show
	 	}
	 	return $Priv(opts,linebox)
	}
	
	method linebox_update {} {
		my variable Priv
		set wtext $Priv(win,text)
		set linebox $Priv(win,linebox)
		
		lassign [split [$wtext index end] "."] line1 char1
		lassign [split [$linebox index end] "."] line2 char2
		incr line1 -1 ; incr line2 -1
		$linebox configure -state normal
		if {$line1  >= $line2} {
			$linebox insert end "\n"
			for {set i $line2} {$i <= $line1} {incr i} {
				$linebox replace $i.0 "$i.0 lineend" [string range "000000$i\n" end-5 end]
			}
		}
		#$linebox mark set insert $line1.0
		#$linebox see $line1.0
		set Priv(opts,lines) $line1
		incr line1
		$linebox delete $line1.0  end
	
		$linebox configure -state disabled
		
		my mark_refresh
		return
	}
	
	method make_marks_menu {m} {
		my variable Priv
		
		set ibox $Priv(obj,ibox)
		
		set mlist [$Priv(win,text) tag ranges MARK]			
		set state "normal"
		if {[llength $mlist] == 0} {set state "disabled"}
	
		$m add command -compound left \
			-image [$ibox get mark_toggle] \
			-label [::msgcat::mc "Toggle Mark"] \
			-command [list [self object] mark toggle]	
		
		$m add command -compound left \
			-state $state \
			-image [$ibox get mark_prev] \
			-label [::msgcat::mc "Previous Mark"] \
			-command [list [self object] mark prev]
			
		$m add command -compound left \
			-state $state \
			-image [$ibox get mark_next] \
			-label [::msgcat::mc "Next Mark"] \
			-command [list [self object] mark next]		
		
		$m add separator	
		
		foreach {sIdx eIdx} $mlist {
			$m add command -compound left \
				-image [$ibox get mark_next] \
				-label [format L:%d [expr int($sIdx)]] \
				-command [list [self object] goto $sIdx]
		}
		if {[llength $mlist] > 0} {	$m add separator }
		
		$m add command -compound left \
			-state $state \
			-image [$ibox get mark_clear] \
			-label [::msgcat::mc "Clear All"] \
			-command [list [self object] mark clear]
		
	}
	
	method make_menu {m} {
	  	my variable Priv
	  	
		set wtext $Priv(win,text)	
		set ibox $Priv(obj,ibox)
		
		set sel [$wtext tag range sel]
		set state "normal"
		if {$sel == ""} {set state disabled}
		$m add command -compound left -state $state \
			-label [::msgcat::mc "Cut"] \
			-image [$ibox get cut] \
			-accelerator "Ctrl+x" \
			-command [list [self object] cut]
	
		$m add command -compound left -state $state \
			-label [::msgcat::mc "Copy"] \
			-image [$ibox get copy] \
			-accelerator "Ctrl+c" \
			-command [list [self object] copy]
		
		set state2 "normal"
		if {[catch {clipboard get}]} {set state2 disabled}
	
		$m add command -compound left -state $state2 \
			-label [::msgcat::mc "Paste"] \
			-image [$ibox get paste] \
			-accelerator "Ctrl+v" \
			-command [list [self object] paste]
			
		$m add command -compound left -state $state \
			-label [::msgcat::mc "Delete"] \
			-image [$ibox get delete] \
			-accelerator "Delete" \
			-command [list [self object] delete]
		
		$m add command -compound left \
			-label [::msgcat::mc "Select All"]	\
			-image [$ibox get select_all]\
			-accelerator "Ctrl+a" \
			-command [list [self object] selection set 1.0 end]
			
		
		set mlops [menu $m.lops -tearoff 0]
		set Priv(edit,menu,lops) $mlops	
		
		$m add cascade -compound left \
			-label [::msgcat::mc "Line Operations"] \
			-image [$ibox get line_ops] \
			-menu $mlops
		
		$mlops add command -compound left \
			-accelerator "Ctrl+k" \
			-label [::msgcat::mc "Cut Current Line"]	\
			-image [$ibox get cut_line] \
			-command [list [self object] cut_line]
			
		$mlops add command -compound left \
			-accelerator "Ctrl+y" \
			-label [::msgcat::mc "Copy Current Line"]	\
			-image [$ibox get copy_line] \
			-command [list [self object] copy_line]
		
		$mlops add command -compound left \
			-accelerator "Ctrl+p" \
			-label [::msgcat::mc "Paste As New Line"]	\
			-image [$ibox get paste_line] \
			-command [list [self object] paste_line]
	
		$mlops add command -compound left \
			-accelerator "Ctrl+j" \
			-label [::msgcat::mc "Move Down Current Line"]	\
			-image [$ibox get move_down]\
			-command [list [self object] move_down]
		
		$mlops add command -compound left \
			-accelerator "Ctrl+i" \
			-label [::msgcat::mc "Move Up Current Line"]	\
			-image [$ibox get move_up] \
			-command [list [self object] move_up]
			
		$mlops add separator	

		$mlops add command -compound left \
			-label [::msgcat::mc "Trim Trailing Space"]	\
			-image [$ibox get trim_space] \
			-command [list [self object] trim_space]					
						
		$m add separator	
				
		set mMarks [menu $m.marks -tearoff 0]
		$m add cascade -compound left \
			-label [::msgcat::mc "Marks"] \
			-image  [$ibox get marks] \
			-menu $mMarks
				
		set state "normal"
		if {[my mark_list] == ""} {set state "disabled"}
		$mMarks add command -compound left \
			-accelerator "F9" \
			-label [::msgcat::mc "Toggle Mark"]	\
			-image [$ibox get mark_toggle] \
			-command [list [self object] mark_toggle]
			
		$mMarks add command -compound left \
			-state $state \
			-image [$ibox get mark_next] \
			-accelerator "Shift+F9" \
			-label [::msgcat::mc "Previous Mark"] \
			-command [list [self object] mark_prev]
			
		$mMarks add command -compound left \
			-state $state \
			-image [$ibox get mark_prev] \
			-accelerator "Ctrl+F9" \
			-label [::msgcat::mc "Next Mark"] \
			-command [list [self object] mark_next]
			
		$mMarks add separator
		
		$mMarks add command -compound left \
			-state $state \
			-image [$ibox get mark_clear] \
			-label [::msgcat::mc "Clear All Marks"] \
			-command [list [self object] mark_clear]				
			
		$m add separator
		
		$m add command -compound left \
			-image [$ibox get goto] \
			-accelerator "Ctrl+g" \
			-label [::msgcat::mc "Goto Line..."] \
			-command [list [self object] goto_dialog]
			
		$m add command -compound left \
			-image [$ibox get find_replace] \
			-accelerator "Ctrl+f" \
			-label [::msgcat::mc "Find/Replace"] \
			-command [list [self object] search_dialog]	
			
		set state "disabled"
		if {[$wtext tag ranges BRACKET] != ""} {set state "normal"}
		
		$m add command -compound left \
			-state $state \
			-image [$ibox get bracket_find] \
			-label [::msgcat::mc "Jump to Matching Brace"] \
			-command [list [self object] bracket_find]
			
		$m add command -compound left \
			-state $state \
			-image [$ibox get bracket_select] \
			-label [::msgcat::mc "Select to Matching Brace"] \
			-command [list [self object] bracket_select]					
			
		$m add command -compound left \
			-image [$ibox get indent_add] \
			-accelerator "Ctrl+Period" \
			-label [::msgcat::mc "Increase Line Indent"] \
			-command [list [self object] indent_add]
			
		$m add command -compound left \
			-image [$ibox get indent_delete] \
			-accelerator "Ctrl+Comma" \
			-label [::msgcat::mc "Decrease Line Indent"] \
			-command [list [self object] indent_delete]
		
		set cut [$Priv(obj,hook) invoke <Menu> $m]
		
		if {$cut > 0} {$m add separator}
	}
	
	method make_encoding_menu {menc} {
		my variable Priv
	
		set var [self namespace]::Priv(var,enc)
		set $var $Priv(opts,enc)

		foreach {enc name} [list "ascii" "ASCII" "utf-8" "UTF-8" ] {
			$menc add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] configure -encoding $enc]
		}
		
		set m2 $menc.asia
		if {[winfo exists $m2]} {destroy $m2}
		menu $m2 -tearoff 0	
		
		$menc add cascade -compound left \
			-label [::msgcat::mc "Asia"] \
			-menu $m2
			
		foreach {enc name} [list  "gb12345"  "Simplified Chinese (GB12345)" \
					                    "gb2312"  "Simplified Chinese (GB2312-1980)" \
					                    "gb2312-raw"  "Simplified Chinese (GB2312-RAW)" \
					                    "big5"  "Traditional Chinese (Big5)" \
					                    "cp950"  "Traditional Chinese (Microsoft CP-950)" \
					                    "shiftjis"  "Shift JIS" \
					                    "cp932"  "Shift JIS (CP-932)" \
					                    "cp936"  "GBK (CP-936/GBK)" \
								] {
			$m2 add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] configure -encoding $enc]								
		}	
		
		set m2 $menc.eastern_europe
		if {[winfo exists $m2]} {destroy $m2}
		menu $m2 -tearoff 0	
		
		$menc add cascade -compound left \
			-label [::msgcat::mc "Eastern Europe"] \
			-menu $m2
			
		foreach {enc name} [list "iso8859-4"  "Baltic (Latin-4/ISO-8859-4)" \
					                    "iso8859-13"  "Baltic (Latin-7/ISO-8859-13)" \
					                    "cp1257"  "Baltic (CP-1257)" \
					                    "iso8859-2"  "Central European (Latin-2/ISO-8859-2)" \
					                    "cp1250"  "Central European (CP-1250)" \
					                    "iso8859-5"  "Cyrillic (ISO-8859-5)" \
					                    "koi8-r"  "Cyrillic (KOI8-R)" \
					                    "cp1251"  "Cyrillic (CP-1251)" \
					                    "macCyrillic"  "Cyrillic (Mac-Cyrillic)" \
					                    "iso8859-9"  "Turkish (Latin-5/ISO-8859-9)" \
					                    "macTurkish"  "Turkish (Mac-Turkish)" \
								] {
			$m2 add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] configure -encoding $enc]					
		}
		
		set m2 $menc.middle_europe
		if {[winfo exists $m2]} {destroy $m2}
		menu $m2 -tearoff 0	
		
		$menc add cascade -compound left \
			-label [::msgcat::mc "Middle East"] \
			-menu $m2
			
		foreach {enc name} [list  "cp1255"  "Hebrew (CP-1255)" \
					                    "iso8859-8"  "Hebrew (ISO-8859-8)" \
								] {
			$m2 add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] configure -encoding $enc]					
		}
		
		set m2 $menc.wastern_europe
		if {[winfo exists $m2]} {destroy $m2}
		menu $m2 -tearoff 0	
		
		$menc add cascade -compound left \
			-label [::msgcat::mc "Western Europe"] \
			-menu $m2
			
		foreach {enc name} [list  "iso8859-1"  "Western European (Latin-1/ISO-8859-1)" \
									 "macRoman"  "Western European (Mac-Roman)" \
									 "iso8859-15"  "Western European (Latin-9/ISO-8859-15)" \
									 "cp1252"  "Western European (CP-1252)" \
									 "iso8859-14"  "Celtic (Latin-8/ISO-8859-14)" \
									 "iso8859-7"  "Greek (ISO-8859-7)" \
									 "cp1253"  "Greek (CP-1253)" \
									 "macGreek"  "Greek (Mac-Greek)" \
									 "iso8859-10"  "Nordic (Latin-6/ISO-8859-10)" \
									 "macIceland"  "Iceland (Mac-Iceland)" \
									 "iso8859-4"  "Northern European (ISO-8859-4)" \
									 "iso8859-3"  "Southern European (ISO-8859-3)" \
								] {
			$m2 add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] configure -encoding $enc]	
		}
	}
	
	method mark {cmd args} {
		return [my mark_$cmd {*}$args]
	}
	
	method mark_clear {} {
	   my variable Priv
	   
		set linebox $Priv(win,linebox)
		set wtext $Priv(win,text)
		
		$wtext tag remove MARK 1.0 end
		$linebox tag remove MARK 1.0 end
		
	}	
	
	method mark_list {} {
	   my variable Priv
		
		return [$Priv(win,text) tag ranges MARK]				
	}	
	
	method mark_next {} {
	   my variable Priv
	   
		set linebox $Priv(win,linebox)
		set wtext $Priv(win,text)
		set line [expr int([$wtext index "insert"])]
		
		lassign [$wtext tag nextrange MARK $line.2] sIdx eIdx
		
		if {$sIdx == ""} {
			lassign [$wtext tag nextrange MARK 1.0] sIdx eIdx
		}		
	
		if {$sIdx == ""} {return}
		
		my goto $sIdx
		return
	}	
	
	method mark_prev {} {
	   my variable Priv
	   
		set linebox $Priv(win,linebox)
		set wtext $Priv(win,text)
		set line [expr int([$wtext index "insert"])]
		
		lassign [$wtext tag prevrange MARK $line.0] sIdx eIdx
		
		if {$sIdx == ""} {
			lassign [$wtext tag prevrange MARK end] sIdx eIdx
		}	
		
		if {$sIdx == ""} {return}
		
		my goto $sIdx
		return
	}
	
	method mark_refresh {} {
		variable Priv
		
		set wtext $Priv(win,text)
		set linebox $Priv(win,linebox)
		$linebox tag remove MARK 1.0 end
		
		foreach {idx1 idx2} [$wtext tag ranges MARK] {
			$linebox tag add MARK "$idx1 linestart" "$idx1 linestart + 1 chars"
		}
	}	
	
	method mark_toggle {{x ""} {y ""}} {
	   my variable Priv
	   
		set linebox $Priv(win,linebox)
		set wtext $Priv(win,text)
		
		if {$x == ""} {
			set line [expr int([$wtext index [$wtext index "insert"]])]
		} else {
			set line [expr int([$wtext index "@$x,$y"])]
		}
		set tags [$wtext tag names $line.0]
	
		if {[lsearch -exact $tags "MARK"] >=0} {
			$wtext tag remove MARK $line.0  "$line.0 lineend"
			$linebox tag remove MARK $line.0 $line.1
		} else {
			if {[$wtext get $line.0 "$line.0 lineend"] != ""} {
				$wtext tag add MARK $line.0 "$line.0 lineend"
				$linebox tag add MARK $line.0 $line.1
			}
		}
	
		return
	}
	
	method modified {{val ""}} {
		my variable Priv
		
		if {$val == ""} {return $Priv(opts,modified)}
		set wtext $Priv(win,text)
		set Priv(opts,modified) $val
		$wtext edit modified $val
		
		return $val
	}
	
	method move_down {} {
		my variable Priv
	
		set wtext $Priv(win,text)
		set data [$wtext get "insert linestart" "insert lineend + 1 chars"]
		$wtext delete "insert linestart" "insert lineend + 1 chars"
		
		set idx1 [$wtext index "insert + 1 lines linestart"]
		set idx2 	[$wtext index "end linestart"]
		
		set insert "$idx1 lines"
		if {$idx1 == $idx2} {
			$wtext insert "end lineend" \n
			set insert "$idx1 lines"
		}
		$wtext insert $idx1 $data	
		$wtext mark set insert $insert
		$wtext see $insert
		
		set Priv(opts,sel) [$wtext index insert]
		
		my cursor_update
		my linebox_update
		
		set idx1 [$wtext index "@0,0"]
		set idx2 [$wtext index "@[winfo width $wtext],[winfo height $wtext]"]	
		$Priv(obj,hook) invoke <YScroll> $idx1 $idx2		
	}
	
	method move_up {} {
		my variable Priv
	
		set wtext $Priv(win,text)
		set data [$wtext get "insert linestart" "insert lineend + 1 chars"]
		$wtext delete "insert linestart" "insert lineend + 1 chars"
		
		set idx1 [$wtext index "insert + 1 lines linestart"]
		
	  	$wtext insert "insert - 1 lines linestart" $data	
	
		$wtext mark set insert 	"insert  -2 lines linestart"
		$wtext see "insert  -2 lines linestart"
		set Priv(opts,sel) [$wtext index insert]
		
		my cursor_update
		my linebox_update
		
		set idx1 [$wtext index "@0,0"]
		set idx2 [$wtext index "@[winfo width $wtext],[winfo height $wtext]"]	
		$Priv(obj,hook) invoke <YScroll> $idx1 $idx2		
	}	
	
	method open {filepath {enc "utf-8"}} {
	   my variable Priv
		
		set wtext $Priv(win,text)
		
		$wtext delete 1.0 end
		
		set Priv(opts,enc) $enc
		
		set fd [open $filepath r]
		chan configure $fd -encoding $Priv(opts,enc) ;# -translation binary
		set Priv(opts,data) [chan read -nonewline $fd]
		$wtext insert end $Priv(opts,data)
		
		chan configure $fd -translation binary
		if {[catch {chan seek $fd -2 end}]} {
			set end "\n"
		} else {
			set end [chan read $fd]
		}
		chan close $fd
		
		set Priv(opts,fileformat) "lf"
		
		if {$end == "\r\n"} {
			set Priv(opts,fileformat) "crlf"
		} else {
			if {[string index $end end] == "\r"} {set Priv(opts,fileformat) "cr"}
		}
		
		set Priv(opts,file) $filepath
		set Priv(opts,mtime) [file mtime $filepath]
		set Priv(opts,modified) 0
		
		$wtext mark set insert 1.0
		$wtext edit reset
		$wtext edit modified 0
		
		my linebox_update
		my cursor_update
	}	
	
	method paste {{idx1 ""}} {
	   variable Priv
	   
	   if {$idx1 == "line"} {return [my paste_line]}
	   
		set wtext $Priv(win,text)
		
		set sel [$wtext tag ranges sel]
		set idx1 [$wtext index insert]
		if {$sel != ""} {
	  		lassign $sel idx1 idx2
	  		$wtext delete $idx1 $idx2
	  	}
	  	set data ""
	  	catch {set data [clipboard get]} {return}
	  	if {$data == ""} {return}
	  	$wtext insert $idx1 $data
		#tk_textPaste $editor
		
		set len [string length $data]
		
		set idx2 [$wtext index "$idx1 + $len chars"]
		
		set Priv(opts,sel) $idx2
		
		$wtext mark set insert $idx2
		$wtext see $idx2
		my cursor_update
		my linebox_update
		
		set idx1 [$wtext index "@0,0"]
		set idx2 [$wtext index "@[winfo width $wtext],[winfo height $wtext]"]	
		$Priv(obj,hook) invoke <YScroll> $idx1 $idx2
		return
	}	
	
	method paste_line {} {
	   my variable Priv
	
		set wtext $Priv(win,text)
		set idx1 [$wtext index "insert + 1 lines linestart"]
	
	  	set data ""
	  	catch {set data [clipboard get]} {return}
	  	if {$data == ""} {return}
	  	$wtext insert $idx1 $data
		
		set len [string length $data]
		
		set idx2 [$wtext index "$idx1 + $len chars"]
		
		set Priv(opts,sel) $idx2
		
		$wtext mark set insert "$idx2 - 1 chars"
		$wtext see $idx2
		my cursor_update
		my linebox_update
		
		set idx1 [$wtext index "@0,0"]
		set idx2 [$wtext index "@[winfo width $wtext],[winfo height $wtext]"]	
		$Priv(obj,hook) invoke <YScroll> $idx1 $idx2
		return
	}
	
	method redo {} {
		my variable Priv
		
		set wtext $Priv(win,text)
		
		if {[catch {$wtext edit redo}]} {
			if {$Priv(opts,modified) == 1 && $Priv(opts,data) == [$wtext get 1.0 "end -1 chars"]} {
				set Priv(opts,modified) 0
				$wtext edit modified 0
				$Priv(obj,hook) invoke <Document> "NONE"
			}
			return
		}
		my cursor_update
		my linebox_update
		return
	}
	
	method save {{fpath ""}} {
	   my variable Priv
	   
		set wtext $Priv(win,text)
		
		if {$fpath != ""} {set Priv(opts,file) $fpath}
		set filepath $Priv(opts,file)
	   
		if {$filepath == ""} {
			return [my save_as]
		}
		
		set Priv(opts,data) [$wtext get 1.0 end]
		
		set fd [open $filepath w]
		chan configure $fd -encoding $Priv(opts,enc) -translation $Priv(opts,fileformat)
		chan puts -nonewline $fd $Priv(opts,data)
		chan close $fd
		
		set Priv(opts,file) $filepath
		set Priv(opts,mtime) [file mtime $filepath]
		$wtext edit modified 0
		set Priv(opts,modified) 0

		$Priv(obj,hook) invoke <Document> "NONE"
		return 
		
	}
	
	method save_as {} {
	   my variable Priv
	   
		set wtext $Priv(win,text)

		set ans [tk_getSaveFile \
			-title [::msgcat::mc "Save as ..."] \
			-filetypes {{{All Files} *}} ]
		if {$ans == "" || $ans == "-1"} {return}
		set filepath $ans

		set Priv(opts,data) [$wtext get 1.0 end]
		
		set fd [open $filepath w]
		chan configure $fd -encoding $Priv(opts,enc) -translation $Priv(opts,fileformat)
		chan puts -nonewline $fd $Priv(opts,data)
		chan close $fd
		
		set Priv(opts,file) $filepath
		set Priv(opts,mtime) [file mtime $filepath]
		$wtext edit modified 0
		set Priv(opts,modified) 0

		$Priv(obj,hook) invoke <Document> "SAVEAS"
		return $filepath
		
	}	
	
	method search {pattern args} {
		my variable Priv

		array set params [list \
			-backwards 0 \
			-regexp 0 \
			-nocase 1 \
			-nolinestop 0 \
			-all 0 \
			-start insert \
			-end "" \
		]
		array set params $args 

		if {$params(-all)} {
			return [my search_all $pattern {*}$args]
		}
		
		set wtext $Priv(win,text)
		set cmd [list $wtext search]
		$wtext tag delete sel

		set Priv(opts,search,count) 0
		
		if {$params(-backwards)} {lappend cmd -backwards}
		if {$params(-regexp)} {lappend cmd -regexp -count [self namespace]::Priv(opts,search,count)}
		if {$params(-nocase)} {lappend cmd -nocase}
		if {$params(-nolinestop)} {lappend cmd -nolinestop}	
		
		if {$params(-nolinestop) == 1 && $params(-regexp) == 0} {
			lappend cmd -regexp -count [self namespace]::Priv(opts,search,count)
		}
		
		lappend cmd -- $pattern $params(-start)
		if {$params(-end) != ""} {lappend cmd $params(-end)}
		set ret [eval $cmd]
		
		foreach {idx1 idx2} [$wtext tag ranges FIND] {$wtext tag remove FIND $idx1 $idx2}
		
		if {$ret != ""} {
			if {$params(-regexp)} {
				set idx2 "$ret + $Priv(opts,search,count) chars"
				if {[info exists params(-replace)]} {
					$wtext replace $ret $idx2 $params(-replace)
					set idx2 [format "$ret + %s chars " [string length $params(-replace)] ]
				}
				$wtext tag add FIND $ret $idx2
			} else {
				set idx2 [format "$ret + %s chars" [string length $pattern] ]
				if {[info exists params(-replace)]} {
					$wtext replace $ret $idx2 $params(-replace)
					set idx2 [format "$ret + %s chars " [string length $params(-replace)] ]
				}				
				$wtext tag add FIND $ret $idx2
			}
			$wtext see $ret
			$wtext mark set insert $ret
			
			my cursor_update
		}
		
		return $ret
	}
	
	method search_all {pattern args} {
		my variable Priv
		
		set wtext $Priv(win,text)
		
		$wtext tag remove FIND_ALL 1.0 end

		array set params [list \
			-backwards 0 \
			-regexp 0 \
			-nocase 1 \
			-nolinestop 0 \
			-all 0 \
			-start insert \
			-end "" \
		]
		array set params $args 		

		set cmd [list $wtext search]
		$wtext tag delete sel
		set Priv(opts,search,count) 0
		
		if {$params(-backwards)} {lappend cmd -backwards}
		if {$params(-regexp)} {lappend cmd -regexp -count [self namespace]::Priv(opts,search,count)}
		if {$params(-nocase)} {lappend cmd -nocase}
		if {$params(-nolinestop)} {lappend cmd -nolinestop}	
		
		if {$params(-nolinestop) == 1 && $params(-regexp) == 0} {
			lappend cmd -regexp -count [self namespace]::Priv(opts,search,count)
		}
		
		lappend cmd -- $pattern 
	
		set idx "1.0"
		set cut 0
		while {$idx != ""} {
			set idx [eval [linsert $cmd end $idx end]]
			if {$idx == ""} {break}
	
			if {$params(-regexp)} {
				set idx2 "$idx + $Priv(opts,search,count) chars"
			} else {
				set idx2 [format "$idx + %s chars" [string length $pattern] ] 
			}		
			
			if {[info exists params(-replace)]} {
				$wtext replace $idx $idx2 $params(-replace)
				set idx2 [format "$idx + %s chars " [string length $params(-replace)] ]				
			}
			
			$wtext tag add FIND_ALL $idx $idx2
			
			incr cut
			set idx $idx2
		}	
	
		return $cut
	}
	
	method search_dialog {} {
		if {[winfo exists .editor_find]} {destroy .editor_find}
		set dlg [$::twidget::Priv(prefix)::editor::searchbox new .editor_find [self object] local]
		set ret [$dlg show]
		$dlg destroy
	}	
	
	method selection {cmd args} {
		return [my selection_$cmd {*}$args]
	}
	
	method selection_get {} {
		my variable Priv
		set wtext $Priv(win,text)

		return [$wtext tag ranges sel]
	}
	
	method selection_set {idx1 idx2} {
	   my variable Priv
	   
		set wtext $Priv(win,text)
		$wtext tag delete sel
		$wtext tag add sel $idx1 $idx2			
	}
	
	method trim_space {} {
		my variable Priv

		set wtext $Priv(win,text)
		set data ""
		foreach {line} [split [$wtext get 1.0 end] "\n"] {
			append data [string trimright $line] "\n"
		}
		$wtext replace 1.0 end [string trimright $data]
		unset data
		set idx1 [$wtext index "@0,0"]
		set idx2 [$wtext index "@[winfo width $wtext],[winfo height $wtext]"]
	}		

	method undo {} {
		my variable Priv
		
		set wtext $Priv(win,text)
		if {[catch {$wtext edit undo}]} {
			if {$Priv(opts,modified) == 1 && $Priv(opts,data) == [$wtext get 1.0 "end -1 chars"]} {
				set Priv(opts,modified) 0
				$wtext edit modified 0
				$Priv(obj,hook) invoke <Document> "NONE"
			}
			return
		}
		my cursor_update
		my linebox_update
		
		set idx1 [$wtext index "@0,0"]
		set idx2 [$wtext index "@[winfo width $wtext],[winfo height $wtext]"]	
		$Priv(obj,hook) invoke <YScroll> $idx1 $idx2
	}
	
	method ButtonL_Release {} {
		my variable Priv
		
		set wtext $Priv(win,text)
		
		if {[$wtext index insert] != $Priv(opts,pos)} {my cursor_update}
	}		
	
	method Content_Change {} {
		my variable Priv
		set wtext $Priv(win,text)
		
		bind $wtext <<Modified>> {}
		if {$Priv(opts,modified) == 0} {$Priv(obj,hook) invoke <Document>  "CHANGED"}
		set Priv(opts,modified) 1
		
		set type "LINE"
		if {$Priv(opts,sel) != ""} {set type "MULTILINE"}

		$Priv(obj,hook) invoke <Content> $type $Priv(opts,key)
		
		$wtext edit modified 0
		bind $wtext <<Modified>> [list [self object] Content_Change]
	}	
	
	method Focus_In {} {
		my variable Priv
		set wtext $Priv(win,text)
	
		if {![info exists Priv(opts,file)]} {return}
		set filepath $Priv(opts,file)
		
		bind $wtext <FocusIn> {}
		
		$Priv(obj,hook) invoke <Focus>
		
		if {$filepath == ""} {
			bind $wtext <FocusIn> [list [self object] Focus_In]
			return
		}		
		
		#<!-- check exists ?
		if {![file exists $filepath]} {
				$Priv(obj,hook) invoke <Document> "DELETED"
				return
		}
		#-->	
		
		#<!-- check modified ?
		if {[file mtime $filepath] != $Priv(opts,mtime)} {
			$Priv(obj,hook) invoke <Document> "MTIME"
			set Priv(opts,mtime) [file mtime $filepath]
		}
		#-->
		bind $wtext <FocusIn> [list [self object] Focus_In]
	}
	
	method Key_Press {key} {
		my variable Priv
		set wtext $Priv(win,text)
	
		set Priv(opts,key) $key
		set Priv(opts,pos) [$wtext index insert]
		set Priv(opts,sel) [$wtext tag range sel]
		
		if {$key == "Tab" && $Priv(opts,sel) != ""} {$wtext tag remove sel 1.0 end}
	}
	
	method Key_Release {key} {
		my variable Priv
		
		set wtext $Priv(win,text)
		
		if {$key == "Tab" && $Priv(opts,sel) != ""} {
			$wtext delete "insert -1 chars"
			$wtext tag add sel {*}$Priv(opts,sel)
			my indent_add
		}
		
		if {[$wtext index insert] != $Priv(opts,pos)} {my cursor_update}
		
		if {[lsearch [list BackSpace Return KP_Enter Delete] $key] >=0} {my linebox_update}
	}

	method Menu_Popup {} {
		my variable Priv
		
		set wtext $Priv(win,text)
		
		lassign [winfo pointerxy $wtext] x y
		if {[winfo exists $wtext.popupMenu]} {destroy $wtext.popupMenu}
		set m [menu $wtext.popupMenu -tearoff 0]
		my make_menu $m
		tk_popup $m $x $y
	}

	method Selection_Change {} {
		my variable Priv
		set wtext $Priv(win,text)
		
		set sel [$wtext tag range sel]
		set len 0
		if {$sel != ""} {
			lassign $sel idx1 idx2
			set len [$wtext count $idx1 $idx2]
		}
		$Priv(obj,hook) invoke <Selection> $len
	}

	method Ui_Init {wpath} {
		my variable Priv

		set fme [ttk::frame $wpath]
		
		set linebox [text $fme.linebox \
			-width 6 \
			-wrap none  \
			-spacing3 1 \
			-state disabled \
			-bd 0 \
			-font EzEditorFont \
			-highlightthickness 0 \
			-fg "#666666" \
			-bg "#e3e4e5" \
			-height 1]
		
		set wtext [text $fme.text \
			-wrap none \
			-bd 0 \
			-undo 1 \
			-font EzEditorFont \
			-highlightthickness 0  \
			-spacing3 1 \
			-height 1 \
			-width 1]

		set hs [ttk::scrollbar $fme.hs -orient horizontal -command [list $wtext xview]]
		set vs [ttk::scrollbar $fme.vs -orient vertical -command [list $wtext yview]]
		$wtext configure -xscrollcommand [list $hs set] \
			-yscrollcommand [list [self object] YScroll]
		
		grid $linebox $wtext $vs -sticky "news"
		grid $hs - - -sticky "news"
		grid rowconfigure $fme 0 -weight 1
		grid columnconfigure $fme 1 -weight 1
		
		$Priv(obj,hook) define <Menu>
		
		$Priv(obj,hook) define <Cursor>
		#  這個事件在文件的游標改變時觸發
		# pos -> 游標目前的位置 (line.char)
		
		$Priv(obj,hook) define <Content>
		# 這個事件在文件的內容被改變時觸發
		# type : 影響的行數
		#			LINE : 單行
		#			MULTILINE : 多行
		
		$Priv(obj,hook) define <Selection>
		# 這個事件在文件的選取區被改變時觸發
		# len : 被選取的長度		
		
		$Priv(obj,hook) define <Document>
		# 這個事件在文件的狀態改變時觸發
		# flag -> 目前的狀態
		#			CLOSE   : 文件準備被關閉 （關閉前）
		# 			DELETED : 文件已經在檔案系統被刪除
		# 			MTIME   : mtime 被改變
		# 			NONE    : 文件的內容沒有被改變過 （redo undo時可能程發）
		# 			CHANGED : 文件的內容已經被改變過
		
		$Priv(obj,hook) define <YScroll>
		# 這個事件在文件的垂直可視區被改變時觸發
		# idx1 -> 目前可視區最左上方的位置 (line.hcar)
		# idx2 ->  目前可視區最右下方的位置 (line.hcar)

		set Priv(evt,names) [list <Content> <Cursor> <Document> <Menu> <Selection> <YScroll>]

		$wtext tag configure sel -background "#e4e5e6" -foreground black -relief groove -borderwidth 2
		$wtext tag configure FIND -background "#ddccdd" -foreground black -borderwidth 2 -relief groove	
		$wtext tag configure FIND_ALL -background yellow
		$wtext tag configure BRACKET -background "#ff8c55"
		$wtext tag raise FIND
		$wtext tag raise BRACKET
		
		$linebox tag configure MARK -background "#babe87"
		
		
		bind $linebox <<ButtonLClick>>  [list [self object] mark_toggle %x %y]
		bind $wtext <<ButtonLRelease>> 			[list [self object] ButtonL_Release]
		
		bind $wtext <<MarkToggle>> [list [self object] mark_toggle]
		bind $wtext <<MarkPrev>> [list [self object] mark_prev]
		bind $wtext <<MarkNext>> [list [self object] mark_next]		
		bind $wtext <<Find>> 				[list [self object] search_dialog]
		bind $wtext <<Goto>> 			 [list [self object] goto_dialog]

		bind $wtext <<SelectAll>> [list [self object] selection set 1.0 end]
		bind $wtext <<Copy>> 		[list [self object] copy]
		bind $wtext <<Cut>> 		[list [self object] cut]
		bind $wtext <<Paste>> 	[list [self object] paste]
		bind $wtext <<CutLine>> 		[list [self object] cut_line]
		bind $wtext <<CopyLine>> 		[list [self object] copy_line]
		bind $wtext <<PasteLine>> 		[list [self object] paste_line]
		
		bind $wtext <<MoveUpLine>> 		[list [self object] move_up]
		bind $wtext <<MoveDownLine>> 		[list [self object] move_down]

		bind $wtext <<Save>> 				[list [self object] save]
		bind $wtext <<Undo>> 				[list [self object] undo]
		bind $wtext <<Redo>> 				[list [self object] redo]
		bind $wtext <<Modified>> 			[list [self object] Content_Change]
		bind $wtext <<Indent>> 				 [list [self object] indent_add]
		bind $wtext <<UnIndent>> 	[list [self object] indent_delete]	

		bind $wtext <<Selection>> 			[list [self object] Selection_Change]
		bind $wtext <<MenuPopup>> [list [self object] Menu_Popup]

		bind $wtext <KeyPress> 				[list [self object] Key_Press %K]
		bind $wtext <KeyRelease> 				[list [self object] Key_Release %K]		

		bind $wtext <FocusIn> 		[list [self object] Focus_In]
		bind $wtext <Visibility> [list [self object] Visibility]

		bindtags $linebox [list $linebox]
		bindtags $wtext [list $wtext Text . all]

		set Priv(win,frame) $fme
		set Priv(win,linebox) $linebox
		set Priv(win,text)		$wtext
		set Priv(win,hs) $hs
		set Priv(win,vs) $vs	  	
		
		array set Priv [list \
			opts,enc "utf-8"
			opts,file "" \
			opts,fileformat "lf" \
			opts,data "" \
			opts,mtime 0 \
			opts,enc utf-8 \
			opts,tabwidth 5 \
			opts,modified 0 \
			opts,sel "" \
			opts,key "" \
			opts,lines 0 \
			opts,pos 1.0 \
			opts,linebox 1 \
			opts,yscrollnest 0 \
		]

		my configure -tabwidth $Priv(opts,tabwidth)

		return $wtext
	}	

	method Visibility {} {
		variable Priv
		set wtext $Priv(win,text)
		
		bind $wtext <Visibility> {}
		focus $wtext
		my Selection_Change
		bind $wtext <Visibility> [list [self object] Visibility]
	}	
	
	method YScroll {args} {
		my variable Priv
	
		set wtext $Priv(win,text) 
	
		if {$Priv(opts,yscrollnest) > 0} {return}
		incr Priv(opts,yscrollnest)
		lassign $args v1 v2
		$Priv(win,vs) set $v1 $v2
		$Priv(win,linebox) yview moveto $v1
		
		set idx1 [$wtext index "@0,0"]
		set idx2 [$wtext index "@[winfo width $wtext],[winfo height $wtext]"]
			
		$Priv(obj,hook) invoke <YScroll> $idx1 $idx2
		incr Priv(opts,yscrollnest) -1
		my mark_refresh
	}
}

oo::class create $::twidget::Priv(prefix)::editor::gotobox {
	superclass ::twidget::dialog 
	constructor {wpath editor} {
		my variable Priv
		array set Priv [list line "" editor $editor]
		
		next $wpath\
			-title [::msgcat::mc "Goto"]  \
			-default cancel \
			-cancel 1 \
			-position auto \
			-buttons [list \
				ok [::msgcat::mc "Ok"] \
				cancel [::msgcat::mc "Cancel"] ]
	}
	
	destructor {
		my variable Priv
		next
		array unset Priv
	}
	
	method body {fme} {
		my variable Priv
		
		set lbl [ttk::label $fme.lbl -text [::msgcat::mc "Line:"] -anchor w -justify left]
		set txt [ttk::entry $fme.txt -textvariable [self namespace]::Priv(line)]
		pack $lbl -side top -padx 2 -fill x -pady 2
		pack $txt -side top -padx 2 -fill x -pady 2 -padx 2	
	}
	
	method close {ret} {
		my variable Priv opts
		set Priv(ret) $ret
		
		set Priv(line) [string trim $Priv(line)]
		if {$ret == "cancel" || $ret == "-1"} {after idle [destroy $Priv(win)] ; return}
		if {$Priv(line) == "" || ![string is double $Priv(line)]} {after idle [destroy $Priv(win)] ; return}
		
		$Priv(editor) goto [expr double($Priv(line))]
		
		after idle [destroy $Priv(win)]
	}
}



::oo::class create $::twidget::Priv(prefix)::editor::searchbox {
	superclass ::twidget::dialog 
	constructor {wpath editor grab args} {
		my variable Priv opts
		array set Priv [list editor $editor result ""]
		
		array set opts [list \
			-findText "" \
			-replaceText "" \
			-regexp 0 \
			-nocase 1 \
			-nolinestop 0 \
			-msg "" \
		]
		array set opts $args
		
		next $wpath\
			-cancel 1 \
			-grab $grab \
			-title [::msgcat::mc "Find And Replace"]  \
			-position auto \
			-buttons [list ]
	}
	
	destructor {
		my variable Priv
		next
		array unset Priv
	}
	
	method body {win} {
		my variable Priv
		my variable opts

		set lblFind [ttk::label $win.lblFind -text [::msgcat::mc "Find what:"] -anchor w -justify left]
		set txtFind [ttk::entry $win.txtFind -textvariable [self namespace]::opts(-findText)]
		set lblReplace [ttk::label $win.lblReplace -text [::msgcat::mc "Replace what:"] -anchor w -justify left]
		set txtReplace [ttk::entry $win.txtReplace -textvariable [self namespace]::opts(-replaceText)]	
		
		set fmeSwitch [ttk::frame $win.fmeSwitch]
		foreach {item caption on off} [list \
				regexp [::msgcat::mc "Regexp"] 1 0\
				nocase [::msgcat::mc "Match case"] 0 1\
				nolinestop [::msgcat::mc "Multiline"] 1 0] {

			ttk::checkbutton $fmeSwitch.chk$item \
				-variable [self namespace]::opts(-$item) \
				-text $caption \
				-onvalue $on \
				-offvalue $off
			pack $fmeSwitch.chk$item -side left -padx 2 -pady 2
		}
		
		set txtMsg [ttk::label $win.txtMsg -textvariable [self namespace]::opts(-msg)]
		set fmeBtn [ttk::frame $win.fmeBtn]
		
		set btnPrev [ttk::button $fmeBtn.btnPrev -text [::msgcat::mc "Find Previous"] \
			-command [list [self object] find 1]]
		
		set btnNext [ttk::button $fmeBtn.btnNext -text [::msgcat::mc "Find Next"] \
			 -command [list [self object] find]]
		
		set btnReplace [ttk::button $fmeBtn.btnReplace -text [::msgcat::mc "Replace"] \
			-command [list [self object] replace]]
		
		set btnFindAll [ttk::button $fmeBtn.btnFindAll -text [::msgcat::mc "Find All"] \
			-command [list [self object] find_all]]
		set btnReplaceAll [ttk::button $fmeBtn.btnReplaceAll -text [::msgcat::mc "Replace All"] \
			-command [list [self object] replace_all]]
		
		set btnClose [ttk::button $fmeBtn.btnExit \
			-default active \
			-text [::msgcat::mc "Close"] \
			-command [list [self object] close close] \
		]
		
		pack $btnNext $btnPrev $btnFindAll $btnReplace $btnReplaceAll $btnClose -side top -padx 5 -pady 5 -fill x
			
		bind $txtFind <Key-Return> [list $btnNext invoke]
		bind $txtFind <Key-KP_Enter> [list $btnNext invoke]
		
		grid $lblFind $txtFind -sticky "we" -padx 5 -pady 5
		grid $lblReplace $txtReplace -sticky "we" -padx 5 -pady 5
		grid $fmeSwitch -row 2 -column 1 -sticky "news" -padx 5 -pady 5
		grid $txtMsg -row 3 -column 1 -sticky "news" -padx 5 -pady 5
		grid $fmeBtn -row 0 -column 3 -rowspan 4 -sticky "news" -padx 5 -pady 5

	}
	
	method find {{back 0}} {
		my variable Priv opts
		
		if {$opts(-findText) == ""} {return}
		set editor $Priv(editor) 
		
		set start "insert"
		
		if {$Priv(result) != ""} {
			set start "insert + 1 chars"
			if {$back} {set start "insert -1 chars"}
		}
		
		set Priv(result) [$editor search $opts(-findText) \
			-backwards $back \
			-regexp $opts(-regexp) \
			-nocase  $opts(-nocase) \
			-nolinestop $opts(-nolinestop) \
			-all 0 \
			-start $start]
			
		if {$Priv(result) == ""} {
			set opts(-msg) [::msgcat::mc "The pattern was not found."]
			after 3000 [list catch [list set [self namespace]::opts(-msg) ""]]
		}
		
	}
	
	method find_all {} {
		my variable Priv opts
		
		if {$opts(-findText) == ""} {
			[$Priv(editor) cget -wtext] tag remove FIND_ALL 1.0 end
			[$Priv(editor) cget -wtext] tag remove FIND 1.0 end
			return
		}
		set editor $Priv(editor) 
				
		set cut [$editor search $opts(-findText) \
			-backwards 0 \
			-regexp $opts(-regexp) \
			-nocase  $opts(-nocase) \
			-nolinestop $opts(-nolinestop) \
			-all 1 \
			-start "1.0"
		]		
		set opts(-msg) [::msgcat::mc "'%s' occurrence(s) were found." $cut]
		after 3000 [list catch [list set [self namespace]::opts(-msg) ""]]
	}
	
	method replace {} {
		my variable Priv opts
		
		set editor $Priv(editor)
		set wtext [$editor cget -wtext]
		
		clipboard clear
		clipboard append $opts(-replaceText)
		lassign [$wtext tag ranges FIND] idx1 idx2
		if {$idx1 != ""} {
			$editor selection set $idx1 $idx2
			$editor paste
		}
		
		return
	}
	
	method replace_all {} {
		my variable Priv opts
		
		if {$opts(-findText) == ""} {return}
		set editor $Priv(editor) 
				
		set cut [$editor search $opts(-findText) \
			-all 1 \
			-replace $opts(-replaceText) \
			-nolinestop $opts(-nolinestop) \
			-nocase  $opts(-nocase) \
			-regexp $opts(-regexp) \
			-backwards 0 \
			-start 1.0 \
		]		
		set opts(-msg) [::msgcat::mc "'%s' occurrence(s) were replaced." $cut]
		after 3000 [list catch [list set [self namespace]::opts(-msg) ""]]
	}
}



oo::define $::twidget::Priv(prefix)::editor export \
	YScroll  ButtonL_Release Focus_In \
	Key_Press Key_Release Selection_Change Content_Change \
	Visibility Menu_Popup
