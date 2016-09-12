oo::class create ::dApp::ceditor::tcl {
	superclass ::dApp::ceditor
	constructor {wpath {filepath ""} {enc "utf-8"}} {
		my variable Priv

		next $wpath

		array set colorTbl [list \
			TCLCMD "#804040" \
			TCLARG "#6a5acd" \
			TCLOPT "#6a5acd" \
			TKCMD "#2E8B57" \
			TKARG "#6a5acd" \
			TKOPT "#6a5acd" \
			DIGIT "Red" \
			VARIABLE "#008080" \
			COMMENT "#0000ff" \
			STRING "#ff00ff" ]

		set Priv(taglist) [list TCLARG TKARG TCLOPT TKOPT TCLCMD  TKCMD  DIGIT  VARIABLE  STRING COMMENT]

		set wtext $Priv(win,text)
		foreach {tag} $Priv(taglist) {
			$wtext tag configure $tag -foreground $colorTbl($tag)
			$wtext tag raise $tag
		}

		set Priv(opts,comment) "#"

		if {[file exists $filepath]} {my open $filepath $enc}
	}
	destructor {
		next
	}

	method content_change {type key} {
		my variable Priv

		set wtext $Priv(win,text)

		if {$key == "Return" || $key == "KP_Enter"} {
			set currIdx [$wtext index insert]
			lassign [split $currIdx "."] line char
			incr line -1
			set data [$wtext get $line.0 "$line.0 lineend"]
			set pad ""
			regexp {^\s+} $data pad
			if {[string index [string trimright $data] end] == "\{"} { set pad "\t$pad"}
			$wtext insert insert $pad
			set currIdx $line.0
			my hintbox_hide
			return
		}

		if {$key == "braceright"} {
			set data [$wtext get "insert linestart" "insert lineend"]
			if {[string trim $data] == "\}"} {
				set tabwidth [$::dApp::Obj(nbe) editor cget -tabwidth]
				set sp [string repeat " " $tabwidth]
				regsub {\t} $data $sp data
				regsub $sp $data "" data
				$wtext replace "insert linestart" "insert lineend" $data
			}
			return
		}

		lassign [split [$wtext index "insert"] "."] sline char
		for {set i [expr $sline - 1]} {$i >= 1} {incr i -1} {
			if {[$wtext get "$i.0 lineend - 1 chars"] != "\\"} {
				set idx1 [expr $i + 1].0
				break
			}
		}

		if {$key == "Tab"} {
			set idx1 "insert -2 chars wordstart"
			set idx2 "insert"
			if {[$wtext get "$idx1 -1 char"] == "-"} {set idx1 "$idx1 -1 char"}
			# lasttok
#			if {[$wtext get "$idx1 -1 char"] == ":" && [$wtext get "$idx1 -2 char"] == ":"} {set idx1 "$idx1 -2 char"}

			if {[string trim [$wtext get "insert -2 chars"]] == ""} {set idx1 "insert -1 chars"}

			set val [my hintbox_select]
			if {$val != ""} {$wtext replace $idx1 $idx2 [subst $val]}
			my hintbox_hide
			return
		}

		if {$i <= 0} {set idx1 1.0}

		set data [$wtext get $idx1 insert]

		lassign [my lastcmd data $idx1] lastcmd lasttok cIdx

		set lastarg $lastcmd
		set lasttype ""
		set arglist [list]
		if {$cIdx != ""} {
			set tags [$wtext tag names $cIdx]
			if {[string first "TKCMD" $tags] >= 0 || [string first "TCLCMD" $tags] >= 0} {
				set lasttype "TCLCMD"
				if {[string first "TKCMD" $tags] >= 0} {set lasttype "TKCMD"}
				set data [$wtext get $cIdx insert]
				lassign [my gettok data 0] tok i1 i2
				lassign [my gettok data [incr i2]] tok i1 i2
				

				while {$tok == "TOK"} {
					set tags [$wtext tag names "$cIdx + $i1 chars + 1 chars"]
					if {[string first "TKARG" $tags] >= 0 || [string first "TCLARG" $tags] >= 0} {
						set lastarg [$wtext get "$cIdx + $i1 chars" "$cIdx + $i2 chars + 1 chars"]
						lappend arglist $lastarg
					}
					lassign [my gettok data [incr i2]] tok i1 i2

				}
			}
		}


		if {$lastcmd == ""} {
			my hintbox_hide
			return
		}

		set values [list]

		set lastcmd [string trimleft $lastcmd ":"]
		set w [namespace tail $lastarg]
		#if {$lasttype == "TCLCMD"} {set w [namespace tail $lastarg]}
		if {[string index $w 0] == "-"} {set w [namespace tail $lastcmd]}		
		if {$key == "minus" && [info exists ::tcltk::syndb($lastcmd,$w,arglist)]} {
			foreach val $::tcltk::syndb($lastcmd,$w,arglist) {
				if {[string index $val 0] != "-" && [string index $val 0] != "\["} {continue}
				lappend values $val
			}
#			if {[llength $values] == 0} {
#				foreach val $::tcltk::syndb($lastcmd,[namespace tail $lastcmd],arglist) {
#					if {[string index $val 0] != "-" && [string index $val 0] != "\["} {continue}
#					lappend values $val
#				}				
#			}
			my hintbox_show $values
			return
		}

		if {$key == "space"} {

			if {![info exists ::tcltk::syndb($lastcmd,$w,type)]} {
				my hintbox_hide
				return
			}

			set tags [$wtext tag names "insert -2 chars wordstart"]
			set w [$wtext get "insert -2 chars wordstart" "insert -2 chars wordend"]

			if {$::dApp::Param(syntaxHint)} {
				
				set arglist [linsert $arglist 0 [namespace tail $lastcmd]]
				set hint ""

				foreach arg $arglist {
					if {[info exists ::tcltk::syndb($lastcmd,$arg,hint)] && $::tcltk::syndb($lastcmd,$arg,hint) != ""} {
						set hint $::tcltk::syndb($lastcmd,$arg,hint)
					}
				}
				if {$hint != ""} {$::dApp::Obj(sbar) put $hint 20000}
			}

			set values [list]
			set arglist [list]
			if {[info exists ::tcltk::syndb($lastcmd,$w,type)]} {
				set arglist $::tcltk::syndb($lastcmd,$w,arglist)
			}
			if {[info exists ::tcltk::syndb($lastcmd,-$w,type)]} {
				set arglist $::tcltk::syndb($lastcmd,-$w,arglist)
			}

			foreach val $arglist {
				if {[string index $val 0] == "-"} {continue}
				lappend values $val
			}

			if {[llength $values]} {
				my hintbox_show $values
			} else {
				my hintbox_hide
			}

			return
		}

		set sel [$wtext get "insert -1 chars wordstart" "insert -1 chars wordend"]
		if {[$wtext get "insert -1 chars wordstart -1 char"] == "-"} {set sel "-$sel"}

		my hintbox_select $sel
	}

	method cursor_change {pos} {
		my variable Priv
		if {int($Priv(hintbox,anchor)) != int($pos)} {my hintbox_hide}

	}

	method highlight {sIdx eIdx} {
		my variable Priv

		set wtext $Priv(win,text)

		lassign [split [$wtext index $sIdx] "."] sline char
		for {set i [expr $sline - 1]} {$i >= 1} {incr i -1} {
			if {[$wtext get "$i.0 lineend - 1 chars"] != "\\"} {
				set sIdx [expr $i + 1].0
				break
			}
		}
		if {$i <= 0} {set sIdx 1.0}

		lassign [split [$wtext index $eIdx] "."] sline char
		lassign [split [$wtext index end] "."] eline char
		for {set i $sline} {$i < $eline} {incr i} {
			if {[$wtext get "$i.0 lineend - 1 chars"] != "\\"} {
				set eIdx "$i.0 lineend"
				break
			}
		}
		if {$i >= $eline} {set eIdx "$i.0 lineend"}

		set data [$wtext get $sIdx $eIdx]

		set lastcmd [my highlight_keyword data $sIdx]

		foreach item [regexp -indices -all -inline -- $::tcltk::syndb(re,tclvar) $data] {
			lassign $item i1 i2
			if {$i1 == -1} {continue}
			$wtext tag add "VARIABLE" "$sIdx + $i1 chars" "$sIdx + $i2 chars + 1 chars"
		}

		return $lastcmd
	}

	method highlight_keyword {varName anchor {startIdx 0}} {
		my variable Priv

#		if {$Priv(param,syntaxHighlight) == 0} {return}

		set wtext $Priv(win,text)

		upvar $varName data

		lassign [my gettok data $startIdx] type idx1 idx2

		set currCMD ""
		set state "CMD"

		while {$type != "EOF"} {

			if {$type == "EOS"} {
				set state "CMD"
				set currCMD ""
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}

			set sIdx [$wtext index "$anchor + $idx1 chars"]
			set eIdx  [$wtext index "$anchor + $idx2 chars + 1 chars"]
			set ch1 [string index $data $idx1]
			set ch2 [string index $data $idx2]
			set len [expr $idx2 - $idx1 -1]
			set w [string range $data $idx1 $idx2]

			foreach tag $Priv(taglist) {$wtext tag remove $tag $sIdx $eIdx}

			if {$ch1 == "\""} {
				set i1 0
				set i2 0
				while {1} {
					set ch3 [string index $w [incr i2]]
					if {$ch3 == "" || $ch3 == "\""} {break}
					if {$ch3 == "\\"} {incr i2}
				}
				$wtext tag add "STRING"  [$wtext index "$sIdx + $i1 chars"] [$wtext index "$sIdx + [incr i2] chars" ]
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}

			if {$ch1 == "#" && $state == "CMD"} {
				 while {1} {
				 	set ch3 [string index $data [incr idx2]]
				 	if {$ch3 == "\n" || $ch3 == "\r" || $ch3 == ""} {break}
			 	}
				$wtext tag add "COMMENT" $sIdx "$anchor + $idx2 chars"

				set currCMD ""
				set state "CMD"
				lassign [my gettok data $idx2] type idx1 idx2
				continue
		}

			if {$state == "CMD"} {
				if {$len < 30} {
					set w2 [string trimleft $w ":"]
					set w3 [namespace tail $w2]
					if {[info exists ::tcltk::syndb($w,$w,hint)] || [info exists ::tcltk::syndb($w2,$w3,hint)]} {
						set currCMD $w2
						$wtext tag add $::tcltk::syndb($w2,$w3,type) $sIdx $eIdx
						lassign [my gettok data [incr idx2]] type idx1 idx2
						set state "ARG"
						continue
					}
				}
				set state "ARG"
			} else {
				if {$len < 30} {
					if { [info exists ::tcltk::syndb($currCMD,$w,hint)]} {
						$wtext tag add $::tcltk::syndb($currCMD,$w,type) $sIdx $eIdx
						lassign [my gettok data [incr idx2]] type idx1 idx2
						continue
					}
					if {$w == "else" || $w == "elseif" || $w == "then" || $w == "on" || $w == "trap" || $w == "finally"} {
						$wtext tag add "TCLCMD" $sIdx $eIdx
						lassign [my gettok data [incr idx2]] type idx1 idx2
						continue
					}
					set w2 [namespace tail $currCMD]
					if {[info exists ::tcltk::syndb($currCMD,$w2,colorlist)] && [lsearch $::tcltk::syndb($currCMD,$w2,colorlist) $w] >=0} {
						$wtext tag add $::tcltk::syndb($currCMD,$w2,colortype) $sIdx $eIdx
						lassign [my gettok data [incr idx2]] type idx1 idx2
						continue						
					}				
				}
			}

			if {[string is double $w] && [string tolower $w] != "inf"} {
				$wtext tag add "DIGIT" $sIdx $eIdx
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}

			set i1 [string first "\{" $w]
			if {$i1 == 0 || ($i1== 1 && [string index $w 0] == "+")} {
				set i2 $i1
				set nest 1
				while {1} {
					set ch3 [string index $w [incr i2]]
					if {$ch3 == ""} {break}
					if {$ch3 == "\\"} {incr i2 ; continue }
					if {$ch3 == "\}"} {incr nest -1}
					if {$ch3 == "\{"} {incr nest}
					if {$nest == 0} {break}
				}

				if {$nest == 0} {incr i2 -1}

				set data2 [string range $w [incr i1] $i2]
				if {$data2 != ""} {
					set ret [my highlight_keyword  data2 [$wtext index "$sIdx + $i1 chars"]]
					if {$nest != 0} {set currCMD $ret}
				}
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}

			set i1 [string first "\[" $w]
			if {$i1 >=0 } {
				set i2 $i1
				set nest 1
				while {1} {
					set ch3 [string index $w [incr i2]]
					if {$ch3 == ""} {break}
					if {$ch3 == "\\"} {incr i2 ; continue }
					if {$ch3 == "\]"} {incr nest -1}
					if {$ch3 == "\["} {incr nest}
					if {$nest == 0} {break}
				}

				if {$nest == 0} {incr i2 -1}
				set data2 [string range $w [incr i1] $i2]
				if {$data2 != ""} {
					set ret [my highlight_keyword data2 [$wtext index "$sIdx + $i1 chars"]]
					if {$nest != 0} {set currCMD $ret}
				}
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}
			lassign [my gettok data [incr idx2]] type idx1 idx2
		}

		return $currCMD

	}

	method hintbox_cb {val} {
		my variable Priv

		set wtext $Priv(win,text)
		set idx1 "insert -1 chars wordstart"
		set idx2 "insert -1  chars wordend"
		if {[$wtext get "$idx1 -1 char"] == "-"} {set idx1 "$idx1 -1 char"}
		if {[string trim [$wtext get "insert -1 chars"]] == ""} {set idx1 "insert "}

		if {$val != ""} {
			$wtext replace $idx1 $idx2 [subst $val]
		}
	}

	method make_outline_menu {m} {
		variable Priv
		set ibox $::dApp::Obj(ibox)

		$m add command \
			-compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Highlight"] \
			-command [list [self object] select_range]

		$m add command \
			-compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "First Line"] \
			-command [list [self object] select_first]

		$m add command \
			-compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Last Line"] \
			-command [list [self object] select_last]

		return 3
	}

	method key_press {key} {	}
	method key_release {key} {	}

	method lastcmd { varName anchor {startIdx 0}} {
		my variable Priv

		upvar $varName data
		set wtext $Priv(win,text)

		lassign [my gettok data $startIdx] type idx1 idx2

		set currCMD ""
		set currTOK ""
		set state "CMD"
		set cmdIdx1 ""
		set cmdIdx2 ""

		while {$type != "EOF"} {

			if {$type == "EOS"} {
				set state "CMD"
				set currCMD ""
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}

			set sIdx [$wtext index "$anchor + $idx1 chars"]
			set eIdx  [$wtext index "$anchor + $idx2 chars + 1 chars"]
			set ch1 [string index $data $idx1]
			set ch2 [string index $data $idx2]
			set len [expr $idx2 - $idx1 -1]
			set w [string range $data $idx1 $idx2]

			if {$ch1 == "\""} {
				set i1 0
				set i2 0
				while {1} {
					set ch3 [string index $w [incr i2]]
					if {$ch3 == "" || $ch3 == "\""} {break}
					if {$ch3 == "\\"} {incr i2}
				}
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}

			if {$ch1 == "#" && $state == "CMD"} {
				 while {1} {
				 	set ch3 [string index $data [incr idx2]]
				 	if {$ch3 == "\n" || $ch3 == "\r" || $ch3 == ""} {break}
			 	}

				set currCMD ""
				set state "CMD"
				lassign [my gettok data $idx2] type idx1 idx2
				continue
		}

			if {$state == "CMD"} {
				if {$len < 20} {
					set w2 [string trimleft $w ":"]
					set w3 [namespace tail $w2]
					if {[info exists ::tcltk::syndb($w,$w,hint)] || [info exists ::tcltk::syndb($w2,$w3,hint)]} {
						set currCMD $w2
						set cmdIdx1 "$anchor + $idx1 chars"
						lassign [my gettok data [incr idx2]] type idx1 idx2
						set state "ARG"
						continue
					}
					set currTOK $w
				}
				set state "ARG"
			} else {
				if {$len < 20} {
					if { [info exists ::tcltk::syndb($currCMD,$w,hint)]} {
						lassign [my gettok data [incr idx2]] type idx1 idx2
						continue
					}
					if {$w == "else" || $w == "elseif" || $w == "then"} {
						lassign [my gettok data [incr idx2]] type idx1 idx2
						continue
					}
				}
			}

			set i1 [string first "\{" $w]
			if {$i1 == 0 || ($i1== 1 && [string index $w 0] == "+")} {
				set i2 $i1
				set nest 1
				while {1} {
					set ch3 [string index $w [incr i2]]
					if {$ch3 == ""} {break}
					if {$ch3 == "\\"} {incr i2 ; continue }
					if {$ch3 == "\}"} {incr nest -1}
					if {$ch3 == "\{"} {incr nest}
					if {$nest == 0} {break}
				}

				if {$nest == 0} {incr i2 -1}

				set data2 [string range $w [incr i1] $i2]
				if {$data2 != ""} {
					lassign [my lastcmd data2 [$wtext index "$sIdx + $i1 chars"]] ret tmp cidx1
					if {$nest != 0} {
						set currCMD $ret
						set cmdIdx1 $cidx1
						set currTOK $tmp
					}
				}
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}

			set i1 [string first "\[" $w]
			if {$i1 >=0 } {
				set i2 $i1
				set nest 1
				while {1} {
					set ch3 [string index $w [incr i2]]
					if {$ch3 == ""} {break}
					if {$ch3 == "\\"} {incr i2 ; continue }
					if {$ch3 == "\]"} {incr nest -1}
					if {$ch3 == "\["} {incr nest}
					if {$nest == 0} {break}
				}

				if {$nest == 0} {incr i2 -1}
				set data2 [string range $w [incr i1] $i2]
				if {$data2 != ""} {
					lassign [my lastcmd data2 [$wtext index "$sIdx + $i1 chars"]] ret tmp cidx1
					if {$nest != 0} {
						set currCMD $ret
						set cmdIdx1 $cidx1
						set currTOK $tmp
					}
				}
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}

			lassign [my gettok data [incr idx2]] type idx1 idx2
		}

		return [list $currCMD $currTOK $cmdIdx1]

	}

	method outline {} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)
		set wtext $Priv(win,text)
		set cbs $::dApp::Obj(cbs)


		set data [$wtext get 1.0 end]

		set anchor 0
		set cmd ""

		set Priv(symbol,ns,items) [list]
		set Priv(symbol,proc,items) [list]


		lassign [my gettok data $anchor] type idx1 idx2
		while {$type != "EOF"} {
			if {$type == "EOS"} {
				set cmd ""
				lassign [my gettok data [incr idx2]] type idx1 idx2
				continue
			}
			set tok [string range $data  $idx1 $idx2]
			if {$cmd == ""} {
				set cmd $tok
				set cIdx $idx2
			}

			if {[lsearch -exact [list oo::class ::oo::class class] $cmd] >= 0} {
				lassign [my gettok data [incr idx2]] type idx1 idx2
				if {$type == "TOK" && [string range $data $idx1 $idx2] == "create"} {
					set idx2 [my outline_class  [incr idx2] data]
					set cmd ""
				}
				if {$type != "TOK"} {set cmd ""}
			}

			if {[lsearch -exact [list oo::define ::oo::define define] $cmd] >= 0} {
				set idx2 [my outline_class  [incr idx2] data]
				set cmd ""
			}

			if {$cmd == "namespace"} {
				lassign [my gettok data [incr idx2]] type idx1 idx2
				if {$type == "TOK" && [string range $data $idx1 $idx2] == "eval"} {
					set idx2 [my outline_ns [incr idx2] data]
					set cmd ""
				}
				if {$type != "TOK"} {set cmd ""}
			}

			if {$cmd == "proc"} {
				set idx2 [my outline_proc [incr idx2] data]
				set cmd ""
			}

			lassign [my gettok data [incr idx2]] type idx1 idx2
		}

		set tree [$cbs cget -wtree]
		foreach proc $Priv(symbol,proc,items) {
			if {[$tree item parent $proc] != 0} {continue}
			foreach ns $Priv(symbol,ns,items) {
				if {[string first $Priv(symbol,$ns) $Priv(symbol,$proc)] == 0} {
					$tree item lastchild $ns $proc
					set len [string length "$Priv(symbol,$ns)::"]
					$tree item element configure $proc 0 txt -text [string range $Priv(symbol,$proc) $len end]
				}
				if {[$tree item children $ns] != ""} {$tree expand $ns}
			}
		}

		foreach {key val}  [array get Priv symbol,class,*] {
			if {$val == ""} {continue}
			if {[$tree item children $val] != ""} {$tree expand $val}
			if {$::dApp::Param(sortSymbol)} {
				$tree item sort $val -increasing -column 0 -dictionary
			}
		}


		array unset Priv symbol,*
	}

	method outline_class {anchor varName {parent 0}} {
		my variable Priv

		upvar $varName data

		set ibox $::dApp::Obj(ibox)
		set cbs $::dApp::Obj(cbs)
		set wtext $Priv(win,text)
		set editor [self object]

		lassign [my gettok data $anchor] type idx1 idx2
		if {$type == "EOS" || $type == "EOF"} {return $idx2}
		set name [string range $data $idx1 $idx2]

		if {![info exists Priv(symbol,class,$name)]} {
			set parent [$cbs add $parent \
					$name \
					[$ibox get class_close] \
					[$ibox get class_open] \
					[list $editor $wtext "1.0 + $idx2 chars" $name] \
			]
			lappend Priv(symbol,proc,items) $parent
			set Priv(symbol,$parent) $name
			set Priv(symbol,class,$name) $parent
		} else {
			set parent $Priv(symbol,class,$name)
		}

		lassign [my gettok data [incr idx2]] type idx1 idx2
		if {$type == "EOS" || $type == "EOF"} {return $idx2}

		if {[string index $data $idx1] != "\{"} {
			set cmd [string range $data $idx1 $idx2]

			if {[lsearch -exact [list method constructor destructor] $cmd] == -1} {
				set child [$cbs add $parent \
						$cmd \
						[$ibox get method_close] \
						[$ibox get method_open] \
						[list $editor $wtext "1.0 + $idx1 chars" $cmd]]
				lassign [my gettok data [incr idx2]] type idx1 idx2
				while {$type == "TOK"} {
					set arg [string range $data $idx1 $idx2]
					$cbs add $child \
						$arg \
						[$ibox get args_close] \
						[$ibox get args_open] \
						[list $editor $wtext "1.0 + $idx1 chars" $arg]
					lassign [my gettok data [incr idx2]] type idx1 idx2
				}
			}

			if {$cmd == "method" } {
				set idx2 [my outline_method [incr idx2] data $parent]
			}

			if {$cmd == "destructor" } {
				set child [$cbs add $parent \
						$cmd \
						[$ibox get method_close] \
						[$ibox get method_open] \
						[list $editor $wtext "1.0 + $idx1 chars " $cmd]]
				lassign [my gettok data [incr idx2]] type idx1 idx2
			}

			if {$cmd == "constructor"} {
				lassign [my gettok data [incr idx2]] type idx1 idx2

				if {$type == "TOK"} {
					set child [$cbs add $parent \
							$cmd \
							[$ibox get method_close] \
							[$ibox get method_open] \
							[list $editor $wtext "1.0 + $idx1 chars" $cmd]]

					set arglist [string range $data $idx1 $idx2]
					if {[string index $arglist 0] == "\{" && [string index $arglist end] == "\}"} {
						set arglist [string range $arglist 1 end]
						set arglist [string range $arglist 0 end-1]
					}
					#if {[string index $arglist end] == "\}"} {set arglist [string range $arglist 0 end-1]}
					if {$arglist != ""} {
						catch {
							foreach arg $arglist {
								$cbs add $child \
										$arg \
										[$ibox get args_close] \
										[$ibox get args_open] \
										[list $editor $wtext "1.0 + $idx1 chars" $arg]
							}
						}
					}
				}
			}

			return $idx2
		}


		if {[string index $data $idx1] == "\{"} {incr idx1}

		if {[string index $data $idx2] == "\}"} {
			set body [string range $data $idx1 [expr $idx2 -1]]
		} else {
			set body [string range $data $idx1 $idx2]
		}

		lassign [my gettok body 0] type idx3 idx4
		set cmd ""
		set arglist [list]

		while {$type != "EOF"} {
			if {$type == "EOS"} {
				if {$cmd != "" && [string first [string index $cmd 0 ] ";#"] == -1} {

					set child [$cbs add $parent \
							$cmd \
							[$ibox get method_close] \
							[$ibox get method_open] \
							[list $editor $wtext "1.0 + $idx1 chars + $cIdx chars" $cmd] \
					]

					if {[string index $arglist 0] == "\{" && [string index $arglist end] == "\}"} {
						set arglist [string range $arglist 1 end]
					}
					#if {[string index $arglist end] == "\}"} {set arglist [string range $arglist 0 end-1]}
					if {$arglist != ""} {
						catch {
							foreach arg $arglist {
								$cbs add $child \
										$arg \
										[$ibox get args_close] \
										[$ibox get args_open] \
										[list $editor $wtext "1.0 + $idx1 chars + $cIdx chars" $arg]
							}
						}
					}
				}

				set cmd ""
				set arglist [list]
				lassign [my gettok body [incr idx4]] type idx3 idx4
				continue
			}
			set tok [string range $body  $idx3 $idx4]

			if {$cmd != ""} {
				lappend arglist $tok
			} else {
				set cmd $tok
				set cIdx $idx4

				if {$cmd == "method" } {
					set ret [my outline_method [expr $idx1 + $idx4 +1] data $parent]
					set idx4 [expr $ret - $idx1]
					set cmd ""
				}

				if {$cmd == "destructor" } {
					set child [$cbs add $parent \
							$cmd \
							[$ibox get method_close] \
							[$ibox get method_open] \
							[list $editor $wtext "1.0 + $idx1 chars + $idx4 chars" $cmd]]
					lassign [my gettok body [incr idx4]] type idx3 idx4
					set cmd ""
				}

				if {$cmd == "constructor"} {
					lassign [my gettok body [incr idx4]] type idx3 idx4

					if {$type == "TOK"} {
						set child [$cbs add $parent \
								$cmd \
								[$ibox get method_close] \
								[$ibox get method_open] \
								[list $editor $wtext "1.0 + $idx1 chars + $idx4 chars" $cmd]]

						set arglist [string range $body $idx3 $idx4]
						if {[string index $arglist 0] == "\{" && [string index $arglist end] == "\}"} {
							set arglist [string range $arglist 1 end]
							set arglist [string range $arglist 0 end-1]
						}
						#if {[string index $arglist end] == "\}"} {set arglist [string range $arglist 0 end-1]}
						if {$arglist != ""} {
							catch {
								foreach arg $arglist {
									$cbs add $child \
											$arg \
											[$ibox get args_close] \
											[$ibox get args_open] \
											[list $editor $wtext "1.0 + $idx1 chars + $idx4 chars" $arg]
								}
							}
						}
					}

					lassign [my gettok body [incr idx4]] type idx3 idx4
					set cmd ""
				}
			}

			lassign [my gettok body [incr idx4]] type idx3 idx4
		}

		return $idx2
	}

	method outline_method {anchor varName {parent 0}} {
		my variable Priv

		upvar $varName data

		set ibox $::dApp::Obj(ibox)
		set cbs $::dApp::Obj(cbs)
		set wtext $Priv(win,text)
		set editor [self object]

		lassign [my gettok data $anchor] type idx1 idx2
		if {$type == "EOS" || $type == "EOF"} {return $idx2}
		set name [string range $data $idx1 $idx2]


		lassign [my gettok data [incr idx2]] type idx1 idx2
		if {$type == "EOS" || $type == "EOF"} {return $idx2}
		set arglist [string range $data $idx1 $idx2]

		set child [$cbs add $parent \
				$name \
				[$ibox get method_close] \
				[$ibox get method_open] \
				[list $editor $wtext "1.0 +  $idx1 chars" $name] \
		]

		if {[string index $arglist 0] == "\{" && [string index $arglist end] == "\}"} {
			set arglist [string range $arglist 1 end]
			set arglist [string range $arglist 0 end-1]
		}
		#if {[string index $arglist end] == "\}"} {set arglist [string range $arglist 0 end-1]}
		if {$arglist != ""} {
			catch {
				foreach arg $arglist {
					$cbs add $child \
							$arg \
							[$ibox get args_close] \
							[$ibox get args_open] \
							[list $editor $wtext "1.0 +  $idx1 chars" $arg]
				}
			}
		}

		lassign [my gettok data [incr idx2]] type idx1 idx2

		return $idx2
	}

	method outline_ns {anchor varName {parent 0}} {
		my variable Priv

		upvar $varName data

		set ibox $::dApp::Obj(ibox)
		set cbs $::dApp::Obj(cbs)
		set wtext $Priv(win,text)
		set editor [self object]

		lassign [my gettok data $anchor] type idx1 idx2
		if {$type == "EOS" || $type == "EOF"} {return $idx2}
		set name [string range $data $idx1 $idx2]

		set parent [$cbs add $parent \
				$name \
				[$ibox get ns_close] \
				[$ibox get ns_open] \
				[list $editor $wtext "1.0 + $idx2 chars" $name] \
		]

		lappend Priv(symbol,ns,items) $parent
		set Priv(symbol,$parent) $name

		lassign [my gettok data [incr idx2]] type idx1 idx2
		if {$type == "EOS" || $type == "EOF"} {return $idx2}

		if {[string index $data $idx1] == "\{"} {incr idx1}

		if {[string index $data $idx2] == "\}"} {
			set body [string range $data $idx1 [expr $idx2 -1]]
		} else {
			set body [string range $data $idx1 $idx2]
		}

		lassign [my gettok body 0] type idx3 idx4
		set cmd ""

		while {$type != "EOF"} {
			if {$type == "EOS"} {
				set cmd ""
				lassign [my gettok body [incr idx4]] type idx3 idx4
				continue
			}

			set tok [string range $body  $idx3 $idx4]
			if {$cmd == ""} {
				set cmd $tok

				if {[lsearch -exact [list oo::class ::oo::class class] $cmd] >= 0} {
					lassign [my gettok body [incr idx4]] type idx3 idx4
					if {$type == "TOK" && [string range $body $idx3 $idx4] == "create"} {
						set ret [my outline_class [expr $idx1 + $idx4 +1] data $parent]
						set idx4 [expr $ret - $idx1]
						set cmd ""
					}
					if {$type != "TOK"} {set cmd ""}
				}

				if {[lsearch -exact [list oo::define ::oo::define define] $cmd] >= 0} {
					set ret [my outline_class [expr $idx1 + $idx4 +1] data $parent]
					set idx4 [expr $ret - $idx1]
					set cmd ""
				}

				if {$cmd == "namespace" } {
					lassign [my gettok body [incr idx4]] type idx3 idx4
					if {$type == "TOK" && [string range $body $idx3 $idx4] == "eval"} {
						set ret [my outline_ns [expr $idx1 + $idx4 +1] data $parent]
						set idx4 [expr $ret - $idx1]
						set cmd ""
					}
					if {$type != "TOK"} {set cmd ""}
				}

				if {$cmd == "proc" } {
					set ret [my outline_proc [expr $idx1 + $idx4 +1] data $parent]
					set idx4 [expr $ret - $idx1]
					set cmd ""
				}

			}
			lassign [my gettok body [incr idx4]] type idx3 idx4
		}

		return $idx2

	}

	method outline_proc {anchor varName {parent 0}} {
		my variable Priv

		upvar $varName data

		set ibox $::dApp::Obj(ibox)
		set cbs $::dApp::Obj(cbs)
		set wtext $Priv(win,text)
		set editor [self object]

		lassign [my gettok data $anchor] type idx1 idx2
		if {$type == "EOS" || $type == "EOF"} {return $idx2}
		set name [string range $data $idx1 $idx2]


		lassign [my gettok data [incr idx2]] type idx1 idx2
		if {$type == "EOS" || $type == "EOF"} {return $idx2}
		set arglist [string range $data $idx1 $idx2]

		set child [$cbs add $parent \
				$name \
				[$ibox get proc_close] \
				[$ibox get proc_open] \
				[list $editor $wtext "1.0 +  $idx1 chars" $name] \
		]

		lappend Priv(symbol,proc,items) $child
		set Priv(symbol,$child) $name

		if {[string index $arglist 0] == "\{" && [string index $arglist end] == "\}"} {
			set arglist [string range $arglist 1 end]
			set arglist [string range $arglist 0 end-1]
		}
		#if {[string index $arglist end] == "\}"} {set arglist [string range $arglist 0 end-1]}
		if {$arglist != ""} {
			catch {
				foreach arg $arglist {
					$cbs add $child \
							$arg \
							[$ibox get args_close] \
							[$ibox get args_open] \
							[list $editor $wtext "1.0 +  $idx1 chars" $arg]
				}
			}
		}

		return $idx2

	}

	method select_first {} {
		set editor [$::dApp::Obj(nbe) editor]
		set wtext [$editor cget -wtext]
		set tree [$::dApp::Obj(cbs) cget -wtree]
		set item [$tree selection get]

		if {![winfo exists $wtext] || $item == ""} {
			$tree item delete 0 end
			return
		}

		lassign [$tree item element cget $item 0 txt -data] editor wtext pos txt
		$editor goto 	[$wtext index "$pos linestart"]
	}

	method select_last {} {
		set editor [$::dApp::Obj(nbe) editor]
		set wtext [$editor cget -wtext]
		set tree [$::dApp::Obj(cbs) cget -wtree]
		set item [$tree selection get]

		if {![winfo exists $wtext] || $item == ""} {
			$tree item delete 0 end
			return
		}

		lassign [$tree item element cget $item 0 txt -data] editor wtext pos txt
		set pos [$wtext index "$pos linestart"]

		set data [$wtext get $pos end]
		lassign [my gettok data 0] tok sIdx eIdx
		while {$tok == "TOK"} {
			lassign [my gettok data [incr eIdx]] tok sIdx eIdx
		}

		$editor goto [$wtext index "$pos + $sIdx chars"]
	}

	method select_range {} {
		set editor [$::dApp::Obj(nbe) editor]
		set wtext [$editor cget -wtext]
		set tree [$::dApp::Obj(cbs) cget -wtree]
		set item [$tree selection get]

		if {![winfo exists $wtext] || $item == ""} {
			$tree item delete 0 end
			return
		}

		lassign [$tree item element cget $item 0 txt -data] editor wtext pos txt
		set pos [$wtext index "$pos linestart"]

		set data [$wtext get $pos end]
		lassign [my gettok data 0] tok sIdx eIdx
		while {$tok == "TOK"} {
			lassign [my gettok data [incr eIdx]] tok sIdx eIdx
		}

		$editor goto $pos
		$wtext tag remove sel 1.0 end
		$wtext tag add sel $pos	"$pos + $sIdx chars"
	}

	method gettok {varName sidx} {

	   upvar $varName data

	   # skip space
	   set idx1 $sidx
	   set ch [string index $data $idx1]

	   while {$ch == " "  || $ch == "\t"} {
	      incr idx1
	      set ch [string index $data $idx1]
	   }
		set idx2 $idx1

		if {$ch == ""} {return [list "EOF" $idx1 $idx2]}

		if {$ch == "\n" || $ch == "\r"} {
			set ch2 [string index $data [expr $idx2 + 1 ]]
			if {$ch2 == "\n" || $ch2 == "\r"} {incr idx2}
			return [list "EOS" $idx1 $idx2]
		}

		if {$ch == ";"} {return [list "EOS" $idx1 $idx2]}

	 	set spaces [list "" " " "\t" "\n" "\r" ";"]

	   while {1==1} {

		   if {[lsearch -exact $spaces $ch] != -1} {return [list "TOK" $idx1 [incr idx2 -1]]}

			if {$ch == "\\"} {
				incr idx2
				set ch [string index $data [incr idx2]]
				continue
			}

		   if {$ch == "\["} {
		      set ch2 [string index $data [incr idx2]]
		      set nest 1
		      while {$ch2 != ""} {
		         if {$ch2 == "\["} {incr nest}
		         if {$ch2 == "\]"} {incr nest -1}
		         if {$ch2 == "\\"} {incr idx2}
		         if {$nest == 0} {break}
		         set ch2 [string index $data [incr idx2]]
		      }
		      if {$ch2 == ""} {return [list "TOK" $idx1 [incr idx2 -1]]}
		   }

		   if {$ch == "\{"} {
		      set ch2 [string index $data [incr idx2]]
		      set nest 1
		      while {$ch2 != ""} {

		         if {$ch2 == "\{"} {incr nest}
		         if {$ch2 == "\}"} {incr nest -1}
		         if {$ch2 == "\\"} {incr idx2}
		         if {$nest == 0} {break}
			      set ch2 [string index $data [incr idx2]]
		      }

		      if {$ch2 == ""} {return [list "TOK" $idx1 [incr idx2 -1]]}
		   }

		   if {$ch == "\""} {
		      set ch2 [string index $data [incr idx2]]
		      while {$ch2 != ""} {
		         if {$ch2 == "\""} {break}
		         if {$ch2 == "\\"} {incr idx2}
		         set ch2 [string index $data [incr idx2]]
		      }
		      if {$ch2 == ""} {return [list "TOK" $idx1 [incr idx2 -1]]}
		   }
			set ch [string index $data [incr idx2]]

	   }
	   return [list "EOF" $idx1 $idx2]
	}

}
