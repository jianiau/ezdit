oo::class create ::dApp::cbs {
	superclass ::twidget::treeview
	constructor {} {
		my variable Priv

		next .cbs
		$dApp::Obj(layout) pane add "L" [::msgcat::mc "Outline"] .cbs
		
		my configure -iboxobject $::dApp::Obj(ibox)
	
		set Priv(openlist) [list]

		bind $Priv(win,tree) <<ButtonLDClick>> [list [self object] ButtonL_DClick]
	}
	
	destructor { 
	}

	method add {parent title imgClose imgOpen data} {
		my variable Priv
	
		set tree $Priv(win,tree)

		set op no
		if {[lsearch -exact $Priv(openlist) $title] >= 0} {set op yes}
	
		set item [$tree item create -button auto -open $op]
		$tree item style set $item 0 style
		$tree item lastchild $parent $item
		$tree item element configure $item 0 txt -text $title -data $data
		$tree item element configure $item 0 img -image [list $imgOpen {open} $imgClose {}]
		
		if {$op == "yes"} { $tree item expand $item}
		
		return $item
	}
	
	method binding_setup {} {
		my variable Priv
		
		$::dApp::Obj(nbe) hook install <Selection> [list [self object] Nbe_Selection_Cb]
	}	
	
	method clear {} {
		my variable Priv
		
		set tree $Priv(win,tree)
		
		set Priv(openlist) [list]
		foreach item [$tree item range 0 end] {
			if {$item == 0 || ![$tree item isopen $item]} {continue}
			lassign [$tree item element cget $item 0 txt -data] editor wtext pos txt	
			lappend Priv(openlist) $txt
		}
		
		
		$tree item delete 0 end
	}
	
	method history_clear {} {
		my variable Priv
		set Priv(openlist) [list]
	}
	
	method sort {} {
		my variable Priv
		
		set tree $Priv(win,tree)
		$tree item sort root -increasing -column 0 -dictionary
	}

	method ButtonL_DClick {} {
		my variable Priv
		set wtree $Priv(win,tree)
		set item [$wtree selection get] 
	
		if {$item == ""} {return}
		catch {
			lassign [$wtree item element cget $item 0 txt -data] editor wtext pos txt
			set pos [$wtext index $pos]
			lassign [split $pos "."] line char
			if {![winfo exists $wtext]} {
				$wtree item delete 0 end
				return
			}
			$editor goto $line.0
		}
		return
	}
	
	method Item_Menu_Popup {item X Y} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)
		set wtree $Priv(win,tree)
		
		set m $wtree.m
		catch {destroy $m}
		menu $m -tearoff 0
		
		lassign [$wtree item element cget $item 0 txt -data] editor wtext pos txt	
	
	
		$m add command \
		-compound left \
		-image [$ibox get empty] \
		-label [::msgcat::mc "Copy '%s'" $txt] \
		-command [format {
			clipboard clear
			clipboard append {%s}
		} $txt]
		set idx [$m index end]
		
		set editor [$::dApp::Obj(nbe) editor]
		if {[info object class $editor "::dApp::ceditor"] } {
			$m add separator
			$editor make_outline_menu  $m 
		}
		
		if {$idx +1 == [$m index end]} {$m delete [incr idx]}
		
		tk_popup $m $X $Y
		after idle [list [self object] selection set $item]
	}
	
	method Nbe_Selection_Cb {tab} {
		my variable Priv
		my history_clear
		if {$tab == ""} {my clear}

		return 0
	}
	
	export ButtonL_DClick Expand Nbe_Selection_Cb

}

set ::dApp::Obj(cbs) [::dApp::cbs new]
