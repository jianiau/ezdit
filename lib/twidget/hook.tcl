package require twidget::base
package provide twidget::hook  $::twidget::Priv(version)

::oo::class create $::twidget::Priv(prefix)::hook {
	constructor {} {
		# SYNOPSIS : 
		my variable Priv  sn

	incr ::twidget::Priv(hook,objcount) 1 

		array set Priv [list]
		set sn 0
	}

	destructor {
		my variable Priv
		
		array unset Priv
	}
	
	method define {tag} {
		my variable Priv
		set Priv($tag) [list]
		return
	}		
	
	method install {tag script} {
		my variable Priv sn
		
		incr sn
		lappend Priv($tag) [list $sn $script]
		
		return $sn
	}	

	method invoke {tag args} {
		my variable Priv sn

		if {![info exists Priv($tag)]} {return [list]}
		set ret 0
		foreach {item}  $Priv($tag) {
			lassign $item sn cmd
			set data ""
			#set state [catch {eval [linsert $cmd end {*}$args ]} data]
			set state 0
			if {[llength $args]} {
				set data [eval [linsert $cmd end {*}$args ]]
			} else {
				set data [eval $cmd]
			}
			if {$state || $data == -1} {return -1}
			incr ret $data
		}
		return $ret
	}

	method uninstall {tag id} {
		my variable Priv 
		
		if {![info exists Priv($tag)]} {return}
		
		set cmds [list]
		foreach item $Priv($tag) {
			lassign $item sn cmd
			if {$id == $sn} {continue}
			lappend cmds $cmd
		}
		set Priv($tag) $cmds
	}
}
