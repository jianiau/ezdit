oo::class create ::dApp::pmgr {
	superclass ::twidget::treeview
	constructor {} {
		my variable Priv
		
		array set Priv [list \
			sn 0 \
			lastopen "" \
			history,max 10 \
			history,list [list] \
			cp,flag "" \
			cp,fpath "" \
			cp,item "" \
			view,flag "ALL" \
		]
		
		next .pmgr
	
		$::dApp::Obj(layout) pane add "L" [::msgcat::mc "Projects"] .pmgr

		my configure -iboxobject $::dApp::Obj(ibox)
		
		my Tree_Init
	}
	
	destructor {
		my variable Priv
		array unset Priv
	}
	
	method active {{fpath ""}} {
		my variable Priv
		
		set hook [my cget -hookobject]
		set tree [my cget -wtree]
		
		if {$fpath == ""} {
			foreach child [$tree item children 0] {
				if {[$tree item state get $child ACTIVE] == 1} {
					 lassign [$tree item element cget $child 0 txt -data] fpath mtime
					 return $fpath
				}
			}
			return ""
		}
		
		if {[set item [my item_find $fpath]] == ""} {return}
		
		foreach child [$tree item children 0] {$tree item state set $child !ACTIVE}
		
		$tree item state set $item ACTIVE
		
		$hook invoke <ProjectActive> $fpath
		
		my view_update
		
		return $fpath
	}
	
	method add_text {item} {
		variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]
		lassign [my item cget $item -data] fpath mtime
		if {![file isdirectory $fpath]} {return}
		
		set i 0
		set f "New Text.txt"
		while {[file exists [file join $fpath $f]]} {
			incr i
			set f "New Text - $i.txt"
		}
		
		$tree item expand $item
		set fpath [file join $fpath $f]
		close [open $fpath w]
		
		set child [my item add $item [file tail $fpath] \
			-data [list $fpath 0] \
			-open 0 \
			-openimage [$ibox get file] \
			-closeimage [$ibox get file]]
			
		::TreeCtrl::FileListEdit $tree $child ctree txt
		return 
	}	
	
	method add_folder {item} {
		variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]
		lassign [my item cget $item -data] fpath mtime
		if {![file isdirectory $fpath]} {return}
		
		set i 0
		set dir "New Folder"
		while {[file exists [file join $fpath $dir]]} {
			incr i
			set dir "New Folder - $i"
		}
			
		$tree item expand $item
		set dir [file join $fpath $dir]
		file mkdir $dir		
		
		set child [my item add $item [file tail $dir] \
			-data [list $dir 0] \
			-open 0 \
			-button yes \
			-openimage [$ibox get folder-open] \
			-closeimage [$ibox get folder-close]]
			
		::TreeCtrl::FileListEdit $tree $child ctree txt
		return 
	}
	

	method add_import {item} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]
		lassign [my item cget $item -data] fpath mtime
		if {![file isdirectory $fpath]} {return}
		
		set srcfile [tk_getOpenFile \
			-title [::msgcat::mc "Add File (%s)" $fpath] \
			-filetypes {{{All Files} {*}}}]
		if {$srcfile == "" || $srcfile == "-1"} {return}
		
	
		set target [file join $fpath [file tail $srcfile]]
		if {[file exists $target]} {
			set ans [tk_messageBox \
				-icon question \
				-title [::msgcat::mc "Question"] \
				-message  [::msgcat::mc "'%s' already exists, would you like to replace the existing file?" $target ] \
				-default no \
				-type yesno]			
	   		if {$ans == "no"} {return}
	   	}
	   	
	   	$tree item expand $item
	   	file copy -force $srcfile $target

		set child [my item add $item [file tail $target] \
			-data [list $target 0] \
			-open 0 \
			-openimage [$ibox get file] \
			-closeimage [$ibox get file]]
			
		::TreeCtrl::FileListEdit $tree $child ctree txt		
		
	}	
	
	method add_templ {item templ} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]
		lassign [my item cget $item -data] fpath mtime
		if {![file isdirectory $fpath]} {return}
		
		$tree item expand $item
		set f [$templ create $fpath]
		
		set child [my item add $item [file tail $f] \
			-data [list $f 0] \
			-open 0 \
			-openimage [$ibox get file] \
			-closeimage [$ibox get file]]
			
		::TreeCtrl::FileListEdit $tree $child ctree txt
	}
	
	method close {{fpath ""} {force 0}} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set hook [my cget -hookobject]
		set tree [my cget -wtree]
		
		if {$fpath == ""} {
			set item [my selection get]
		} else {
			set item [my item_find $fpath]
		}
		if {$item == ""} {return}
		
		if {[$tree item parent $item] != 0} {return}
		lassign [my item cget $item -data] fpath mtime
		
		set fname [file tail $fpath]
		if {$force == 0} {
			
			set ans [tk_messageBox \
				-icon question \
				-title [::msgcat::mc "Question"] \
				-message [::msgcat::mc "Are you sure, you want to close '%s' project ?" $fname] \
				-default no \
				-type yesno]
			if {$ans == "no"} {return}
		}
		
		set ret [$hook invoke <Before-ProjectClose> $fpath]
		if {$ret == -1} {return}
	
		my Item_Delete $item
		
		$hook invoke <After-ProjectClose> $fpath
	
		if {[my active] == ""} {
			set child [$tree item firstchild 0]
			if {$child != ""} {	
				lassign [my item cget $child -data] fpath mtime
				my active $fpath
			}
		}
		
		return
	}	
	
	method collapse {} {
		my variable Priv
		set tree [my cget -wtree]
		foreach item [$tree item children 0] {$tree collapse $item}

	}
	
	method copy {} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]
		set item [$tree selection get]
		
		set Priv(cp,flag) ""
		if {$item == ""} {return}
		lassign [my item cget $item -data] fpath mtime
		
		set Priv(cp,flag) "COPY"
		set Priv(cp,item) $item
		set Priv(cp,fpath) $fpath
		
		$::dApp::Obj(sbar) put [::msgcat::mc "Copied %s" [file tail $fpath]]
		
		return 
	}
	
	method cut {} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]				
		set item [$tree selection get]
		
		set Priv(cp,flag) ""
		if {$item == ""} {return}
		lassign [my item cget $item -data] fpath mtime
		
		set Priv(cp,flag) "CUT"
		set Priv(cp,item) $item
		set Priv(cp,fpath) $fpath
		
		$::dApp::Obj(sbar) put [::msgcat::mc "Cut %s" [file tail $fpath]]
		
		return 
	}
	
	method current {} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]				
		set item [$tree selection get]	
		if {$item == ""} {return}
		lassign [my item cget $item -data] fpath mtime
		return $fpath		
	}
	
	method delete {} {
		my variable Priv
		
		set nbe $::dApp::Obj(nbe)
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]				
		set item [$tree selection get]
		if {$item == ""} {return}
		
		lassign [my item cget $item -data] fpath mtime
		if {![file exists $fpath]} {return}
		
		set msg [::msgcat::mc "Are you sure you want to delete '%s' ?" [file tail $fpath]]
		if {[$tree item parent $item] == 0} {
			set msg [::msgcat::mc "Are you sure you want to delete the Project (%s)?" [file tail $fpath]]
		}
		set ans [tk_messageBox \
			-icon question \
			-title [::msgcat::mc "Question"] \
			-message $msg \
			-default no \
			-type yesno]
		if {$ans == "no"} {return}
		
		if {[$tree item parent $item] == 0} {
			my close $fpath 1
		} else {
			my Item_Delete $item
		}
		
		if {[file isfile $fpath]} {$nbe delete $fpath}
		
		file delete -force $fpath
		
		return 
	}
	
	method history {cmd args} {
		my variable Priv
		
		return [my history_$cmd {*}$args]
	}
	
	method history_list {} {
		my variable Priv
		return $Priv(history,list)
	}
	
	method history_clear {} {
		my variable Priv
		set Priv(history,list) [list]
		return
	}
	
	method item_find {fpath} {
		my variable Priv
		
		set tree [my cget -wtree]
		foreach item [$tree item children 0] {
			lassign [$tree item element cget $item 0 txt -data] f t
			if {$fpath == $f} {return $item}
		}
		
		return ""
	}	
	
	method make_add_menu {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set item [my selection get]
		set fpath ""
		if {$item != ""} {lassign [my item cget $item -data] fpath mtime}
				
		set state "disabled"
		if {[file isdirectory $fpath]} {set state "normal"}
		
		$m add command -compound left  -state $state \
			-label [::msgcat::mc "Folder"] \
			-image [$ibox get empty] \
			-command [list [self object] add_folder $item]
			
		$m add command -compound left  -state $state \
			-label [::msgcat::mc "Text File"] \
			-image [$ibox get empty] \
			-command [list [self object] add_text $item]
		
		foreach templ [info class instances ::dApp::templ::file] {
	  		$m add command -compound left  -state $state \
				-label [$templ name] \
				-image [$templ icon] \
				-command [list [self object] add_templ $item $templ]
		}

	   $m add separator

	  	$m add command -compound left  -state $state \
			-label [::msgcat::mc "Existing File..."] \
			-image [$ibox get empty] \
			-command [list [self object] add_import $item]
	}
	
	method make_history_menu {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set cut 0
		if {$Priv(history,list) == ""} {return $cut}
		foreach {item} $Priv(history,list) {
			$m add command -compound left \
				-image [$ibox get empty] \
				-label $item \
				-command [list [self object] open $item]
			incr cut
		}
		$m add separator
		$m add command -compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Clear"] \
			-command [list set [self namespace]::Priv(history,list) [list]]
		
		return [incr cut 2]
	}
	
	method new {} {
		set dlg [::dApp::pmgrProjectNew new .pmgr_prj_new]
		$dlg show 600x400
		$dlg destroy
	}	
	
	method open {{fpath ""}} {
		my variable Priv

		set tree [my cget -wtree]
		set ibox $::dApp::Obj(ibox)
		set hook [my cget -hookobject]
		set parent 0
		
		if {[file isfile $fpath]} {return ""}
	
		if {$fpath == ""} {
			set fpath [tk_chooseDirectory \
				-initialdir $Priv(lastopen) \
				-title [::msgcat::mc "Open Project"] \
				-mustexist 1 ]
			if {![file exists $fpath]} {return ""}		
		}
		
		if {![file exists $fpath]} {return}
		set fpath [file normalize $fpath]
		
		foreach {item} [$tree item children 0] {
			lassign [my item cget $item -data] f m
			if {$f == $fpath} {
				my selection set $item
				return $f
			}
		}
		
		set ret [$hook invoke <Before-ProjectOpen> $fpath]
		if {$ret == -1} {return}
		
		set fname [file tail $fpath]
		
		set item [my item add $parent $fname \
			-data [list $fpath 0] \
			-button yes \
			-open 0 \
			-openimage [$ibox get folder-open] \
			-closeimage [$ibox get folder-close]]		
		
		my History_Add $fpath
		
		set Priv(lastopen) [file dirname $fpath]
		
		$hook invoke <After-ProjectOpen> $fpath
	
		if {[my active] == ""} {
			set child [$tree item firstchild 0]
			if {$child != ""} {	
				lassign [my item cget $child -data] fpath mtime
				my active $fpath
			}
		}
	
		return $item
	}	
	
	method paste {} {
		my variable Priv
	
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]				
		set item [$tree selection get]
		if {$item == "" || $Priv(cp,flag) == "" || ![file exists $Priv(cp,fpath)]} {return}
		lassign [my item cget $item -data] fpath mtime

		if {[file isfile $fpath]} {return}
		if {$fpath == $Priv(cp,fpath)} {return}
		
		set targetDir $fpath
		set targetItem $item
		set srcFPath $Priv(cp,fpath)
		set srcFName [file tail $srcFPath]
		set newFPath [file join $targetDir $srcFName]
		set openimg file
		set closeimg file
		set btn 0
		if {[file isdirectory $srcFPath]} {
			set openimg folder-open
			set closeimg folder-close
			set btn 1
		}
	
		if {![file exists $newFPath]} {
			file copy -force $srcFPath $newFPath
			if {$Priv(cp,flag) == "CUT"} {
				file delete -force $srcFPath
				my Item_Delete $Priv(cp,item)
				set Priv(cp,flag) ""
				set Priv(cp,item) ""
				set Priv(cp,fpath) ""
			}
			
			set newItem [my item add $targetItem [file tail $newFPath] \
				-data [list $newFPath 0] \
				-open 0 \
				-button $btn \
				-openimage [$ibox get $openimg] \
				-closeimage [$ibox get $closeimg]]
			
			$::dApp::Obj(sbar) put [::msgcat::mc "Pasted %s" [file tail $fpath]]
			return
		}
	
		set dlg [::twidget::dialog new ._input_dialog \
			-title [::msgcat::mc "Question"] \
			-default "rename" \
			-type "inputbox" \
			-position center \
			-value $srcFName \
			-icon [$ibox get folder] \
			-message [::msgcat::mc "The '%s' already exists in the directory. What do you want to do?" $srcFName] \
			-detail [::msgcat::mc "Rename:"] \
			-buttons [list rename [::msgcat::mc "Rename"]  \
									replace [::msgcat::mc "Replace"]  \
									cancel [::msgcat::mc "Cancel"] ] \
		]
		
		lassign [$dlg show] code txt
		$dlg destroy
			
		if {$code == "cancel"} {return}
		if {$code == "rename"} {
			set newFPath [file join $targetDir $txt]
			if {[file exists $newFPath]} {
				set ans [tk_messageBox \
					-icon error \
					-title [::msgcat::mc "Error"] \
					-message [::msgcat::mc "The '%s' already exists in the directory." [file tail $newFPath]] \
					-default ok \
					-type ok]
				return
			}
		}
		
		#replace process
		if {$srcFPath == $newFPath} {return}
		
		file copy -force $srcFPath $newFPath
		if {$Priv(cp,flag) == "CUT"} {
			file delete -force $srcFPath
			my Item_Delete $Priv(cp,item)
			set Priv(cp,flag) ""
			set Priv(cp,item) ""
			set Priv(cp,fpath) ""
		}
		if {$code == "rename"} {

			set newItem [my item add $targetItem [file tail $newFPath] \
				-data [list $newFPath 0] \
				-open 0 \
				-button $btn \
				-openimage [$ibox get $openimg] \
				-closeimage [$ibox get $closeimg]]
		}
		$::dApp::Obj(sbar) put [::msgcat::mc "Pasted %s" [file tail $newFPath]]
		return 
	}
	
	method projects {} {
		my variable Priv
		
		set tree [my cget -wtree]
		set ret [list]
		
		foreach item [$tree item children 0] {
			 lassign [$tree item element cget $item 0 txt -data] fpath mtime
			 lappend ret $fpath
		}
		return $ret
	}
	
	method rc_load {} {
		my variable Priv
	
		set rc $::dApp::Obj(rc)

		foreach fpath [$rc get "Pmgr.Projects"] {
			if {![file exists $fpath]} {continue}
			my open $fpath
		}
		
		set fpath [$rc get "Pmgr.Active"]
		if {[file exists $fpath]} {my active $fpath}
		
		set flag [$rc get "Pmgr.ViewFlag"]
		if {$flag != ""} {		set Priv(view,flag) $flag}
		if {$flag == "CURRENT"} {my view_update} 
			
	}	
	
	method rc_save {} {
		my variable Priv

		set tree [my cget -wtree]
		set rc $::dApp::Obj(rc)
		
		set fpath [$::dApp::Obj(nbe) selection]
		if {$fpath != ""} {
			$rc set "Nbe.Selection" $fpath
			
	
			$rc delete "Nbe.Files"
			foreach {fpath} [$::dApp::Obj(nbe) files] {
			 	$rc append "Nbe.Files" $fpath
			}
		}
		
		set fpath [my active]
		if {$fpath != ""} { $rc set "Pmgr.Active" $fpath}
		
		$rc set "Pmgr.ViewFlag" $Priv(view,flag)
		
		$rc delete "Pmgr.Projects"
		foreach {item} [$tree item children 0] {
			lassign [$tree item element cget $item 0 txt -data] fpath mtime
			$rc append "Pmgr.Projects" $fpath
		}
		
	}	
	
	method rename {item newName} {
		my variable Priv
	
		set nbe $::dApp::Obj(nbe)
		set ibox $::dApp::Obj(ibox)
		set hook [my cget -hookobject]
		
		set tree [my cget -wtree]
	
		lassign [my item cget $item -data] fpath mtime

		set newPath [file join [file dirname $fpath] $newName]
		
		if {$newPath == $fpath} {return}
		
		if {[file exists $newPath]} {
			tk_messageBox \
				-icon error \
				-title [::msgcat::mc "Error"] \
				-message [::msgcat::mc "File name already exists."] \
				-default ok \
				-type ok
			return
		}
	
		file rename $fpath $newPath

		my item configure $item -data [list $newPath [file mtime $newPath]] -text $newName
		if {[file isdirectory $newPath]} {my Folder_Scan $item}	
		return
	}
	
	method refresh {{item ""}} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]
		if {$item == ""} {set item [$tree selection get]}
		if {$item == ""}  {return}
		my Folder_Scan $item
		
		return
	}
	
	method sort {} {
		my variable Priv
		
		set tree [my cget -wtree]		
		$tree item sort root -column ctree -dictionary -increasing
	}
	
	method type {{fpath ""}} {
		my variable Priv
		
		set tree [my cget -wtree]
		if {$fpath == ""} {
			set item [my selection get]
		} else {
			set item [my item_find $fpath]
		}
		if {$item == ""} {return ""}
		
		if {[$tree item parent $item] == 0} {return "PROJECT"}
		return "ITEM"
	}	
	
	method view_set {{flag ""}} {
		my variable Priv
		if {$flag in [list "CURRENT" "ALL"]} {
			set Priv(view,flag) $flag
			my view_update
		}
		return $Priv(view,flag)
	}
	
	method view_update {} {
		my variable Priv
		
		set flag 0
		if {$Priv(view,flag) == "ALL"} {set flag 1}
		
		set tree [my cget -wtree]
		
		foreach child [$tree item children 0] {
			if {[$tree item state get $child ACTIVE] == 1} {
				$tree item configure $child -visible 1
				continue
			}
			$tree item configure $child -visible $flag
		}
		
	}
	
	method ButtonL_DClick {x y} {
		my variable Priv
		
		set nbe $::dApp::Obj(nbe)
		set ibox $::dApp::Obj(ibox)
		set hook [my cget -hookobject]
		
		set tree [my cget -wtree]
	
		set ninfo [$tree identify $x $y]
		if {[llength $ninfo] != 6} {return}
		foreach {what item where column type name} $ninfo {}
		if {$what == "item"} {$tree selection modify $item all}	
		
		lassign [my item cget $item -data] fpath mtime
		
		if {[file isdirectory $fpath]} {
			$tree toggle $item
			return
		}
		lassign [my item cget $item -data] fpath mtime
		$nbe open $fpath
		
	}		

	method Folder_Open {item} {
		my variable Priv
		
		set nbe $::dApp::Obj(nbe)
		set ibox $::dApp::Obj(ibox)
		set hook [my cget -hookobject]
		
		lassign [my item cget $item -data] fpath mtime
		
		if {[file isfile $fpath]} {return ""}
		
		if {![file exists $fpath]} {
			tk_messageBox \
				-icon warning \
				-title [::msgcat::mc "Warning"] \
				-message [::msgcat::mc "The '%s' already delete from the filesystem." [file tail $fpath]] \
				-default ok \
				-type ok
			my Item_Delete $item
			return ""
		}		

		if {$mtime == [file mtime $fpath]} {return}
		
		my Folder_Scan $item
		my item configure $item -data [list $fpath $mtime]

	}
	
	method Folder_Scan {parent} {
		my variable Priv

		set nbe $::dApp::Obj(nbe)
		set ibox $::dApp::Obj(ibox)
		set hook [my cget -hookobject]
		
		set tree [my cget -wtree]
		lassign [my item cget $parent -data] fpath mtime
		
		if {[file isfile $fpath]} {return}
		
		foreach item [$tree item children $parent] {my Item_Delete $item}
		
		foreach f [lsort [glob -nocomplain -directory $fpath -types {f} -- *]] {
			set fname [file tail $f]
			set item [my item add $parent [file tail $f] \
				-data [list $f 0] \
				-open 0 \
				-openimage [$ibox get file] \
				-closeimage [$ibox get file]]
		}
		
		foreach f [lsort [glob -nocomplain -directory $fpath -types {d} -- *]] {
			set item [my item add $parent [file tail $f] \
				-data [list $f 0] \
				-open 0 \
				-button yes \
				-openimage [$ibox get folder-open] \
				-closeimage [$ibox get folder-close]]
		}
	}	
	
	method History_Add {fpath} {
		my variable Priv
		
		set cut 1
		set newlist [list $fpath]
		foreach item $Priv(history,list) {
			if {$item == $fpath || ![file exists $item]} {continue}
			lappend newlist $item
			if {[incr cut] >= $Priv(history,max)} {break}
		}
		
		set Priv(history,list) $newlist
		
		return
	}	
	
	method Item_Delete {item} {
		my variable Priv
		
		set tree [my cget -wtree]
		set hook [my cget -hookobject]
		
		foreach subitem [$tree item children $item] {
				my Item_Delete $subitem
		}
	 
		$tree item delete $item
	}		
	
	method Item_Menu_Popup {item X Y} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]

		$tree selection modify $item all
		lassign [my item cget $item -data] fpath mtime

		set m $tree.m
		if {[winfo exists $m]} {destroy $m}
		menu $m -tearoff 0	
	
		set m2 $m.add_menu
		if {[winfo exists $m2]} {destroy $m2}
		menu $m2 -tearoff off
		
		my make_add_menu $m2
	   	
	  	set state "normal"
		if {[file isfile $fpath] } {set state "disabled"}	
		$m add cascade -compound left \
			-label [::msgcat::mc "Add"] \
			-image [$ibox get add_item] \
			-state $state -menu $m2
		
		$m add separator
			
		set state "normal"
		$m add command -compound left -state $state \
			-label [::msgcat::mc "Cut"] \
			-accelerator "Ctrl+x" \
			-image [$ibox get empty] \
			-command [list [self object] cut]	
		$m add command -compound left  -state $state \
			-label [::msgcat::mc "Copy"] \
			-accelerator "Ctrl+c" \
			-image [$ibox get empty] \
			-command [list [self object] copy]	
			
		set state "normal" 
		if {$Priv(cp,item) == "" || [file isfile $fpath] } {set state "disabled"}
		$m add command -compound left  -state $state \
			-label [::msgcat::mc "Paste"] \
			-accelerator "Ctrl+v" \
			-image [$ibox get empty] \
			-command [list [self object] paste]
	
		set state "normal"
		$m add command -compound left  -state $state \
			-label [::msgcat::mc "Delete"] \
			-accelerator "Delete" \
			-image [$ibox get empty] \
			-command [list [self object] delete]

		$m add command -compound left -state $state \
			-label [::msgcat::mc "Rename"] \
			-image [$ibox get empty] \
			-accelerator "F2" \
			-command [list ::TreeCtrl::FileListEdit $tree $item ctree txt]
		
		foreach obj [info class instances ::dApp::pmgr::ItemMenu] {$obj create $m}
		
		$m add separator
	
		if {[$tree item parent $item] == 0} {
			set m2 $m.sort_menu
			if {[winfo exists $m2]} {destroy $m2}
			menu $m2 -tearoff off
	
			$m2 add command -compound left \
				-label [::msgcat::mc "Move to Top"] \
				-image [$ibox get empty] \
				-command [list $tree item firstchild 0 $item]
			$m2 add command -compound left \
				-label [::msgcat::mc "Move Up"] \
				-image [$ibox get empty] \
				-command [list catch [list $tree item prevsibling [$tree item prevsibling $item] $item]]
			$m2 add command -compound left \
				-label [::msgcat::mc "Move Down"] \
				-image [$ibox get empty] \
				-command [list catch [list $tree item nextsibling  [$tree item nextsibling $item] $item]]
			$m2 add command -compound left \
				-label [::msgcat::mc "Move to Bottom"] \
				-image [$ibox get empty] \
				-command [list $tree item lastchild 0 $item]
			
			$m add command -compound left \
				-label [::msgcat::mc "Make Active"] \
				-image [$ibox get empty] \
				-command [list [self object] active $fpath]
			$m add cascade -compound left \
				-label [::msgcat::mc "Arrange Project"] \
				-image [$ibox get empty] \
				-menu $m2		
			$m add command -compound left \
				-label [::msgcat::mc "Close Project"] \
				-image [$ibox get empty] \
				-command [list [self object] close $fpath]
			$m add separator
		}
		
		set state "normal" 
		if {[file isfile $fpath] } {set state "disabled"}		
		$m add command -compound left  -state $state \
			-label [::msgcat::mc "Refresh"] \
			-image [$ibox get empty] \
			-command [list [self object] refresh $item]	
			
		tk_popup $m $X $Y
	}
	
	method Tree_Menu_Popup {X Y} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)
		set tree [my cget -wtree]
		
		set m $tree.m
		catch {destroy $m}
		menu $m -tearoff 0
		
		catch {destroy $m.view}
		set mView [menu $m.view -tearoff 0]
		$mView add radiobutton  \
			-label [::msgcat::mc "All Projects"] \
			-value "ALL" \
			-variable [self namespace]::Priv(view,flag) \
			-command [list [self object] view_update]
			
		$mView add radiobutton  \
			-label [::msgcat::mc "Active Project"] \
			-value "CURRENT" \
			-variable [self namespace]::Priv(view,flag) \
			-command [list [self object] view_update]
		
		$m add cascade -compound left \
			-label [::msgcat::mc "View"] \
			-image [$ibox get empty] \
			-menu $mView
		
		$m add separator
		
		$m add command -compound left \
			-label [::msgcat::mc "New Project..."] \
			-image [$ibox get empty] \
			-command [list [self object] new]
				
		$m add command \
			-compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Open Project..."] \
			-state normal  \
			-command [list [self object] open]	
		
		set state "normal"
		if {[$tree item children 0] == ""} {set state "disabled"}	
		$m add command -compound left -state $state \
			-label [::msgcat::mc "Sort Projects"] \
			-image [$ibox get empty] \
			-command [list [self object] open]
			
		$m add separator
		
		set state "normal"
		if {[$tree item children 0] == ""} {set state "disabled"}
		$m add command -compound left -state $state \
			-label [::msgcat::mc "Collapse All"] \
			-image [$ibox get empty] \
			-command [list [self object] collapse]			
	
		foreach obj [info class instances ::dApp::pmgr::TreeMenu] {$obj create $m}
				
		tk_popup $m $X $Y		
	}	
	
	method Tree_Init {} {
		my variable Priv
		
		set tree [my cget -wtree]
		
		set ibox $::dApp::Obj(ibox)
		
		$tree state define ACTIVE

		set f [font create \
			-size [font configure EzTreeviewFont -size] \
			-family  [font configure EzTreeviewFont -family] \
			-weight bold \
		]
		$tree element configure txt \
			-font [list $f {ACTIVE} EzTreeviewFont {}]
		$tree element create img2 image \
			-image [list [$ibox get active] {ACTIVE} [$ibox get empty] {}]

		$tree style elements style {rect img txt img2}
		$tree style layout style img -padx {0 0} -expand ns
		$tree style layout style txt -padx {4 0} -expand ns
		$tree style layout style img2 -padx {0 0} -expand s
		$tree style layout style rect -union {txt} -iexpand ns -ipadx 2 -ipady 2
		
		
		$tree notify install <Edit-begin>
		$tree notify install <Edit-accept>
		$tree notify install <Edit-end>			 
		
		TreeCtrl::SetEditable $tree {{ctree style txt}}
		
		$tree notify bind $tree <Edit-begin> {
			%T item element configure %I %C rect -draw no + txt -draw no
		}
		$tree notify bind $tree <Edit-accept> [list [self object] rename %I %t]
		$tree notify bind $tree <Edit-end> {
			%T item element configure %I %C rect -draw yes + txt -draw yes
		}
		
		#bind $tree <<MenuPopup>> [list ::pmgr::menu_popup %x %y %X %Y]
		$tree notify bind $tree <Expand-after> [list [self object] Folder_Open %I]
		bind $tree <Double-Button-1> [list [self object] ButtonL_DClick %x %y]		
		
		bind $tree <F2> {
			set tree %W
			set item [$tree selection get]
			if {$item != ""} {::TreeCtrl::FileListEdit $tree $item ctree txt}
		}
		
		foreach {e fun} [list \
			"<<Cut>>" cut \
			"<<Paste>>" paste \
			"<<Copy>>" copy \
			"<Key-Delete>" delete] {
			bind $tree $e [list [self object] $fun]
		}
		
	}
	
	export Folder_Open ButtonL_DClick
}

