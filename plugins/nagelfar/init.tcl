set plugin [::dApp::plugin new]

oo::objdefine $plugin {
	method author {} {return "dai"}
	method description {} {return ""}
	method name {} {return [::msgcat::mc "Nagelfar"]}
	method version {} {return "1.0"}	
	
	method init {} {
		my variable Priv
		
		set Priv(plugPath) [my pwd]
		set ::dApp::Obj(nagelfar) [self object]
		
		set NAGELFAR [self object]
		source -encoding utf-8 [file join $Priv(plugPath) main.tcl]
		my Ui_Init
	}
	method cleanup {} {
		my variable Priv
		
		$Priv(obj,ToolsMenu) destroy
		$Priv(obj,EditorMenu) destroy
		
		$::dApp::Obj(nbo) delete $Priv(nbo,tabId)
		

	}

}
