package require twidget::base
package provide twidget::rc  $::twidget::Priv(version)

::oo::class create $::twidget::Priv(prefix)::rc {
	constructor {rcfile {autoFlush 1}} {
		# SYNOPSIS : 
		my variable Priv rc mode
		incr ::twidget::Priv(rc,objcount) 1 

		array set Priv [list]
		set rc $rcfile
		set mode $autoFlush
		my Load
	}

	destructor {
		my variable Priv rc mode
		
		array unset Priv
		unset rc
		unset mode
	}
	
	method append {key args} {
		my variable Priv rc mode
		
		lappend Priv($key) {*}$args
		if {$mode} {my Save}
		return $Priv($key)
	}
	
	method delete {key} {
		my variable Priv rc mode
		
		array unset Priv $key
		if {$mode} {my Save}
		return
	}
	
	method exists {key} {
		my variable Priv
		
		if {[info exists Priv($key)]} {return 1}
		return 0
	}
	
	method file {} {
		my variable Priv rc
		
		return $rc
	}
	
	method flush {} {
		my Save
	}
	
	method get {key} {
		my variable Priv

		if {[info exists Priv($key)]} {return $Priv($key)}
		return ""
	}
	
	method keys {} {
		my variable Priv
		return [array names Priv]
	}
	
	method set {key val} {
		my variable Priv rc mode
		
		set Priv($key) [list $val]
		if {$mode} {my Save}
		return $Priv($key)
	}
	
	method Load {} {
		my variable Priv rc
		
		if {![file isfile $rc]} {return}
		set fd [open $rc r]
		chan configure $fd -encoding utf-8
		set key ""
		while {![eof $fd]} {
			gets $fd data
			if {[string trim $data] == ""} {continue}
			set type [string index $data 0]
			set data [string range $data 1 end]
			if {$type == "+"} {
				set key $data
				continue
			}
			if {$type == "-"} {
				lappend Priv($key) $data
				continue
			}
		}
		close $fd		
	}
	
	method Save {} {
		my variable Priv rc
		
		if {$rc == ""} {return}
		
		set fd [open $rc w]
		chan configure $fd -encoding utf-8
		foreach {key} [lsort [array names Priv]] {
			set val $Priv($key)
			puts $fd +$key
			foreach {item} $val {
				puts $fd -$item
			}
		}
		close $fd
	}
}




