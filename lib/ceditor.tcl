
package provide dApp::ceditor 1.0

package require twidget::hook
package require twidget::ibox

::oo::class create ::dApp::ceditor {
	constructor {wpath {fpath ""} {enc "utf-8"} {fmt "lf"}} {
		# SYNOPSIS : 
		my variable Priv
		
		array set Priv [list]
		
		set Priv(obj,hook) [::twidget::hook new]
		set Priv(obj,ibox) [::twidget::ibox new]
		
		set Priv(obj,hook,share) 0
		set Priv(obj,ibox,share) 0 

		set Priv(timer,id) "" 
		set Priv(timer,interval) 2000

		my Ui_Init $wpath
		
		set Priv(opts,fileformat) $fmt
		set Priv(opts,enc) $enc
		my linebox_update
		if {[file exists $fpath]} {my open $fpath $enc}
	}

	destructor {
		my variable Priv

		foreach {tag} [bind $Priv(win,linebox)] {bind $Priv(win,linebox) $tag {}}
		foreach {tag} [bind $Priv(win,text)] {bind $Priv(win,text) $tag {}}
		destroy $Priv(win,frame)
		
		after cancel $Priv(timer,id)
		
		if {$Priv(obj,hook,share) == 0} {$Priv(obj,hook) destroy}
		if {$Priv(obj,ibox,share) == 0} {$Priv(obj,ibox) destroy}
		
		
		array unset Priv
	}
	
	# synhook_content
	method content_change {type key} {}	
	method cursor_change {pos} {}
	method highlight {idx1 idx2} {}
	method hintbox_cb {} {}	
	method key_press {key} {}
	method key_release {key} {}
	method make_outline_menu {m} {}	
	method outline {} {}

			
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
		
		if {$opt == "-comment"} {return $Priv(opts,comment)}
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
				if {![file exists $Priv(opts,file)]} {continue}
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
				
				my highlight_start $idx1 $idx2
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
	

	
	method comment_add {} {
		my variable Priv
		
		set wtext $Priv(win,text)
		set comment $Priv(opts,comment)
		
		set sel [$wtext tag range sel]
		if {$sel == ""} {
			$wtext insert "insert linestart" $comment
			return
		}
		
		lassign $sel sIdx eIdx
		set data $comment[$wtext get "$sIdx linestart" "$eIdx linestart"]
		regsub -all "\n" $data "\n$comment" data
		
		$wtext replace "$sIdx linestart" "$eIdx linestart" $data
		$wtext tag add sel "$sIdx linestart"  "$eIdx lineend"
		focus $wtext	
		
		my highlight_start  [$wtext index "$sIdx linestart"] [$wtext index "$eIdx lineend"]	
	}
	
	method comment_delete {} {
		my variable Priv
		set wtext $Priv(win,text)
		
		set comment $Priv(opts,comment)
		set commentLen [string length $comment]
		set sel [$wtext tag range sel]
		if {$sel == ""} {set sel [list insert insert]}
		
		lassign $sel sIdx eIdx
		set sIdx "$sIdx linestart"
		set eIdx "$eIdx lineend"			
	
		set data2 ""
		foreach item [split [$wtext get $sIdx $eIdx] "\n"] {
			set first [string first $comment $item]
	
			if {$first >= 0} {
				append data2 [string replace $item $first [expr $first + $commentLen -1] ""] "\n"
			} else {
				append data2 $item "\n"
			}
		}
	
		$wtext replace $sIdx $eIdx [string range $data2 0 end-1]
		$wtext tag add sel "$sIdx linestart"  "$eIdx lineend"
		focus $wtext
		
		my highlight_start [$wtext index "$sIdx linestart"] [$wtext index "$eIdx lineend"]					
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
			my cursor_change $pos
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
		
		my cursor_change $pos
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
		$wtext mark set insert $idx
		$wtext see $idx
		
		my linebox_update
		my cursor_update
		
		return
	}
	
	method goto_dialog {} {
		set dlg [::twidget::editor::gotobox new [my cget -frame].goto [self object]]
		$dlg show
		$dlg destroy	
	}

	method highlight_start {idx1 idx2} {
		if {$::dApp::Param(syntaxHighlight) == 0} {return}
		my highlight $idx1 $idx2
	}


	
	method hintbox_clear {} {
		my variable Priv
		
		set tree $Priv(hintbox,tree)
		$tree item delete 0 end
		array unset Priv itbl,*
	}	
	
	method hintbox_dclick {x y} {
		my variable Priv
	
		set tree $Priv(hintbox,tree)
		
		set ninfo [$tree identify $x $y]
		if {[llength $ninfo] != 6} {return}
		foreach {what item where column type name} $ninfo {}
		if {$what != "item"} {return}
		
		my hintbox_cb [$tree item element cget $item 0 txt -data]
		my hintbox_hide
		after idle [list focus $Priv(win,text)]

	}	
	
	method hintbox_enter {} {
		my variable Priv
		
		set wtext $Priv(win,text)

		set tree $Priv(hintbox,tree)

		set item [$tree selection get]
		set val [$tree item element cget $item 0 txt -data]
	
		$Priv(win,text) insert insert $val
		my hintbox_hide
		after idle [list focus $Priv(win,text)]
	}
	
	method hintbox_hide {} {
		my variable Priv
		
		set wtext $Priv(win,text)
		place forget $Priv(hintbox,frame)
		set Priv(hintbox,show) 0
	
	}	
	
	method hintbox_init {} {
		my variable Priv
		set wtext $Priv(win,text)
		
		set fme [ttk::frame $wtext.lintbox -relief solid -borderwidth 1]
		set tree [treectrl $fme.tree \
			-showroot no \
			-selectmod single \
			-showrootbutton no \
			-showbuttons no \
			-showheader no \
			-showlines yes \
			-scrollmargin 16 \
			-xscrolldelay "500 50" \
			-yscrolldelay "500 50" \
			-highlightthickness 1 \
			-font $::dApp::Font(small) \
			-relief solid \
			-height 1 \
			-bd 0]
		$tree column create -tag col -expand yes
		$tree element create img image 
		$tree element create txt text -fill [list black {selected focus}] -justify left
		$tree element create rect rect -showfocus yes -fill [list "#a0a0a0" {selected}]
		
		$tree style create style
		$tree style elements style {rect img txt}
		$tree style layout style img -padx 4 -expand ns
		$tree style layout style txt -iexpand nes -sticky "w" -ipady 2
		$tree style layout style rect -union {txt} -iexpand news -ipadx 2  -padx 3 -pady 1
		
		set item [$tree item create -button no]
		$tree item style set $item 0 style
		$tree item lastchild 0 $item
		$tree item element configure $item 0 txt -text "-text"
		$tree item element configure $item 0 txt -text "-anchor"
		$tree item collapse $item	

		set Priv(hintbox,frame) $fme
		set Priv(hintbox,tree) $tree
		set Priv(hintbox,show) 0
		set Priv(hintbox,anchor) 0
		set Priv(hintbox,prevcmd) ""	
		set Priv(hintbox,width) 200
		set Priv(hintbox,height) 140		
		
		set vs [ttk::scrollbar $fme.vs -command [list $tree yview] -orient vertical]
		set hs [ttk::scrollbar $fme.hs -command [list $tree xview] -orient horizontal]
		$tree configure -xscrollcommand [list $hs set] -yscrollcommand [list $vs set]
		
		::autoscroll::autoscroll $vs
		::autoscroll::autoscroll $hs	
		
		grid $tree $vs -sticky "news"
		grid $hs - -sticky "we"
		grid rowconfigure $fme 0 -weight 1
		grid columnconfigure $fme 0 -weight 1	
		
		bind $tree <<ButtonLDClick>> [list [self object] hintbox_dclick  %x %y]
		bind $tree <Key-Escape> [list [self object] hintbox_hide]
		after idle [list focus $wtext]
		bind $tree <Key-space> [list [self object] hintbox_enter]
		bind $tree <Return> [list [self object] hintbox_enter]
		bind $tree <Key-Tab> [list [self object] hintbox_enter]
		
		bindtags $tree [list $tree TreeCtrl]
		
		return $fme
			
	}

	method hintbox_select {{key ""}} {
		my variable Priv
	
		set wtext $Priv(win,text)
		set hintbox $Priv(hintbox,frame)
		set tree $Priv(hintbox,tree)
		
		if {$Priv(hintbox,show) == 0} {return ""}
		
		lassign [$wtext dlineinfo insert] x y w h b
		if {$x == "" || $y == "" || $w == "" || $h == ""} {return ""}
		
		set data [$wtext get "insert linestart" insert]
		set tab [string repeat " " [my cget -tabwidth]]
		regsub {\t} $data $tab data
		set f [$wtext cget -font]
		set x [font measure $f $data]
		incr y $h
		if {$x + $Priv(hintbox,width) > [winfo width $wtext]} {
			incr x -$Priv(hintbox,width)
		}
		if {$y + $Priv(hintbox,height) > [winfo height $wtext]} {
			incr y -$Priv(hintbox,height)
			incr y -20
		}		
		
		if {$key == ""} {
			if {[set sel [$tree selection get]] == ""} {return ""}
			return [$tree item element cget $sel 0 txt -data]
		}
	
		
		set flag 0
		foreach {name} [lsort [array names Priv itbl,${key}*]] {
			$tree selection modify $Priv($name) all
			$tree see $Priv($name)
			set flag 1
			break
		}
		if {$flag == 1} {
			place configure $Priv(hintbox,frame) \
				-width $Priv(hintbox,width) \
				-height $Priv(hintbox,height) -x $x -y $y
			set Priv(hintbox,anchor) [$wtext index insert]
		} else {
			my hintbox_hide
		}
		after idle [list focus $wtext]
	}	
	
	method hintbox_show {values} {
		my variable Priv
		
		if {$::dApp::Param(syntaxHint) == 0} {return}
	
		set wtext $Priv(win,text)
		
		set Priv(hintbox,show) 0

		if {$values == ""} {return}
	
		lassign [$wtext dlineinfo insert] x y w h b
		if {$x == "" || $y == "" || $w == "" || $h == ""} {return}
		set data [$wtext get "insert linestart" insert]
		set tab [string repeat " " [my cget -tabwidth]]
		regsub {\t} $data $tab data
		set f [$wtext cget -font]
		set x [font measure $f $data]
		incr y $h
		if {$x + $Priv(hintbox,width) > [winfo width $wtext]} {
			incr x -$Priv(hintbox,width)
		}
		if {$y + $Priv(hintbox,height) > [winfo height $wtext]} {
			incr y -$Priv(hintbox,height)
			incr y -20
		}		
	
		set hintbox $Priv(hintbox,frame)
		set tree $Priv(hintbox,tree)
	
		$tree item delete 0 end
		array unset Priv itbl,*
	
		foreach val $values {
			set item [$tree item create -button no]
			$tree item style set $item 0 style
			$tree item lastchild 0 $item
			$tree item element configure $item 0 txt -text $val -data $val
			$tree item collapse $item	
			set Priv(itbl,$val) $item
		}		
	
		if {$values != ""} { 
			$tree selection modify [$tree item firstchild 0] all
			$tree see [$tree item firstchild 0]
		}
		
		place configure $hintbox \
			-width $Priv(hintbox,width) \
			-height $Priv(hintbox,height) -x $x -y $y
	
		set Priv(hintbox,show) 1
		
		set Priv(hintbox,anchor) [$wtext index insert]
		
		after idle [list focus $wtext]
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
	
		my highlight_start $idx1 $idx2
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
		my highlight_start $idx1 $idx2
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
		
		set ibox $::dApp::Obj(ibox)
		
		set mlist [$Priv(win,text) tag ranges MARK]			
		set state "normal"
		if {[llength $mlist] == 0} {set state "disabled"}
	
		$m add command -compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Toggle Mark"] \
			-command [list [self object] mark toggle]	
		
		$m add command -compound left \
			-state $state \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Previous Mark"] \
			-command [list [self object] mark prev]
			
		$m add command -compound left \
			-state $state \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Next Mark"] \
			-command [list [self object] mark next]		
		
		$m add separator	
		
		foreach {sIdx eIdx} $mlist {
			$m add command -compound left \
				-image [$ibox get empty] \
				-label [format L:%d [expr int($sIdx)]] \
				-command [list [self object] goto $sIdx]
		}
		if {[llength $mlist] > 0} {	$m add separator }
		
		$m add command -compound left \
			-state $state \
			-image [$ibox get empty] \
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
			-image [$ibox get empty] \
			-accelerator "Ctrl+x" \
			-command [list [self object] cut]
	
		$m add command -compound left -state $state \
			-label [::msgcat::mc "Copy"] \
			-image [$ibox get empty] \
			-accelerator "Ctrl+c" \
			-command [list [self object] copy]
		
		set state2 "normal"
		if {[catch {clipboard get}]} {set state2 disabled}
	
		$m add command -compound left -state $state2 \
			-label [::msgcat::mc "Paste"] \
			-image [$ibox get empty] \
			-accelerator "Ctrl+v" \
			-command [list [self object] paste]
			
		$m add command -compound left -state $state \
			-label [::msgcat::mc "Delete"] \
			-image [$ibox get empty] \
			-accelerator "Delete" \
			-command [list [self object] delete]
		
		$m add command -compound left \
			-label [::msgcat::mc "Select All"]	\
			-image [$ibox get empty]\
			-accelerator "Ctrl+a" \
			-command [list [self object] selection set 1.0 end]
			
		
		set mlops [menu $m.lops -tearoff 0]
		set Priv(edit,menu,lops) $mlops	
		
		$m add cascade -compound left \
			-label [::msgcat::mc "Line Operations"] \
			-image [$ibox get empty] \
			-menu $mlops
		
		$mlops add command -compound left \
			-accelerator "Ctrl+k" \
			-label [::msgcat::mc "Cut Current Line"]	\
			-image [$ibox get empty] \
			-command [list [self object] cut_line]
			
		$mlops add command -compound left \
			-accelerator "Ctrl+y" \
			-label [::msgcat::mc "Copy Current Line"]	\
			-image [$ibox get empty] \
			-command [list [self object] copy_line]
		
		$mlops add command -compound left \
			-accelerator "Ctrl+p" \
			-label [::msgcat::mc "Paste As New Line"]	\
			-image [$ibox get empty] \
			-command [list [self object] paste_line]
	
		$mlops add command -compound left \
			-accelerator "Ctrl+j" \
			-label [::msgcat::mc "Move Down Current Line"]	\
			-image [$ibox get empty]\
			-command [list [self object] move_down]
		
		$mlops add command -compound left \
			-accelerator "Ctrl+i" \
			-label [::msgcat::mc "Move Up Current Line"]	\
			-image [$ibox get empty] \
			-command [list [self object] move_up]
		
		$mlops add separator	

		$mlops add command -compound left \
			-label [::msgcat::mc "Trim Trailing Space"]	\
			-image [$ibox get empty] \
			-command [list [self object] trim_space]		
			
		$m add separator	
				
		set mMarks [menu $m.marks -tearoff 0]
		$m add cascade -compound left \
			-label [::msgcat::mc "Marks"] \
			-image  [$ibox get empty] \
			-menu $mMarks
				
		set state "normal"
		if {[my mark_list] == ""} {set state "disabled"}
		$mMarks add command -compound left \
			-accelerator "F9" \
			-label [::msgcat::mc "Toggle Mark"]	\
			-image [$ibox get empty] \
			-command [list [self object] mark_toggle]
			
		$mMarks add command -compound left \
			-state $state \
			-image [$ibox get empty] \
			-accelerator "Shift+F9" \
			-label [::msgcat::mc "Previous Mark"] \
			-command [list [self object] mark_prev]
			
		$mMarks add command -compound left \
			-state $state \
			-image [$ibox get empty] \
			-accelerator "Ctrl+F9" \
			-label [::msgcat::mc "Next Mark"] \
			-command [list [self object] mark_next]
			
		$mMarks add separator
		
		$mMarks add command -compound left \
			-state $state \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Clear All Marks"] \
			-command [list [self object] mark_clear]				
			
		$m add separator
		
		$m add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Ctrl+g" \
			-label [::msgcat::mc "Goto Line..."] \
			-command [list [self object] goto_dialog]
			
		$m add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Ctrl+f" \
			-label [::msgcat::mc "Find/Replace"] \
			-command [list [self object] search_dialog]	
			
		set state "disabled"
		if {[$wtext tag ranges BRACKET] != ""} {set state "normal"}
		
		$m add command -compound left \
			-state $state \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Jump to Matching Brace"] \
			-command [list [self object] bracket_find]
			
		$m add command -compound left \
			-state $state \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Select to Matching Brace"] \
			-command [list [self object] bracket_select]					
		

		$m add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Ctrl+Period" \
			-label [::msgcat::mc "Increase Line Indent"] \
			-command [list [self object] indent_add]
			
		$m add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Ctrl+Comma" \
			-label [::msgcat::mc "Decrease Line Indent"] \
			-command [list [self object] indent_delete]

		if {$Priv(opts,comment) != ""} {
			$m add separator
		
			$m add command -compound left \
				-label [::msgcat::mc "Add Block Comment"] \
				-image [$ibox get empty] \
				-command [list [self object] comment_add]
		
			$m add command -compound left \
				-label [::msgcat::mc "Remove Block Comment"] \
				-image [$ibox get empty] \
				-command  [list [self object] comment_delete]
		}
		
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
		
		my highlight_start $idx1 $idx2
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
		
		my highlight_start $idx1 $idx2
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
		
		set idx1 [$wtext index "@0,0"]
		set idx2 [$wtext index "@[winfo width $wtext],[winfo height $wtext]"]
		
		my highlight_start $idx1 $idx2				
		
		my linebox_update
		my cursor_update
		
		after cancel $Priv(timer,id)
		my outline_start
	}	
	
	method outline_start {} {
		if {$::dApp::Param(codeOutline) == 0} {return}
		$::dApp::Obj(cbs) clear
		my outline
		if {$::dApp::Param(sortSymbol)} {$::dApp::Obj(cbs) sort}
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
		
		my highlight_start $idx1 $idx2
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
		
		my highlight_start $idx1 $idx2
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
	   
		if {$filepath == ""} {return [my save_as]}
		
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
		set dlg [::twidget::editor::searchbox new .editor_find [self object] local]
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

		my highlight_start $idx1 $idx2
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
		
		my highlight_start $idx1 $idx2
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

		set key $Priv(opts,key)
		my content_change $type $key
		set sIdx "insert linestart"
		set eIdx "insert"
		if {$key == "Return" || $key == "KP_Enter"} { set sIdx "insert -1 lines linestart" }

		my highlight_start $sIdx $eIdx
		
		after cancel $Priv(timer,id)
		set Priv(timer,id) [after $Priv(timer,interval) [list catch [list [self object] outline_start]]]

		$Priv(obj,hook) invoke <Content> $type $Priv(opts,key)
		
		$wtext edit modified 0
		bind $wtext <<Modified>> [list [self object] Content_Change]
	}	
	
	method Focus_In {} {
		my variable Priv
		set wtext $Priv(win,text)
	
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
		my key_press $key
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
		my key_release $key
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
		bind $wtext <<Goto>> 				[list [self object] goto_dialog]

		bind $wtext <<SelectAll>> [list [self object] selection set 1.0 end]
		bind $wtext <<Copy>> 		[list [self object] copy]
		bind $wtext <<Cut>> 		[list [self object] cut]
		bind $wtext <<Paste>> 	[list [self object] paste]
		bind $wtext <<CutLine>> 		[list [self object] cut_line]
		#bind $wtext <<CopyLine>> 		[list [self object] copy_line]
		bind $wtext <<PasteLine>> 		[list [self object] paste_line]
		
		bind $wtext <Control-y> 		[list [self object] copy_line]
		
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

		bind $wtext <Unmap> [format {
			set tid %s::Priv(timer,id)
			after cancel [set $tid]
			$::dApp::Obj(cbs) clear
		} [self namespace]]
	
		bind $wtext <Destroy> [format {
			set tid %s::Priv(timer,id)
			after cancel [set $tid]
			$::dApp::Obj(cbs) clear
		} [self namespace]]

		bindtags $linebox [list $linebox]
		bindtags $wtext [list $wtext Text . all]
		
		set Priv(win,frame) $fme
		set Priv(win,linebox) $linebox
		set Priv(win,text)		$wtext
		set Priv(win,hs) $hs
		set Priv(win,vs) $vs	  	
			
		array set Priv [list \
			opts,enc "utf-8" \
			opts,file "" \
			opts,fileformat "lf" \
			opts,data "" \
			opts,mtime 0 \
			opts,enc "utf-8" \
			opts,tabwidth 5 \
			opts,modified 0 \
			opts,sel "" \
			opts,key "" \
			opts,lines 0 \
			opts,pos 1.0 \
			opts,linebox 1 \
			opts,yscrollnest 0 \
			opts,comment "" \
		]

		my configure -tabwidth $Priv(opts,tabwidth)

		my hintbox_init

		return $wtext
	}	

	method Visibility {} {
		variable Priv
		set wtext $Priv(win,text)

		bind $wtext <Visibility> {}
		focus $wtext
		my Selection_Change
		bind $wtext <Visibility> [list [self object] Visibility]
		after cancel $Priv(timer,id)
		my outline_start

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
		
		my highlight_start $idx1 $idx2
		$Priv(obj,hook) invoke <YScroll> $idx1 $idx2
		incr Priv(opts,yscrollnest) -1
		my mark_refresh
	}
}

oo::define ::dApp::ceditor export \
	YScroll  ButtonL_Release Focus_In \
	Key_Press Key_Release Selection_Change Content_Change \
	Visibility Menu_Popup
