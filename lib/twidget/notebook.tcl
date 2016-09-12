package require twidget::base
package provide twidget::notebook  $::twidget::Priv(version)

::oo::class create $::twidget::Priv(prefix)::notebook {
	constructor {path args} {
		# SYNOPSIS : 
		my variable Priv opts
		incr ::twidget::Priv(notebook,objcount) 1

		set Priv(win,frame) $path

		array set opts [list \
			-control 1 \
			-close 1 \
			-icon 1 \
			-font EzNotebookFont \
			-tabbg [list "#6687b4" {selected} "#cfd2cb" {}] \
			-tabfg  [list "#FFFFFF" {selected} "#656565" {}] \
			-taboutline  [list "#d8d8d8" {selected} "#d8d8d8" {}] \
		]
		array set opts $args

		set Priv(img,prev1) [image create photo -format png -data {
		iVBORw0KGgoAAAANSUhEUgAAAAcAAAALCAYAAACzkJeoAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A
		/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9kBAgcqOVutVNkAAAAidEVYdENv
		bW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVAgb24gYSBNYWOHqHdDAAAAYUlEQVQY032PwQ2AMAwDj6hz
		8GSDTlGxRufoTEh5ZILMwDTlRSWqFP+ss2IHYh2sQK21A7vMoLV2v0ZWACABuPtlZud8P6lqN7Ow
		XEopW845hgCrwBgUBT6v/FUMqWoHeAA0gBuYxWUdogAAAABJRU5ErkJggg==
		}]
		
		set Priv(img,prev2) [image create photo -format png -data {
		iVBORw0KGgoAAAANSUhEUgAAAAcAAAALCAYAAACzkJeoAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A
		/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9kBAgcvFo0LncUAAAAidEVYdENv
		bW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVAgb24gYSBNYWOHqHdDAAAAX0lEQVQY032PsQ2AMAwEjyhz
		UNIzhmVlj8zm3m1GoGeaUBGJyOG71738b4h1sAIi0oE9zaDWer8mrQBABmitXWZ2zvezu3czC8uT
		qm6llBgCrAJjUBT4vPJXMeTuHeABaJkbXGRlD5UAAAAASUVORK5CYII=
		}]

		set Priv(img,list1) [image create photo -format png -data {
		iVBORw0KGgoAAAANSUhEUgAAAA4AAAALCAYAAABPhbxiAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A
		/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9kBAgY1BbhaTPcAAAAidEVYdENv
		bW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVAgb24gYSBNYWOHqHdDAAAA7UlEQVQoz53RsW6DQAzG8b85
		DomBDbGzponEwMzIs/CMDOkLZM3KA7BEWUDiuHMnUKWQtuo32v5Jli1d12mapiRJgjGGKIo4SggB
		7z3LsjDPM7FzDmvtDo0xh9B7j/eedV1xziF93wPQ972mafojnOeZtm0FIBaRfRVVBWCrbVFVVJUQ
		wt7boXMO59xbuPVfoLWWaZpIkuQQLsuCtfYVNk3D7XZjHEeA/bohBACKoqCu6x3K9fPKfxIL8uvQ
		/X7XYRgQEUIIlGVJ/O7h33P6OMnz+dTH40Ge55wvZ4n+spaJDFVVSZZlVFUlJjJ8Ae+HbvcDLhAf
		AAAAAElFTkSuQmCC
		}]

		set Priv(img,list2) [image create photo -format png -data {
		iVBORw0KGgoAAAANSUhEUgAAAA4AAAALCAYAAABPhbxiAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A
		/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9kBAgY0KZOZEVUAAAAidEVYdENv
		bW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVAgb24gYSBNYWOHqHdDAAAA9UlEQVQoz52RTYrCQBBGX3V3
		CGTjNngBb5FBNwHxEB7Nc2ThEC/hDVyJOwPpv5pVwkB0Zpi3rKoHH1/J4XDQqqooyxLnHMYYXpFz
		JsbIOI4Mw4Dz3lMUBWVZYq3FOfdSjDESYySEgPce6boOgNPppFVV/SgOw8DxeBQAJyIApJRQVQCm
		2YSqoqqklObdLE4R3onee0IIS7EoCp7PJyGERUE5Z6YuFuJ+v+dyuXC73QBmOecMwHq9pmmaWZTz
		55n/4AT59ajve71erxhjSCmx2Wxw7x7+neajkcfjoff7nbqu2e62Yv4SyxpL27ayWq1o21assXwB
		t2tyVFq0Se0AAAAASUVORK5CYII=
		}]
	
		set Priv(img,next1) [image create photo -format png -data {
		iVBORw0KGgoAAAANSUhEUgAAAAcAAAALCAYAAACzkJeoAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A
		/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9kBAgcqHBCpgJ4AAAAidEVYdENv
		bW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVAgb24gYSBNYWOHqHdDAAAAXUlEQVQY02NggAA1BhxALi0t
		7T82BUwwRkNDw010BUzIHHQFTOhGNTQ03Dx+/PgmrJIMDAwMO3fu9N26det/rJKmpqYM3t7ejEy4
		JDCMRZZAkUSXgIOtW7f+x2Y3AM4GG8JFg7aLAAAAAElFTkSuQmCC
		}]
		
		set Priv(img,next2) [image create photo -format png -data {
		iVBORw0KGgoAAAANSUhEUgAAAAcAAAALCAYAAACzkJeoAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A
		/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9kBAgcuLSUbRaAAAAAidEVYdENv
		bW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVAgb24gYSBNYWOHqHdDAAAAXUlEQVQY02NggAA1BhxAztPT
		8z82BUwwRkZGxk10BUzIHHQFTOhGZWRk3Ny3b985rJIMDAwMq1atMty6det/rJK+vr4M3t7ejEy4
		JDCMRZZAkUSXgIOtW7f+x2Y3AOsQG2vIohTZAAAAAElFTkSuQmCC
		}]	
	
		set Priv(img,cancel1) [image create photo -format png -data {
		iVBORw0KGgoAAAANSUhEUgAAAAkAAAAICAIAAACkr0LiAAAACXBIWXMAAAsSAAALEgHS3X78AAAA
		wklEQVR4nDWPIQqFQBgG/6AIomz2BMIiNqPVIqb1DFbLKnsAiycQs8mTWG0GLVpEMIjFYPheeO9N
		HRgYAtD3vVLqeR4AANq2TdN0nmcCME2T53l1XQNomoaIGGPDMBCA9327rrMsK8sy13U1TYvjeF1X
		wh/OORERUZ7n+74D+LllWTjnjDHDMKSU933/3LZtYRiaphlFkeM4uq4nSTKOI53nKaW0bbuqquM4
		lFLfchAEVJal7/tFUXwfrusSQhCREOIDCYF1H0ui62gAAAAASUVORK5CYII=
		}]
		
		set Priv(img,cancel2) $Priv(img,cancel1) 
		
		set Priv(img,close1) [image create photo -format png -data {
		iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A
		/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9kBAwclLX5T+w4AAAAZdEVYdENv
		bW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAAAD0lEQVQoz2NgGAWjgDoAAAJMAAGiBBJQAAAA
		AElFTkSuQmCC
		}]	
			
		set Priv(img,close2) [image create photo -format png -data {
		iVBORw0KGgoAAAANSUhEUgAAAAkAAAAICAYAAAArzdW1AAAAAXNSR0IArs4c6QAAAAZiS0dEAAAA
		AAAA+UO7fwAAAAlwSFlzAAALEgAACxIB0t1+/AAAAAd0SU1FB9kKAQ8fKPhaedoAAAAZdEVYdENv
		bW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAAAYElEQVQY022QMQ7AMAgDj/7/cRkzMLFkyZQP
		uEPbBCW1ZIHEySBMEoB4ZCwJwN3tAqi1Wh6kSu8de5P2tNlHBEjKzqK1hqQFufsBfUYSEbEDEyyl
		cKwZYxyJpnT53wsAblTelkjM2uttAAAAAElFTkSuQmCC
		}]
		
		set Priv(obj,hook) [$::twidget::Priv(prefix)::hook new]
		set Priv(obj,ibox) [$::twidget::Priv(prefix)::ibox new]
		
		foreach {name} [list prev1 prev2 next1 next2 list1 list2 cancel1 cancel2 close1 close2] {
			$Priv(obj,ibox) replace $name $Priv(img,$name)
		}
		
		set Priv(obj,hook,share) 0
		set Priv(obj,ibox,share) 0
		
		my Ui_Init
	}

	destructor {
		my variable Priv opts
		
		destroy $Priv(win,frame)
		if {$Priv(obj,hook,share) == 0} {$Priv(obj,hook) destroy}
		if {$Priv(obj,ibox,share) == 0} {$Priv(obj,ibox) destroy}
		
		array unset Priv
		array unset opts
	}
	
	method add {title win {tabicons ""} {closeicons ""}} {
		my variable Priv opts
		
		set tree $Priv(win,tree)
		set hook $Priv(obj,hook)		
		
		set item [$tree item create -button no -parent 0]
		$tree item style set $item 0 styPage
		$tree item lastchild 0 $item
		$tree item element configure $item 0 eTitle -text $title -data $win
		
		if {$tabicons != ""} {
			lassign $tabicons i1 i2
			$tree item element configure $item 0 eIcon  -image [list $i1 {selected} $i2 {}]	
		}	
		
		if {$closeicons != ""} {
			lassign $closeicons i1 i2
			$tree item element configure $item 0 eCancel  -image [list $i1 {selected} $i2 {}]	
		}
		
		set tabs [$tree item children 0]
		$hook invoke <Counter> [llength $tabs]
		
		$tree selection modify $item all
	
		#$hook invoke <Selection> $item
		
		return $item
	}	
	
	method cget {opt} {
		my variable Priv

		if {$opt == "-frame"} {return $Priv(win,frame)}
		if {$opt == "-wtree"} {return $Priv(win,tree)}
		if {$opt == "-body"} {return $Priv(win,body)}
		if {$opt == "-images"} {return [$Priv(obj,ibox) dump]}
		if {$opt == "-hookobject"} {return $Priv(obj,hook)}
		if {$opt == "-iboxobject"} {return $Priv(obj,ibox)}
		if {$opt == "-tabfg"} {return $opts(-tabfg)}
		if {$opt == "-tabbg"} {return $opts(-tabbg)}
		if {$opt == "-taboutline"} {return $opts(-taboutline)}		
		return [$Priv(win,tree) cget $opt]
	}
	
	method configure {args} {
	   my variable Priv opts
	   
		set tree $Priv(win,tree)
		
		set cmd [list $tree configure]
		
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
			
			if {$key == "-font"} {
				set opts(-font) $val
				set opts(-height) [expr 30 + ceil(abs([font configure $opts(-font) -size] - 10)*1.2)]
				$tree configure -font $opts(-font) -itemheight $opts(-height) -height $opts(-height)
				continue
			}
			if {$key == "-tabfg"} {
				set opts(-tabfg) $val
				$tree element configure eTitle -fill $opts(-tabfg)
				continue
			}
			if {$key == "-tabbg"} {
				set opts(-tabbg) $val
				$tree element configure eRect -fill $opts(-tabbg)
				continue
			}
			if {$key == "-taboutline"} {
				set opts(-taboutline) $val
				$tree element configure eRect -outline $opts(-taboutline)
				continue
			}
			lappend cmd $key $val
		}

		return [eval $cmd]
	}
	
	method count {} {
		my variable Priv
		
		return [expr [$Priv(win,tree) item count] -1]
	}
	
	method delete {{item ""}} {
		variable Priv
		
		if {$item == "all"} {return [my delete_all]}
		
		set tree $Priv(win,tree)
		set hook $Priv(obj,hook)
		
		if {$item == ""} {set item [$tree selection get]}
		if {$item == "" || [$tree item id $item] == ""} {return 0}
	
		set next [$tree item nextsibling $item]
		if {$next == ""} {set next [$tree item prevsibling $item]}

		set win [$tree item element cget $item 0 eTitle -data]
		if {[winfo exists $win]} {destroy $win}
	
		$tree item delete $item
	
		if {$next == ""} {
			my Tab_Position_Update
			$hook invoke <Count> [llength [$tree item children 0]]
			$hook invoke <Selection> ""
			return 1
		}
	
		$hook invoke <Count> [llength [$tree item children 0]]
		$tree selection modify $next all
		return 1
	}	
	
	method delete_all {} {
		my variable Priv
		set tree $Priv(win,tree)
		set items [$tree item children 0]
		foreach item $items {my delete $item}
		return
	}		
	
	method find {title} {
		my variable Priv
		set tree $Priv(win,tree)
		
		foreach item [$tree item children 0] {
			if {[$tree item element cget $item 0 eTitle -text] == $title} {
				return $item
			}
		}
		return ""
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
	
	
	
	method next {} {
		my variable Priv
		set tree $Priv(win,tree)
		
		set item [$tree selection get]
		
		set tabs [$tree item children 0]
		set idx [lsearch $tabs $item]
		if {$idx == -1} {return}
		if {$idx == [llength $tabs] -1 } {return}
		
		set next [lindex $tabs [incr idx]]

		$tree selection modify $next all
		return
	}	
	
	method prev {} {
		my variable Priv
		set tree $Priv(win,tree)
		
		set item [$tree selection get]
		
		set tabs [$tree item children 0]
		set idx [lsearch $tabs $item]
		if {$idx <= 0} {return}
		
		set prev [lindex $tabs [incr idx -1]]
		$tree selection modify $prev all
		return
	}	
	
	method scroll {cmd} {
		my scroll_$cmd
	}
	method scroll_next {} {
		my variable Priv
		set tree $Priv(win,tree)
		$tree xview scroll 1 pages
		return
	}
	
	method scroll_prev {} {
		my variable Priv
		set tree $Priv(win,tree)
		$tree xview scroll -1 pages
		return
	}	
	
	method selection {{item ""}} {
		my variable Priv

		set tree $Priv(win,tree)
		set body $Priv(win,body)

		if {$item == ""} { return [$tree selection get]}
		
		$tree selection modify $item all
		return $item
	}
	
	method tab {cmd item args} {
		return [my tab_$cmd $item {*}$args]
	}
	
	method tab_cget {item opt} {
		my variable Priv
		
		set tree $Priv(win,tree)
		
		if {$opt == "-window"} {return [$tree item element cget $item 0 eTitle -data]}
		if {$opt== "-text"} {return [$tree item element cget $item 0 eTitle -text]}
		if {$opt == "-fg"} {return [$tree item element cget $item 0 eTitle -fill]}
		if {$opt == "-bg"} {return [$tree item element cget $item 0 eRect -fill]}
		if {$opt == "-outline"} {return [$tree item element cget $item 0 eRect -outline]}
		if {$opt == "-closeimage"} {return [$tree item element cget $item 0  eCancel -image]}
		if {$opt == "-image"} {return [$tree item element cget $item 0 eIcon -image]}		
		return [$tree item element cget $item 0 eTitle $opt]
	}
	
	method tab_configure {item args} {
		my variable Priv opts
		
		set tree $Priv(win,tree)
		set body $Priv(win,body)
		
		foreach {key val} $args {
			if {$key== "-window"} {
				catch {destroy [$tree item element cget $item 0 eTitle -data]}
				$tree item element configure $item 0 eTitle -data $val
				pack $val -expand 1 -fill both -in $body
			}
			if {$key== "-text"} {$tree item element configure $item 0 eTitle -text $val}
			if {$key == "-fg"} {$tree item element configure $item 0 eTitle -fill $val}
			if {$key == "-bg"} {$tree item element configure $item 0 eRect -fill $val}
			if {$key == "-outline"} {$tree item element configure $item 0 eRect -outline $val}
			if {$key == "-closeimage"} {$tree item element configure $item 0  eCancel -image $val}
			if {$key == "-image"} {$tree item element configure $item 0 eIcon  -image $val}
			
		}
	}
	
	method tabs {} {
		my variable Priv
		
		set tree $Priv(win,tree)
		return [$tree item children 0]
	}	
	
	method Menu_Popup {X Y} {
		my variable Priv
		
		set tree $Priv(win,tree)
		set m $tree.list_menu
		if {[winfo exists $m]} {destroy $m}
		menu $m -tearoff 0
		set Priv(var,list_menu) [$tree selection get]
		foreach item [$tree item children 0] {
			set title [$tree item element cget $item 0 eTitle -text]
			$m add radiobutton \
				-label $title \
				-variable [self namespace]::Priv(var,list_menu) \
				-value $item \
				-command [list $tree selection modify $item all]
		}
		
		tk_popup $m $X $Y
	}	
	
	method Tab_Button_Click {btn x y} {
		my variable Priv
		set tree $Priv(win,tree)
	
		set ninfo [$tree identify $x $y]
	
		if {[llength $ninfo] != 6} {return -1}
		foreach {what item where column type name} $ninfo {}
		
		if {$btn == "LEFT" && $name == "eCancel" && [$tree item state get $item "selected"] == 1} {
			if {[$Priv(obj,hook) invoke <Delete> $item] == -1} {return -1}
			return $item
		}
		if {$btn == "CENTER" && $what == "item"} {
			if {[$Priv(obj,hook) invoke <Delete> $item] == -1} {return -1}
			return $item
		}
		return -1
	}

	method Tab_ButtonM_Click {x y} {
		my variable Priv
		set tree $Priv(win,tree)
	
		set ninfo [$tree identify $x $y]
	
		if {[llength $ninfo] != 6} {return}
		foreach {what item where column type name} $ninfo {}
		if {$item != "item"} {$Priv(obj,hook) invoke <Delete> $item}
	}

	method Tab_Position_Update {} {
		my variable Priv
		
		set tree $Priv(win,tree)
		set body $Priv(win,body)
		set hook $Priv(obj,hook)
		
		set tabs [$tree item children 0]
		set Priv(tabs) [llength $tabs]
		if {$tabs == ""} {
			$Priv(win,lblNext) configure -state disabled
			$Priv(win,lblCurr) configure -state disabled
			$Priv(win,lblPrev) configure -state disabled
			$Priv(win,lblList) configure -state disabled
			set Priv(tab,curr) "0/0"
			#$hook invoke <Selection> ""
			return
		}
		$Priv(win,lblNext) configure -state normal
		$Priv(win,lblCurr) configure -state normal
		$Priv(win,lblPrev) configure -state normal
		$Priv(win,lblList) configure -state normal	
	
		set item [$tree selection get]
		if {$item == ""} {
			set Priv(tab,curr) 0/$Priv(tabs)
			#$hook invoke <Selection> ""
			return
		}
		
		set idx [expr [lsearch $tabs $item] +1]
		set Priv(tab,curr) $idx/$Priv(tabs)
		
		#if {$Priv(tab,curr) != $Priv(tab,prev)} {$hook invoke <Selection> $item}
		
		set Priv(tab,prev) $Priv(tab,curr)
		 
		return
	}		
	
	method Tab_Selection_Change {item} {
		my variable Priv

		set tree $Priv(win,tree)
		set body $Priv(win,body)
		
		if {$item == ""} {return  ""}
		
		set win [pack slaves $body]
		if {[winfo exists $win]} {pack forget $win}
		
		set win [$tree item element cget $item 0 eTitle -data]
		if {[winfo exists $win]} {pack $win -expand 1 -fill both -in $body}
	
		$tree see $item
		
		my Tab_Position_Update
		
		focus [pack slaves $body]
		
		if {$item == 0} {set item ""}
		$Priv(obj,hook) invoke <Selection> $item
		
		return $item
	}		
	
	method Ui_Init {} {
		my variable Priv opts
	
		set ibox $Priv(obj,ibox)
	
		set nb [ttk::frame $Priv(win,frame)]

		set tree [treectrl $nb.nbtree \
			-font EzNotebookFont \
			-orient horizontal \
			-showroot no \
			-showline no \
			-selectmod single \
			-showrootbutton no \
			-showbuttons no \
			-showheader no \
			-highlightthickness 0 \
			-relief groove \
			-borderwidth 0 \
		]
	
		$tree column create -tag colHead
	
		$tree element create eTitle text -justify center \
			-lines 1 \
			-fill $opts(-tabfg)
			
		$tree element create eRect rect \
			-outlinewidth 1  \
			-outline $opts(-taboutline) \
			-fill $opts(-tabbg)
	
		set eCancel ""
		if {$opts(-close) == 1} {
			$tree element create eCancel image \
				-image [list [$ibox get close2] {selected} [$ibox get close1] {}]
			set eCancel "eCancel"
		}
		
		set eIcon ""
		if {$opts(-icon) == 1} {
			$tree element create eIcon image
			set eIcon "eIcon"
		}
		
		$tree style create styPage
		$tree style elements styPage "eRect $eIcon eTitle $eCancel"
		if {$opts(-icon) == 1} {
			$tree style layout styPage eIcon -visible [list 1 {selected} 0 {}] -ipadx {10 0} -expand ns -pady {4 2}
		}	
		$tree style layout styPage eTitle -iexpand news -ipadx {10 10} -ipady 7 -pady {4 2}
		if {$opts(-close) == 1} {
			$tree style layout styPage eCancel -visible [list 1 {selected} 0 {}] -ipadx {0 10} -expand ns -pady {4 2}
		}
		$tree style layout styPage eRect -union "$eIcon eTitle $eCancel" -padx 1		
	
		$tree notify bind $tree <Selection> [list [self object] Tab_Selection_Change %S]
		
#		$tree notify install <Drag-begin>
#		$tree notify install <Drag-receive>
#		$tree notify install <Drag-end>	

#		TreeCtrl::SetEditable $tree {}
#		TreeCtrl::SetSensitive $tree {{colHead styPage eTitle}}
#		TreeCtrl::SetDragImage $tree {{colHead styPage eRect}}
#		bindtags $tree [list $tree TreeCtrlFileList TreeCtrl]
#		set ::TreeCtrl::Priv(DirCnt,$tree) 1
#	
#		$tree notify bind $tree <Drag-begin> {
#			set ::TreeCtrl::Priv(DragItem) [%T selection get]
#			set ::TreeCtrl::Priv(DragRecv) ""
#		}
#		$tree notify bind $tree <Drag-receive> {
#			set ::TreeCtrl::Priv(DragRecv) %I
#		}	
#		$tree notify bind $tree <Drag-end> {
#			if {$::TreeCtrl::Priv(DragRecv)  != ""} {
#				%T item prevsibling $::TreeCtrl::Priv(DragRecv) $::TreeCtrl::Priv(DragItem)
#			}
#			after idle [list %T selection modify $::TreeCtrl::Priv(DragItem) all]
#		}				
		
		
		bind $tree <<ButtonLClick>> [list [self object]  Tab_Button_Click "LEFT" %x %y]
		bind $tree <<TabClose>>  [list [self object]  Tab_Button_Click "CENTER" %x %y]		
		
		set lblPrev [ttk::label $nb.prev -image [$ibox get prev1] -state disabled -anchor center]
		set lblCurr [ttk::label $nb.curr \
			-textvariable [self namespace]::Priv(tab,curr) \
			-state disabled \
			-anchor center]
		set lblNext [ttk::label $nb.next -image [$ibox get next1] -state disabled -anchor center]
		set lblList [ttk::label $nb.list -image [$ibox get list1] -state disabled -anchor center]
		
		bind $lblNext <<ButtonLRelease>> [list [self object] next]
		bind $lblPrev <<ButtonLRelease>> [list [self object] prev]
		bind $lblList <<ButtonLRelease>> [list [self object] Menu_Popup %X %Y]
		
		foreach {item name} [list $lblNext next $lblPrev prev $lblList list] {
			bind $item <<ButtonLPress>> +[list %W configure -image [$ibox get ${name}2]]
			bind $item <<ButtonLRelease>> +[list %W configure -image [$ibox get ${name}1]]
			bind $item <Enter> [list %W configure -relief groove]
			bind $item <Leave> [list %W configure -relief flat]		
		}
		
		::tooltip::tooltip $lblList [::msgcat::mc "List All Pages"]
		::tooltip::tooltip $lblNext [::msgcat::mc "Next Page"]
		::tooltip::tooltip $lblPrev [::msgcat::mc "Previous Page"]
		
		set body [ttk::frame $nb.body -height 100 -borderwidth 2 -relief groove]
		
		
		grid $tree -row 0 -column 0 -sticky "news"
		if {$opts(-control) == 1} {
			grid $lblPrev -row 0 -column 1 -sticky "news" -ipadx 2 -padx 1
			grid $lblCurr -row 0 -column 2 -sticky "news" -padx 2
			grid $lblNext -row 0 -column 3 -sticky "news" -ipadx 2 -padx 1
			grid $lblList -row 0 -column 4 -sticky "news" -ipadx 2  -padx 2
		}
		grid $body -row 1 -column 0 -columnspan 5 -sticky "news" -ipadx 2 -ipady 2
		grid rowconfigure $nb 1 -weight 1 
		grid columnconfigure $nb 0 -weight 1		
		
		$Priv(obj,hook) define <Selection>
		# 這個事件在頁面切換時觸發
		# 附加參數: 
		# 	itemId => 頁面id
			
	
		$Priv(obj,hook) define <Count>
		# 這個事件在頁面的數量改變時觸發
		# 附加參數: 
		# 	count => 頁面的數量	
		
		$Priv(obj,hook) define <Delete>
		# 這個事件在頁面被刪除前被觸發
		# 附加參數
		# itemId => 頁面id
		# 說明: 接收這個事件的程序必需回傳0或1
		# 	0 -> 中斷刪除
		# 	1 -> 允許刪除
		
		set Priv(evt,names) [list <Selection> <Count> <Delete>]
		
		set Priv(tab,curr) 0
		set Priv(tab,prev) 0
		set Priv(tab,tabs) 0
		set Priv(win,lblNext) $lblNext
		set Priv(win,lblPrev) $lblPrev
		set Priv(win,lblList) $lblList
		set Priv(win,lblCurr) $lblCurr
		set Priv(win,tree) $tree
		set Priv(win,body) $body		
		
		my configure -font $opts(-font)
		
	}
}

oo::define $::twidget::Priv(prefix)::notebook export \
Tab_Button_Click Tab_Selection_Change Menu_Popup Tab_ButtonM_Click

