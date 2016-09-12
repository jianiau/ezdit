oo::objdefine [::dApp::templ::project new] {
	method author {} {return "dai"}
	method description {} {return ""}
	method name {} {return [::msgcat::mc "Empty Project"]}
	method version {} {return "1.0"}	
	
	method create {dir} {return 1}
}
