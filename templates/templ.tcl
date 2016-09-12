oo::class create ::dApp::templ::file {
	constructor {} {
		my variable Priv
		
		set dir [file dirname [file normalize [info script]]]
		
		array set Priv [list \
			PWD $dir \
			NAME [file tail $dir] \
			ICON [$::dApp::Obj(ibox) get file_templ_icon] \
		]
	
		set icon [file join $dir icon.png]
		if {[file exists $icon]} {
			catch {set Priv(ICON) [image create photo -file $icon]}
		}		
		
		set f [file join $dir locales [::msgcat::mclocale].msg]
		if {[file exists $f]} {
				namespace eval :: [list source -encoding utf-8 $f]
		}		
	}
	destructor {
		my variable Priv
		array unset Priv
	}
	
	method create {} {return 0}
	
	method pwd {} {my variable Priv ; return $Priv(PWD)}
	method name {} {my variable Priv ; return $Priv(NAME)}
	method icon {} {my variable Priv ; return $Priv(ICON)}
	
	method author {} {return ""}
	method version {} {return ""}
	method description {} {return ""}
	method unique {dir fname} {
		set i 0
		set name [file rootname $fname]
		set ext [file extension $fname]
		
		while {[file exists [file join $dir $fname]]} {
			incr i
			set fname [format "%s-$i%s"  $name $ext]
		}
		
		return [file join $dir $fname]
	}
}

oo::class create ::dApp::templ::project {
	constructor {} {
		my variable Priv
		
		set dir [file dirname [file normalize [info script]]]
		
		array set Priv [list \
			PWD $dir \
			NAME [file tail $dir] \
			ICON [$::dApp::Obj(ibox) get project_templ_icon] \
		]
	
		set icon [file join $dir icon.png]
		if {[file exists $icon]} {
			catch {set Priv(ICON) [image create photo -file $icon]}
		}
		set f [file join $dir locales [::msgcat::mclocale].msg]
		if {[file exists $f]} {
				namespace eval :: [list source -encoding utf-8 $f]
		}			
		
	}
	destructor {
		my variable Priv
		array unset Priv
	}
	
	method create {} {return 0}
	
	method pwd {} {my variable Priv ; return $Priv(PWD)}
	method name {} {my variable Priv ; return $Priv(NAME)}
	method icon {} {my variable Priv ; return $Priv(ICON)}
	
	method author {} {return ""}
	method version {} {return ""}
	method description {} {return ""}
	

}
