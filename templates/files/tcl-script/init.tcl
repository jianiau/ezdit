oo::objdefine [::dApp::templ::file new] {
	method author {} {return "dai"}
	method description {} {return ""}
	method name {} {return [::msgcat::mc "Tcl Script"]}
	method version {} {return "1.0"}	
	
	method create {dir} {
		set target [my unique $dir "New Script.tcl"]
		set fd [open $target w]
		puts $fd "#!/bin/sh"
		puts $fd  "#\\"
		puts $fd "exec tclsh \"\$0\" \${1+\"$@\"}"
		close $fd
		return $target		
	}
}
