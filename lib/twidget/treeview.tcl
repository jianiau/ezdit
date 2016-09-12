package require twidget::hook
package require twidget::ibox
package require Tk
package provide twidget::treeview  $::twidget::Priv(version)

::oo::class create $::twidget::Priv(prefix)::treeview {
	constructor {wpath args} {
		# SYNOPSIS : 
		my variable Priv opts
		
		array set opts [list \
			-itembg [list "#e6e4e4" {selected}]  \
			-itemfg [list] \
		]
		
		array set opts $args
				
		incr ::twidget::Priv(treeview,objcount) 1 
		
		set Priv(obj,hook) [$::twidget::Priv(prefix)::hook new]
		set Priv(obj,ibox) [$::twidget::Priv(prefix)::ibox new]
		
		set Priv(obj,hook,share) 0
		set Priv(obj,ibox,share) 0 

		my Ui_Init $wpath
	}

	destructor {
		my variable Priv
		
		destroy $Priv(win,frame)
		if {$Priv(obj,hook,share) == 0} {$Priv(obj,hook) destroy}
		if {$Priv(obj,ibox,share) == 0} {$Priv(obj,ibox) destroy}
		
		array unset Priv
	}

	method cget {opt} {
		my variable Priv
		
		if {$opt == "-wtree"} {return $Priv(win,tree)}
		if {$opt == "-frame"} {return $Priv(win,frame)}
		if {$opt == "-images"} {return [$Priv(obj,ibox) dump]}
		if {$opt == "-hookobject"} {return $Priv(obj,hook)}
		if {$opt == "-iboxobject"} {return $Priv(obj,ibox)}
		return [$Priv(win,tree) cget $opt]
	}
	
	method configure {args} {
	   my variable Priv
	   
		set wtree $Priv(win,tree)
		
		set cmd [list $wtree configure]
		
		foreach {key val} $args {
				
			if {$key == "-images"} {
				foreach {name img} $val {$Priv(obj,ibox) replace $name $img}
				continue
			}
			
			if {$key == "-iboxobject"} {
				$Priv(obj,ibox) destroy
				set Priv(obj,ibox) $val
				set Priv(obj,ibox,share) 1
				continue
			}
			
			if {$key == "-hookobject"} {
				$Priv(obj,hook) destroy
				set Priv(obj,hook) $val
				set Priv(obj,hook,share) 1				
				continue
			}			
			lappend cmd $key $val
		}

		
		return [eval $cmd]
	}
	
	method hook {cmd args} {
		return [my hook_$cmd {*}$args]
	}

	method hook_install {tag script} {
		my variable Priv
		
		if {[lsearch -exact $Priv(evt,names)]} {
			set id [$Priv(obj,hook) install $tag $script]
		} else {
			bind $Priv(win,tree) $tag $script
			set id ""
		}
		
		return $id
	}

	method hook_uninstall {tag id} {
		my variable Priv
		
		if {[lsearch -exact $Priv(evt,names)]} {
			$Priv(obj,hook) uninstall $tag $id
		} else {
			bind $Priv(win,tree) $tag {}
		}		
		
	}
	
	method item {cmd args} {
		return [my item_$cmd {*}$args]
	}

	method item_add {parent title args} {
		my variable Priv
	
		set tree $Priv(win,tree)
	
		array set params [list \
			-open 0 \
			-button auto \
			-openimage [$Priv(obj,ibox) get openimage] \
			-closeimage [$Priv(obj,ibox) get closeimage] \
			-data "" \
		]
		
		array set params $args
	
		set item [$tree item create -button $params(-button) -open $params(-open)]
		$tree item style set $item 0 style
		$tree item lastchild $parent $item
		$tree item element configure $item 0 txt -text $title -data $params(-data)
		$tree item element configure $item 0 img -image [list $params(-openimage) {open} $params(-closeimage) {}]
		
		return $item
	}
	
	method item_cget {item opt} {
		my variable Priv
	
		set tree $Priv(win,tree)
		
		return [$tree item element cget $item 0 txt $opt]
	}	
	
	method item_configure {item args} {
		my variable Priv
	
		set tree $Priv(win,tree)
		
		return [$tree item element configure $item 0 txt {*}$args]
	}		
	
	method item_delete {args} {
		my variable Priv
	
		set wtree $Priv(win,tree)
		
		#if {[lindex $args 0] == "all"} {$wtree item delete $item}
		
		foreach item $args {$wtree item delete $item}
	}

	method selection {cmd args} {
		return [my selection_$cmd {*}$args]
	}
	
	method selection_add {args} {
	   my variable Priv
	   set wtree $Priv(win,tree)
	   foreach item $args {[$wtree selection add $item]}
		return
	}
	
	method selection_clear {} {
	   my variable Priv
	   set wtree $Priv(win,tree)
		return [$wtree selection clear]
	}		
	
	method selection_get {} {
		my variable Priv
		
		set wtree $Priv(win,tree)
		return [$wtree selection get]
	}
	
	method selection_set {item} {
	   my variable Priv
	   set wtree $Priv(win,tree)
	   if {[$wtree item id $item] == ""} {return ""}
	   return [$wtree selection modify $item  all]
	}


	method Selection_Change {item} {
		my variable Priv
		
		$Priv(obj,hook) invoke <Selection> $item
	}

	method Menu_Popup {x y X Y} {
		my variable Priv

		set wtree $Priv(win,tree)
		
		set ninfo [$wtree identify $x $y]
		if {[llength $ninfo] != 6} {
			my Tree_Menu_Popup $X $Y
			return
		}
		lassign $ninfo what item where column type name
		if {$item == ""} {return}
		$wtree selection modify $item all	
		my Item_Menu_Popup $item $X $Y
		return
	}

	method Item_Menu_Popup {item X Y} {
		my variable Priv

		set wtree $Priv(win,tree)
		
		set m $wtree.m
		catch {destroy $m}
		menu $m -tearoff 0
		
		$Priv(obj,hook) invoke <Item-Menu> $item $m
				
		tk_popup $m $X $Y
	}
	
	method Tree_Menu_Popup {X Y} {
		my variable Priv

		set wtree $Priv(win,tree)
		
		set m $wtree.m
		catch {destroy $m}
		menu $m -tearoff 0
		
		$Priv(obj,hook) invoke <Tree-Menu> $m
				
		tk_popup $m $X $Y		
	}

	method Ui_Init {wpath} {
		my variable Priv opts
		
		set ibox $Priv(obj,ibox)
		
		set fme [ttk::frame $wpath  -borderwidth 2 -relief groove]
		set tree [treectrl $fme.tree \
			-showroot no \
			-linestyle dot \
			-selectmod single \
			-showrootbutton yes \
			-showbuttons yes \
			-showheader no \
			-font EzTreeviewFont \
			-showlines yes \
			-scrollmargin 16 \
			-xscrolldelay "500 50" \
			-yscrolldelay "500 50" \
			-highlightthickness 0 \
			-relief groove \
			-height 1 \
			-bd 0]
		
		set Priv(win,frame) $fme	
		set Priv(win,tree) $tree
		
		set vs [ttk::scrollbar $fme.vs -command [list $tree yview] -orient vertical]
		set hs [ttk::scrollbar $fme.hs -command [list $tree xview] -orient horizontal]
		$tree configure -xscrollcommand [list $hs set] -yscrollcommand [list $vs set]
		
		::autoscroll::autoscroll $vs
		::autoscroll::autoscroll $hs
	
		grid $tree $vs -sticky "news"
		grid $hs - -sticky "we"
		grid rowconfigure $fme 0 -weight 1
		grid columnconfigure $fme 0 -weight 1	
	
		$tree column create -tag ctree -expand yes
		$tree element create img image 
		$tree element create txt text -justify left -fill $opts(-itemfg)
		$tree element create rect rect -showfocus yes -fill $opts(-itembg)
		
		$tree configure -treecolumn ctree
		
		$tree style create style
		$tree style elements style {rect img txt}
		$tree style layout style img -padx {0 0} -expand ns
		$tree style layout style txt -padx {4 0} -expand ns
		$tree style layout style rect -union {txt} -iexpand ns -ipadx 2 -ipady 2
	
		$Priv(obj,hook) define <Item-Menu>
		$Priv(obj,hook) define <Tree-Menu>
	
		set Priv(evt,names) [list <Item-Menu> <Tree-Menu>]	
	
		bind $tree <<MenuPopup>> [list [self object] Menu_Popup %x %y %X %Y]
		$tree notify bind $tree <Selection> [list [self object] Selection_Change %S]
		
		return $fme
	}
}

oo::define $::twidget::Priv(prefix)::treeview export Menu_Popup Selection_Change
