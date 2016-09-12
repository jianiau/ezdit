package require twidget::base
package provide twidget::ibox  $::twidget::Priv(version)

::oo::class create $::twidget::Priv(prefix)::ibox {
	constructor {} {
		# SYNOPSIS : ibox new
		my variable Priv
		
		incr ::twidget::Priv(ibox,objcount) 1 
		
		set Priv(__unknow__) [image create photo -format png -data {
			iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A
			/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9kBEA4WLl5MDHoAAAAZdEVYdENv
			bW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAAAEklEQVQ4y2NgGAWjYBSMAggAAAQQAAGFP6py
			AAAAAElFTkSuQmCC
		}]
	}

	destructor {
		my variable Priv
		foreach name [array names Priv] {my delete $name}
	}

	method add {args} {
		# SYNOPSIS : iboxobj add filepath ?filepath? ...
		# RETURN : count
		my variable Priv
		
		set cut 0
		foreach fpath $args {
			if {![file exists $fpath]} {continue}
			set name [file rootname [file tail $fpath]]
			if {[info exists Priv($name)]} {
				$Priv($name) configure -file $fpath
			} else {
				set Priv($name) [image create photo -file $fpath]
			}
			incr cut
		}
	}

	method delete {args} {
		# SYNOPSIS : iboxobj delete name ?name? ?name?
		my variable Priv
		foreach name $args {
			if {[info exists Priv($name)]} {catch {image delete $Priv($name)}}
			array unset Priv $name
		}
	}
	
	method dump {} {
		# SYNOPSIS : iboxobj dump
		my variable Priv
	
		return [array names Priv]
	}	
	
	method exists {name} {
		# SYNOPSIS : iboxobj exists name
		# RETURN : 1 -> exists , 0 -> not exists
		my variable Priv
		if {[info exists Priv($name)]} {return 1}
		return 0		
	}
	
	method get {name} {
		# SYNOPSIS : iboxobj get name
		my variable Priv
	
		if {![info exists Priv($name)] } {return $Priv(__unknow__)}
		return $Priv($name)
	}
	
	method replace {args} {
		# SYNOPSIS : iboxobj replace name image
		# RETURN : count
		my variable Priv
		
		set cut 0
		foreach {name img} $args {
			if {[info exists Priv($name)]} {
				$Priv($name) copy $img
			} else {
				set Priv($name) $img
			}
			incr cut		
		}
		
		return $cut
	}	
	
	method set {name fpath} {
		# SYNOPSIS : iboxobj set name filepath
		my variable Priv
	
		if {![info exists Priv($name)] } {
			set Priv($name) [image create photo -file $fpath]
		} else {
			$Priv($name) configure -file $fpath
		}
		return $Priv($name)
	}
	
	method unknow {{fpath ""}} {
		# SYNOPSIS : iboxobj unknow ?filepath?
		my variable Priv
		
		if {![file exists $fpath]} {return $Priv(__unknow__)}
		$Priv(__unknow__) configure -file $fpath

		return $Priv(__unknow__)
	}

}




