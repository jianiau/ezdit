oo::objdefine [::dApp::templ::project new] {
	method author {} {return "dai"}
	method description {} {return ""}
	method name {} {return [::msgcat::mc "Tcl Project"]}
	method version {} {return "1.0"}	
	
	method create {dir} {
		variable Priv
		
		set pwd [my pwd]
		file copy -force [file join $pwd templ main.tcl] $dir
		
		return 1
	}
}
