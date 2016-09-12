set plugin [::dApp::plugin new]

oo::objdefine $plugin {
	method author {} {return "dai"}
	method description {} {return ""}
	method name {} {return [::msgcat::mc "C Support"]}
	method version {} {return "1.0"}	
	
	method init {} {
		set dir [my pwd]
		
		namespace eval ::cc {}
		source [file join $dir "syndb.tcl"]
		source [file join $dir "cceditor.tcl"]
		
		::cc::syndb_init
		
		$::dApp::Obj(nbe) mime install [list .c .C .cpp .CPP .cc .CC .h]  ::dApp::ceditor::cc	
	}
	
	method cleanup {} {
		namespace delete ::cc
		$::dApp::Obj(nbe) mime uninstall [list .c .C .cpp .CPP .cc .CC .h]  ::dApp::ceditor::cc
		rename ::dApp::ceditor::cc ""
	}
}
