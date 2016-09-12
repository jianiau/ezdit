oo::class create ::dApp::ceditor::cc {
	superclass ::dApp::ceditor
	constructor {wpath {filepath ""} {enc "utf-8"}} {
		my variable Priv
		
		array set Priv [list \
			re,keyword {\w[\w\d]+} \
			re,include {^\s*(\#\w+)} \
			re,symbol {\s+\*?(\w[\w\d]+)\s*(\(.*\))[\s\n\r]*\{} \
			re,digit {[^\w]([-+]?([0-9]+[xX]?\.?[0-9a-fA-F]*|\.[0-9]+)([eE][-+]?[0-9]+)?)} \
			re,comment {/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/} \
			re,operator {[\[\]\{\}\(\)\+\-\*\/\=\%\!\|\<\>\&\~\;]} \
		]

		next $wpath
		
		array set colorTbl [list \
			PREDEFINE "#2772cd" \
			DATASTRUCT "#088D00" \
			STATEMENT "#AE2C62" \
			FUNCTION "#505050" \
			DIGIT "#FA8B07" \
			COMMENT "#3012F0" \
			STRING "#51728E" \
			INCLUDE "#4d6f8b" \
			OPERATOR "#883A95" \
			]
		
		set Priv(taglist) [list OPERATOR DATASTRUCT FUNCTION STATEMENT  PREDEFINE INCLUDE DIGIT COMMENT STRING]
	
		set wtext $Priv(win,text)
		foreach {tag} $Priv(taglist) {
			if {$tag == "COMMENT"} {
				set f [$wtext cget -font]
				set size [font configure $f -size]
				set family [font configure $f -family]
				$wtext tag configure $tag -foreground $colorTbl($tag) -font [font create -family $family -size $size -slant italic]
			} else {
				$wtext tag configure $tag -foreground $colorTbl($tag)
			}
			$wtext tag raise $tag	
		}
		
		set Priv(opts,comment) "//"
		
		if {[file exists $filepath]} {my open $filepath $enc}
	}
	destructor {
		next
	}
	
	method content_change {type key} {
		my variable Priv

		set editor [$::dApp::Obj(nbe) editor]
		set wtext $Priv(win,text)
		
		if {$key == "braceright"} {
			set data [$wtext get "insert linestart" "insert lineend"]
			if {[string trim $data] == "\}"} {
				set tabwidth [$editor cget -tabwidth]
				set sp [string repeat " " $tabwidth]
				regsub {\t} $data $sp data
				regsub $sp $data "" data
				$wtext replace "insert linestart" "insert lineend" $data		
			}
			return
		}
		
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
			return
		}
	}

	method highlight {sIdx eIdx} {
		my variable Priv
		
		set wtext $Priv(win,text)
		
		set idx1 $sIdx
		set idx2 $eIdx
		set data [$wtext get $idx1 $idx2]
		if {$sIdx == "insert linestart" && $eIdx == "insert"} {
			set idx2 "insert lineend"
		}	
		foreach tag $Priv(taglist) {$wtext tag remove $tag $idx1 $idx2}
	
		foreach item [regexp -indices -all -inline -- $Priv(re,keyword) $data] {
			lassign $item i1 i2
			if {$i1 == -1} {continue}
			set str [string range $data $i1 $i2]
			if {[info exists ::cc::syndb($str)]} {
				$wtext tag add $::cc::syndb($str) "$idx1 + $i1 chars" "$idx1 + $i2 chars + 1 chars"
			}	
		}
		
		foreach {v item} [regexp -indices -all -inline -line  -- $Priv(re,include) $data] {
			lassign $item i1 i2
			if {$i1 == -1} {continue}
			set str [string range $data $i1 $i2]
			if {![info exists ::cc::syndb($str)]} {continue}
			$wtext tag add $::cc::syndb($str) "$idx1 + $i1 chars" "$idx1 + $i2 chars + 1 chars"
			if {$str == "#include"} {
				$wtext tag add "INCLUDE" "$idx1 + $i2 chars + 1 chars" "$idx1 + $i2 chars lineend"
			}
		}
		
		foreach {v1 v2 v3 v4} [regexp -indices -all -inline -- $Priv(re,digit) $data] {
			lassign $v3 i1 i2
			if {$i1 == -1} {continue}
			$wtext tag add "DIGIT" "$idx1 + $i1 chars" "$idx1 + $i2 chars + 1 chars"
		}
	
		foreach {item v1 v2 v3} [regexp -indices -all -inline  -- $Priv(re,comment) [$wtext get 1.0 end]] {
			lassign $item i1 i2
			if {$i1 == -1} {continue}
			$wtext tag add "COMMENT" "1.0 + $i1 chars" "1.0 + $i2 chars + 1 chars"
		}
		
		foreach {item} [regexp -all -indices  -inline -line --  $Priv(re,operator) $data] {
			lassign $item i1 i2
			if {$i1 == -1} {continue}
			incr i2
			$wtext tag add "OPERATOR" "$idx1 + $i1 chars" "$idx1 + $i2 chars"
		}	
	
		set i1 0
		set ch [string index $data $i1]
		while {$ch != ""} {
			if {$ch == "\""} {
				set i2 $i1
				set ch2 [string index $data [incr i2]]
				while {$ch2 != ""} {
					if {$ch2 == "\"" || $ch2 == "\r" || $ch2 == "\n"} {break}
					if {$ch2 == "\\"} {incr i2}
					set ch2 [string index $data [incr i2]]
				}
				incr i2
				$wtext tag add "STRING" "$idx1 + $i1 chars" "$idx1 + $i2 chars"
				set i1 $i2
			}
			if {$ch == "/"} {
				set i2 $i1
				set ch2 [string index $data [incr i2]]
				if {$ch2 == "/"} {
					while {$ch2 != ""} {
						if {$ch2 == "\r" || $ch2 == "\n"} {break}
						set ch2 [string index $data [incr i2]]					
					}
					
					$wtext tag add "COMMENT" "$idx1 + $i1 chars" "$idx1 + $i2 chars"
					set i1 $i2
				}
			}
			set ch [string index $data [incr i1]]
		}
		return
	}
	


	method outline {} {
		my variable Priv
	
		set ibox $::dApp::Obj(ibox)
		set wtext $Priv(win,text)
		set cbs $::dApp::Obj(cbs)
		set editor [self object]
	
		set data [$wtext get 1.0 end]
		
		lassign "" type name arglist
		
		set skip [list if do while for switch]
		
		foreach {tmp name arglist} [regexp -all -indices -inline -lineanchor -linestop -- $Priv(re,symbol) $data] {
	
			lassign $name sIdx eIdx
			if {$sIdx == -1} {continue}
			set name [string range $data $sIdx $eIdx]	
			set sIdx [$wtext index "1.0 + $sIdx chars"]
			
			if {[lsearch -exact $skip $name] >= 0} {continue}
			
			set type [$wtext get "$sIdx linestart" $sIdx]
		
			lassign $arglist i1 i2
			if {$i1 == -1} {continue}
			set arglist [string trim [string range $data $i1 $i2]		"()"]
			
			set argc "..."
			set symbol "${name}($arglist)"
			if {$arglist == ""} {set argc ""}
			set item [$cbs add 0 "$type ${name}($argc)" [$ibox get proc_open] [$ibox get proc_close] [list $editor $wtext $sIdx $symbol]]
			foreach arg [split $arglist ","] {
				set symbol [string trim $arg]
				$cbs add $item [string trim $arg] [$ibox get proc_arg] [$ibox get proc_arg] [list $editor $wtext $sIdx $symbol]
			}
		}
		
		return
	}
}
