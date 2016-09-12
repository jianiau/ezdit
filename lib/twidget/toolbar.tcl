package require twidget::base
package provide twidget::toolbar  $::twidget::Priv(version)

::oo::class create $::twidget::Priv(prefix)::toolbar {
	constructor {path args} {
		# SYNOPSIS : 
		my variable Priv
		
		incr ::twidget::Priv(toolbar,objcount) 1 
		
		set Priv(win,frame) $path
		
		ttk::frame $Priv(win,frame) {*}$args
		
	}

	destructor {
		my variable Priv 
		
		destroy $Priv(win,frame)
		
		array unset Priv
	}
	
	method add {type args} {
		return [my add_$type {*}$args]
	}
	
	method add_button {args} {
		my variable Priv

		incr Priv(opts,sn)
		set widget [ttk::button $Priv(win,frame).btn$Priv(opts,sn) \
			-style Toolbutton \
			-takefocus 0 \
			-compound none]
	
		foreach {key value} $args	{
			switch -exact -- $key {
				-tooltip {::tooltip::tooltip $widget $value}
				default {$widget configure $key $value}
			}
		}
	
		pack $widget -side left -pady 2 -padx 5
		return $widget
	}	
	
	method add_checkbutton {args} {
		my variable Priv
		
		incr Priv(opts,sn)
	
		set widget [ttk::checkbutton $Priv(win,frame).chk$Priv(opts,sn)]
	
		foreach {key value} $args	{
			switch -exact -- $key {
				-tooltip {::tooltip::tooltip $widget $value}
				default {$widget configure $key $value}
			}
		}
	
		pack $widget -side left  -pady 2
		return $widget
	}	

	method add_combobox {args} {
		my variable Priv
		
		incr Priv(opts,sn)
	
		set widget [ttk::combobox $Priv(win,frame).cmb$Priv(opts,sn)]
	
		foreach {key value} $args	{
			switch -exact -- $key {
				-tooltip {::tooltip::tooltip $widget $value}
				default {$widget configure $key $value}
			}
		}
	
		pack $widget -side left -pady 1
		return $widget
	}
	
	method add_entry {args} {
		my variable Priv
		
		incr Priv(opts,sn)
	
		set widget [ttk::entry $Priv(win,frame).txt$Priv(opts,sn)]
	
		foreach {key value} $args	{
			switch -exact -- $key {
				-tooltip {::tooltip::tooltip $widget $value}
				default {$widget configure $key $value}
			}
		}
	
		pack $widget -side left -ipady 1
		return $widget
	}
	
	method add_label {args} {
		my variable Priv
		
		incr Priv(opts,sn)
	
		set widget [ttk::label $Priv(win,frame).lbl$Priv(opts,sn)]
	
		foreach {key value} $args	{
			switch -exact -- $key {
				-tooltip {::tooltip::tooltip $widget $value}
				default {	$widget configure $key $value}
			}
		}
	
		pack $widget -side left -pady 2
		return $widget
	}
	
	method add_separator {args} {
		my variable Priv
		
		incr Priv(opts,sn)
		
		set sep [ttk::separator $Priv(win,frame).sep$Priv(opts,sn) -orient v]
	
		foreach {key value} $args	{
			switch -exact -- $key {
				-tooltip {::tooltip::tooltip $btn $value}
				default {$sep configure $key $value}
			}
		}
	
		pack $sep -side left -fill y -padx 5 -pady 5
		return $sep
	}
	
	method add_space {args} {
		my variable Priv
		
		incr Priv(opts,sn)
		set sep [ttk::frame $Priv(win,frame).sp$Priv(opts,sn)]
	
		foreach {key value} $args	{
			switch -exact -- $key {
				-tooltip {::tooltip::tooltip $btn $value}
				default {$sep configure $key $value}
			}
		}
	
		pack $sep -side left
		return $sep
	}
	
	method add_space_expand {args} {
		my variable Priv
		
		incr Priv(opts,sn)
		set sep [ttk::frame $Priv(win,frame).sp$Priv(opts,sn)]
	
		foreach {key value} $args	{
			switch -exact -- $key {
				-tooltip {::tooltip::tooltip $btn $value}
				default {$sep configure $key $value}
			}
		}
	
		pack $sep -side left -expand 1 -fill x
		return $sep
	}
	
	method cget {opt} {
		my variable Priv

		if {$opt == "-frame"} {return $Priv(win,frame)}
		return [$Priv(win,frame) cget $opt]
	}
	
	method configure {args} {
	   my variable Priv
	   
	   return [$Priv(win,frame) configure {*}$args]
	}

	method delete {args} {
		my variable Priv

		foreach item $args {
			if {[winfo exists $item]} {destroy $item}
		}
	}

}