oo::class create ::dApp::pmgrProjectNew {
	superclass ::twidget::dialog
	constructor {wpath} {
		my variable Priv
		array set Priv [list]
		
		next $wpath \
			-title [::msgcat::mc "New"]  \
			-default ok \
			-cancel 1 \
			-position auto \
			-buttons [list \
				ok [::msgcat::mc "Ok"] \
				cancel [::msgcat::mc "Cancel"] \
				]
	}
	
	destructor {
		my variable Priv
		next
		array unset Priv
	}		
	
	method body {fme} {
		my variable Priv
		
		ttk::style configure Pmgr.Treeview 	-rowheight 32
		
		set ibox $::dApp::Obj(ibox)
		set lblTempl [ttk::label $fme.lbltempl -text [::msgcat::mc "Templates:"] -anchor w -justify left]
		set tree [ttk::treeview $fme.tree -show tree \
		-height 1 \
		-selectmode browse -padding 3 -style Pmgr.Treeview]
		set vs [ttk::scrollbar $fme.vs -command [list $tree yview] -orient vertical]
		set hs [ttk::scrollbar $fme.hs -command [list $tree xview] -orient horizontal]
		$tree configure -xscrollcommand [list $hs set] -yscrollcommand [list $vs set]
		::autoscroll::autoscroll $vs
		::autoscroll::autoscroll $hs		
		set fmePath [ttk::frame $fme.fmePath]
		set fmeBtn [ttk::frame $fme.fmeBtn]	
		
		set Priv(tree) $tree
		
		grid $lblTempl - -padx 2 -pady 2 -sticky "news"
		grid $tree $vs -padx 2 -pady 2 -sticky "news"
		grid $hs - -padx 2 -pady 2 -sticky "news"
		grid $fmePath - -padx 2 -pady 2 -sticky "news"
		grid $fmeBtn - -padx 2 -pady 2 -sticky "news"
		
		grid rowconfigure $fme 1 -weight 1
		grid columnconfigure $fme 0 -weight 1
		
		
		set Priv(prjName) [::msgcat::mc "New Project"]
		set Priv(prjPwd) [pwd]
		set i 1
		set fpath [file join $Priv(prjPwd) $Priv(prjName)]
		while {[file exists $fpath]} {
			set Priv(prjName) [::msgcat::mc "New Project - %s" [incr i]]
			set fpath [file join $Priv(prjPwd) $Priv(prjName)]
		}
		
		set lblName [ttk::label $fmePath.lblName -text [::msgcat::mc "Project Name:"] -anchor w -justify left]
		set txtName [ttk::entry $fmePath.txtName -textvariable [self namespace]::Priv(prjName)]
		set lblPwd [ttk::label $fmePath.lblPwd -text [::msgcat::mc "Workspace:"] -anchor w -justify left]
		set txtPwd [ttk::entry $fmePath.txtPwd -textvariable [self namespace]::Priv(prjPwd)]
		set btnPwd [ttk::button $fmePath.btnPwd -text [::msgcat::mc "Browse"] \
			-command [format {
			set ans [tk_chooseDirectory -title [::msgcat::mc "Choose Directory"] -mustexist 1]
			if {$ans != "" && $ans != "-1"} {set %s $ans}
		}  [self namespace]::Priv(prjPwd)]]
		
		focus $txtName
		$txtName selection range 0 end
		
		grid $lblName $txtName - -sticky "news" -padx 2 -pady 2
		grid $lblPwd $txtPwd $btnPwd -sticky "we" -padx 2 -pady 2
		grid columnconfigure $fmePath 1 -weight 1
		
		set cut 0
		foreach templ [info class instances ::dApp::templ::project] {
			$tree insert {} end -id $templ -text [$templ name] -image [$templ icon]
			if {$cut == 0} {$tree select set $templ}
		}	
	}
	
	method close {ret} {
		my variable Priv
		
		if {$ret != "ok"} {return [next $ret]}
		
		set dir [file join $Priv(prjPwd) $Priv(prjName)]
		if {[file executable $dir]} {
			tk_messageBox \
				-icon warning \
				-title [::msgcat::mc "Error"] \
				-message [::msgcat::mc "%s already exists! Please change the project name." $Priv(prjName)] \
				-type ok
			return
		}
		
		if {[catch {file mkdir $dir}] == 1} {return [next -1]}
		
		set templ [lindex [$Priv(tree) selection] 0]
		if {[$templ create $dir] != 1} {return [next -1]}
		
		$::dApp::Obj(pmgr) open $dir		
		
		next 1
	}
	
}

oo::class create ::dApp::pmgr::ItemMenu {method create {m} {return 0}}
oo::class create ::dApp::pmgr::TreeMenu {method create {m} {return 0}}

set ::dApp::Obj(pmgr) [::dApp::pmgr new]


