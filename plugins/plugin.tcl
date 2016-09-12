oo::class create ::dApp::plugin {
	constructor {} {
		my variable Priv
		
		set dir [file dirname [file normalize [info script]]]

		array set Priv [list \
			STATE 0 \
			PWD $dir \
			NAME [file tail $dir] \
			ICON $::dApp::Obj(ibox) get plugin_icon \
		]
		
		set f [file join $dir locales [::msgcat::mclocale].msg]
		if {[file exists $f]} {
			namespace eval :: [list source -encoding utf-8 $f]
		}
		
	}
	
	destructor {my variable Priv ; array unset Priv	}
	
	method toggle {} {
		my variable Priv
		if {$Priv(STATE) == 1} {
			my cleanup
			set Priv(STATE) 0
		} else {
			my init
			set Priv(STATE) 1
		}
	}
	
	method init {} {}
	method cleanup {} {}	
	
	method author {} {return ""}
	method description {} {return ""}
	method icon {} {my variable Priv ; return $Priv(ICON)}
	method name {} {my variable Priv ; return $Priv(NAME)}
	method pwd {} {my variable Priv ; return $Priv(PWD)}
	method state {} {my variable Priv ; return $Priv(STATE)}
	method version {} {return ""}
	


}
