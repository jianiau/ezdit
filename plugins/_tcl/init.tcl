set plugin [::dApp::plugin new]

oo::objdefine $plugin {
	method author {} {return "dai"}
	method description {} {return ""}
	method name {} {return [::msgcat::mc "Tcl Support"]}
	method version {} {return "1.0"}	
	
	method init {} {
		set dir [my pwd]
		
		namespace eval ::tcltk {}
		source [file join $dir "syndb.tcl"]	
		source [file join $dir "tcleditor.tcl"]
		
		::tcltk::syndb_init $dir
		
		$::dApp::Obj(nbe) mime install [list .tcl .TCL]  ::dApp::ceditor::tcl
	}
	method cleanup {} {
		namespace delete ::tcltk
		$::dApp::Obj(nbe) mime uninstall [list .tcl .TCL]  ::dApp::ceditor::tcl
	}
}

$plugin toggle
