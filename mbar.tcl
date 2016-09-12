
oo::class create ::dApp::mbar {
	constructor {wpath} {
		my variable Priv
		array set Priv [list]

		set Priv(obj,ibox) [::twidget::ibox new]
		set Priv(obj,ibox,share) 0 

		my Ui_Init $wpath
	}

	destructor {
		my variable Priv
		
		destroy $Priv(win,menubar)
		if {$Priv(obj,ibox,share) == 0} {$Priv(obj,ibox) destroy}		
		
		array unset Priv
	}		
	
	method binding_setup {} {
		my variable Priv

		$::dApp::Obj(ezdit) make_locale_menu $Priv(menu,options_languages)
		$::dApp::Obj(nbe) make_format_menu $Priv(menu,options_format)
		$::dApp::Obj(nbe) make_encoding_menu $Priv(menu,options_encoding)
		$::dApp::Obj(nbe) make_editor_menu $Priv(menu,options_editor)
		$::dApp::Obj(run) make_options_menu $Priv(menu,options_console)
		
		set Priv(var,fmeB) [$::dApp::Obj(layout) frame state "B"]
		set Priv(var,fmeL) [$::dApp::Obj(layout) frame state "L"]
		set Priv(var,fmeR) [$::dApp::Obj(layout) frame state "R"]
	}
	
	method cget {opt} {
		my variable Priv

		if {$opt == "-menubar"} {return $Priv(win,menubar)}
		if {$opt == "-hookobject"} {return $Priv(obj,hook)}
		if {$opt == "-iboxobject"} {return $Priv(obj,ibox)}
		return [$Priv(win,menubar) cget $opt]
	}
	
	method make_console_menu {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		
		set m2 $m.font
		if {[winfo exists $m2]} {destroy $m2}
		menu $m2 -tearoff 0
		
		$m add cascade  -compound left \
			-label [::msgcat::mc "Font"] \
			-image [$ibox get empty] \
			-menu $m2
			#-command 
			
		$m2 add command \
			 -compound left \
	 		-label [::msgcat::mc "Increase Size"] \
	 		-image [$ibox get empty] \
	 		-command {$::dApp::Obj(ezdit) font incr console}

		$m2 add command \
			-compound left \
	 		-label [::msgcat::mc "Descrease Size"] \
	 		-image [$ibox get empty] \
	 		-command {$::dApp::Obj(ezdit) font decr console}
	 	
	 	$m2 add separator
	 	
		$m2 add command \
			-compound left \
	 		-label [::msgcat::mc "Details..."] \
	 		-image [$ibox get empty] \
	 		-command {$::dApp::Obj(ezdit) font set console}
	}
	
	method make_ui_menu {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set Priv(menu,options_ui_font) [menu $m.ui_font -tearoff 0]
		
		$m add cascade -compound left \
			-label [::msgcat::mc "Adjust Font"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,options_ui_font)
			
		set m2 $Priv(menu,options_ui_font)

		if {$::dApp::Env(os) != "darwin"} {
		 	$m2 add command -compound left \
		 		-label [::msgcat::mc "Menu Font..."] \
		 		-image [$ibox get empty] \
		 		-command {$::dApp::Obj(ezdit) font set menu}
		}

		$m2 add separator
		
	 	$m2 add command -compound left \
	 		-label [::msgcat::mc "Small Font..."] \
	 		-image [$ibox get empty] \
	 		-command {$::dApp::Obj(ezdit) font set small}
	 		
	 	$m2 add command -compound left \
	 		-label [::msgcat::mc "Middle Font..."] \
	 		-image [$ibox get empty] \
	 		-command {$::dApp::Obj(ezdit) font set middle}
	 		
	 	$m2 add command -compound left \
	 		-label [::msgcat::mc "Large Font..."] \
	 		-image [$ibox get empty] \
	 		-command {$::dApp::Obj(ezdit) font set large}
	 		
		
#	 	$m2 add command -compound left \
#	 		-label [::msgcat::mc "Console Font..."] \
#	 		-image [$ibox get empty] \
#	 		-command {$::dApp::Obj(ezdit) font set console}		


	}
	
	method Edit_Init {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		

		$m add command -compound left \
			-label [::msgcat::mc "Undo"] \
			-accelerator "Ctrl+z" \
			-image [$ibox get empty] \
			-command {$dApp::Obj(nbe) editor undo}
		set Priv(edit,undo) [$m index end]
		
		$m add command -compound left \
			-label [::msgcat::mc "Redo"] \
			-image [$ibox get empty] \
			-command {$dApp::Obj(nbe) editor redo}
		set Priv(edit,redo) [$m index end]		
		
		$m add separator
		
		$m add command -compound left \
			-label [::msgcat::mc "Cut"] \
			-image [$ibox get empty] \
			-accelerator "Ctrl+x" \
			-command {$dApp::Obj(nbe) editor cut}
		set Priv(edit,cut) [$m index end]
	
		$m add command -compound left \
			-label [::msgcat::mc "Copy"] \
			-image [$ibox get empty] \
			-accelerator "Ctrl+c" \
			-command {$dApp::Obj(nbe) editor copy}
		set Priv(edit,copy) [$m index end]
		
		$m add command -compound left \
			-label [::msgcat::mc "Paste"] \
			-image [$ibox get empty] \
			-accelerator "Ctrl+v" \
			-command {$dApp::Obj(nbe) editor paste}
		set Priv(edit,paste) [$m index end]
			
		$m add command -compound left \
			-label [::msgcat::mc "Delete"] \
			-image [$ibox get empty] \
			-accelerator "Delete" \
			-command {$dApp::Obj(nbe) editor delete}
		set Priv(edit,delete) [$m index end]
		
		$m add command -compound left \
			-label [::msgcat::mc "Select All"]	\
			-image [$ibox get empty]\
			-accelerator "Ctrl+a" \
			-command {$dApp::Obj(nbe) editor selection set 1.0 end}
		set Priv(edit,select_all) [$m index end]
		
		# Line Operations
		set mlops [menu $m.lops -tearoff 0]
		set Priv(menu,edit_lops) $mlops	
		$m add cascade -compound left \
			-label [::msgcat::mc "Line Operations"] \
			-image [$ibox get empty] \
			-menu $mlops
		set Priv(edit,line_ops) [$m index end]
		
		$mlops add command -compound left \
			-accelerator "Ctrl+k" \
			-label [::msgcat::mc "Cut Current Line"]	\
			-image [$ibox get empty] \
			-command {$dApp::Obj(nbe) editor cut_line}
			
		$mlops add command -compound left \
			-accelerator "Ctrl+y" \
			-label [::msgcat::mc "Copy Current Line"]	\
			-image [$ibox get empty] \
			-command {$dApp::Obj(nbe) editor copy_line}
		
		$mlops add command -compound left \
			-accelerator "Ctrl+p" \
			-label [::msgcat::mc "Paste As New Line"]	\
			-image [$ibox get empty] \
			-command {$dApp::Obj(nbe) editor paste_line}
	
		$mlops add command -compound left \
			-accelerator "Ctrl+j" \
			-label [::msgcat::mc "Move Down Current Line"]	\
			-image [$ibox get empty]\
			-command {$dApp::Obj(nbe) editor move_down}
		
		$mlops add command -compound left \
			-accelerator "Ctrl+i" \
			-label [::msgcat::mc "Move Up Current Line"]	\
			-image [$ibox get empty] \
			-command {$dApp::Obj(nbe) editor move_up}
			
		$mlops add separator

		$mlops add command -compound left \
			-label [::msgcat::mc "Trim Trailing Space"]	\
			-image [$ibox get empty] \
			-command {$dApp::Obj(nbe) editor trim_space}
						
		$m add separator	
		
		# Marks
		set mMarks [menu $m.marks -tearoff 0]
		set Priv(menu,edit_marks) $mMarks
		$m add cascade -compound left \
			-label [::msgcat::mc "Marks"] \
			-image  [$ibox get empty] \
			-menu $mMarks
		set Priv(edit,marks) [$m index end]
				
		$mMarks add command -compound left \
			-accelerator "F9" \
			-label [::msgcat::mc "Toggle Mark"]	\
			-image [$ibox get empty] \
			-command {$dApp::Obj(nbe) editor mark_toggle}
			
		$mMarks add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Shift+F9" \
			-label [::msgcat::mc "Previous Mark"] \
			-command {$dApp::Obj(nbe) editor mark_prev}
			
		$mMarks add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Ctrl+F9" \
			-label [::msgcat::mc "Next Mark"] \
			-command {$dApp::Obj(nbe) editor mark_next}
			
		$mMarks add separator
		
		$mMarks add command -compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Clear All Marks"] \
			-command {$dApp::Obj(nbe) editor mark_clear}				
			
		$m add separator
		
		$m add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Ctrl+g" \
			-label [::msgcat::mc "Goto Line..."] \
			-command {$dApp::Obj(nbe) goto}
		set Priv(edit,goto) [$m index end]
			
		$m add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Ctrl+f" \
			-label [::msgcat::mc "Find/Replace"] \
			-command {$dApp::Obj(nbe) find}
		set Priv(edit,find) [$m index end]
		
		$m add command -compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Find In Files..."] \
			-command {::wfind::show ._dapp_find}
		set Priv(edit,find_in_files) [$m index end]		
		
		$m add command -compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Jump to Matching Brace"] \
			-command {$dApp::Obj(nbe) editor bracket_find}
		set Priv(edit,bracket_find) [$m index end]
			
		$m add command -compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Select to Matching Brace"] \
			-command {$dApp::Obj(nbe) editor bracket_select}					
		set Priv(edit,bracket_select) [$m index end]
		
		$m add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Ctrl+Period" \
			-label [::msgcat::mc "Increase Line Indent"] \
			-command {$dApp::Obj(nbe) editor indent_add}
		set Priv(edit,indent_add) [$m index end]
			
		$m add command -compound left \
			-image [$ibox get empty] \
			-accelerator "Ctrl+Comma" \
			-label [::msgcat::mc "Decrease Line Indent"] \
			-command {$dApp::Obj(nbe) editor indent_delete}		
		set Priv(edit,indent_delete) [$m index end]
		
		$m add separator
		
		$m add command -compound left \
			-label [::msgcat::mc "Add Block Comment"] \
			-image [$ibox get empty] \
			-command {$dApp::Obj(nbe) editor comment_add}
		set Priv(edit,comment_add) [$m index end]
	
		$m add command -compound left \
			-label [::msgcat::mc "Remove Block Comment"] \
			-image [$ibox get empty] \
			-command  {$dApp::Obj(nbe) editor comment_delete}
		set Priv(edit,comment_delete) [$m index end]
	
	}
	method Edit_Post {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set nbe $::dApp::Obj(nbe)
		set editor [$nbe editor]
		
		set cut [$nbe count]
		set state "normal"
		if {$cut == 0} {set state "disabled"}
		foreach {key val} [array get Priv edit,*] {$m entryconfigure $val -state $state}
		
		while {[$m index end] != $Priv(edit,comment_delete)} {$m delete end}
		
		if {$cut == 0} {
			$m entryconfigure $Priv(edit,find_in_files) -state "normal"
			return
		}
		
		set sel [$nbe editor selection get]
		if {$sel == ""} {
			$m entryconfigure $Priv(edit,cut) -state "disabled"
			$m entryconfigure $Priv(edit,copy) -state "disabled"
			$m entryconfigure $Priv(edit,delete) -state "disabled"
		}
		
		if {[catch {clipboard get}]} {
			$m entryconfigure $Priv(edit,paste) -state disabled		
		}
		
		if {[$nbe editor bracket state] == ""} {
			$m entryconfigure $Priv(edit,bracket_find) -state disabled
			$m entryconfigure $Priv(edit,bracket_select) -state disabled
		}
		
		if {$editor == "" || [$editor cget -comment] == ""} {
			$m entryconfigure $Priv(edit,comment_add) -state disabled
			$m entryconfigure $Priv(edit,comment_delete) -state disabled
		}
		
		foreach obj [info class instances ::dApp::mbar::EditMenu] {$obj create $m}
		
		if {[$m index end] != $Priv(edit,comment_delete)} {
			$m insert [expr $Priv(edit,comment_delete) + 1] separator
		}
	}
	
	method File_Init {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set Priv(menu,file_add) [menu $m.add -tearoff 0]
		set Priv(menu,file_recent_files) [menu $m.recent_files -tearoff 0]
		set Priv(menu,file_recent_projects) [menu $m.recent_projects -tearoff 0]

#		$m add cascade -compound left -state "normal" \
#			-label [::msgcat::mc "New"] \
#			-image [$ibox get new] \
#			-menu $Priv(menu,file_add)
#		set Priv(file,new) [$m index end]
		$m add command -compound left   \
			-image [$ibox get empty] \
			-label [::msgcat::mc "New File"] \
			-command {$::dApp::Obj(nbe) new}

		$m add command -compound left   \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Open File..."] \
			-command {$::dApp::Obj(nbe) open}
		
		$m add separator		
		
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Save"] \
			-accelerator "Ctrl+s" \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(nbe) save}
		set Priv(file,save) [$m index end]
		
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Save As..."] \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(nbe) save_as}
		set Priv(file,save_as) [$m index end]
		
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Save All"] \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(nbe) save_all}
		set Priv(file,save_all) [$m index end]
		
		$m add separator		
		
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Close"] \
			-accelerator "Ctrl+w" \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(nbe) close}
		set Priv(file,close) [$m index end]
		
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Close All"] \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(nbe) close_all}
		set Priv(file,close_all) [$m index end]
		
		$m add separator
		
		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Recent Files"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,file_recent_files)		

		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Recent Projects"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,file_recent_projects)
			
		$m add command -compound left -state "normal" \
			-image [$ibox get empty] \
			-accelerator "Ctrl+q" \
			-label [::msgcat::mc "Quit"] \
			-command {$::dApp::Obj(ezdit) quit}
		
		return 1
	}
	
	method File_Post {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set nbe $::dApp::Obj(nbe)
		set pmgr $::dApp::Obj(pmgr)
		
		$Priv(menu,file_add) delete 0 end
		$Priv(menu,file_add) add command -compound left   \
			-label [::msgcat::mc "Project..."] \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(pmgr) new}
		$pmgr make_add_menu $Priv(menu,file_add)
		
		foreach {key val} [array get Priv file,*] {$m entryconfigure $val -state normal}
		
		# save
		if {[$nbe editor modified] != 1} {
			$m entryconfigure $Priv(file,save) -state "disabled"
		}
		
		if {[$nbe selection] == ""} {
			$m entryconfigure $Priv(file,close) -state "disabled"
			$m entryconfigure $Priv(file,save_as) -state "disabled"
			$m entryconfigure $Priv(file,save_all) -state "disabled"
			$m entryconfigure $Priv(file,close_all) -state "disabled"
		}
	
		while {[$m index end] != $Priv(file,close_all)} {$m delete end}
		
		foreach obj [info class instances ::dApp::mbar::FileMenu] {$obj create $m}
		#if {[$m index end] != $Priv(file,close_project)} {$m add separator}
		
		$m add separator
		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Recent Files"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,file_recent_files)

		$Priv(menu,file_recent_files) delete 0 end
		$nbe make_history_menu $Priv(menu,file_recent_files)			

		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Recent Projects"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,file_recent_projects)

		$Priv(menu,file_recent_projects) delete 0 end
		$pmgr make_history_menu $Priv(menu,file_recent_projects)

		$m add separator

		$m add command -compound left -state "normal" \
			-image [$ibox get empty] \
			-accelerator "Ctrl+q" \
			-label [::msgcat::mc "Quit"] \
			-command {$::dApp::Obj(ezdit) quit}

		return 1
	}
	
	method Help_Init {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		
		$m add command -compound left -state "normal" \
		-label [::msgcat::mc "Check for updates..."] \
		-image [$ibox get empty] \
		-command {
			set win .mbar_update
			if {![winfo exists $win]} {
				set dlg [::dApp::update new $win]
				$dlg show
				$dlg destroy
			}
		}
		
		$m add separator
		
		$m add command -compound left -state "normal" \
		-label [::msgcat::mc "About..."] \
		-image [$ibox get empty] \
		-command {
			set win .mbar_about
			if {![winfo exists $win]} {
				set dlg [::dApp::about new $win]
				$dlg show
				$dlg destroy
			}
		}
		
		return
	}	
	
	method Help_Post {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		
		$m delete 0 end
		foreach obj [info class instances ::dApp::mbar::HelpMenu] {
			$obj create $m
		}


		$m add command -compound left -state "normal" \
		-label [::msgcat::mc "Check for updates..."] \
		-image [$ibox get empty] \
		-command {
			set win .mbar_update
			if {![winfo exists $win]} {
				set dlg [::dApp::update new $win]
				$dlg show
				$dlg destroy
			}
		}
		
		$m add separator
		
		$m add command -compound left -state "normal" \
		-label [::msgcat::mc "About"] \
		-image [$ibox get empty] \
		-command {
			set win .mbar_about
			if {![winfo exists $win]} {
				set dlg [::dApp::about new $win]
				$dlg show
				$dlg destroy
			}
		}

		return 0
	}

	method Options_Init {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		
		set Priv(menu,options_languages) [menu $m.lang -tearoff 0]
		set Priv(menu,options_encoding) [menu $m.enc -tearoff 0]
		set Priv(menu,options_format) [menu $m.format -tearoff 0]
		set Priv(menu,options_plugins) [menu $m.plug -tearoff 0]
		set Priv(menu,options_editor) [menu $m.editor -tearoff 0]
		set Priv(menu,options_ui) [menu $m.ui -tearoff 0]
		set Priv(menu,options_console) [menu $m.console -tearoff 0]
		set Priv(menu,options_assistant) [menu $m.assistant -tearoff 0]

				
		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Languages"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,options_languages)
		set Priv(options,languages) [$m index end]
		
		$m add separator
		
		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Plugins"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,options_plugins)
		set Priv(options,plugins) [$m index end]
		
		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Editor"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,options_editor)
		set Priv(options,editor) [$m index end]
		
		$m add cascade -compound left \
			-label [::msgcat::mc "Console"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,options_console)
		set Priv(options,console) [$m index end]	
		my make_console_menu $Priv(menu,options_console)

			
		$m add cascade -compound left \
			-label [::msgcat::mc "User Interface"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,options_ui)
		set Priv(options,ui) [$m index end]
		my make_ui_menu $Priv(menu,options_ui)
		#$::dApp::Obj(ezdit) make_theme_menu $Priv(menu,options_ui)
		
		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Default File Format"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,options_format)
		set Priv(options,options_format) [$m index end]		
		
		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Default Encoding"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,options_encoding)
		set Priv(options,encoding) [$m index end]
		
		$m add separator
		
		$m add cascade -compound left \
			-label [::msgcat::mc "Coding Assistant"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,options_assistant)	
			set Priv(options,assistant) [$m index end]
		
		set m2 $Priv(menu,options_assistant)	
		
		$m2 add checkbutton -compound left \
			-label [::msgcat::mc "Syntax Highlighting"] \
			-onvalue 1 -offvalue 0 \
			-variable ::dApp::Param(syntaxHighlight)
			
		$m2 add checkbutton -compound left \
			-label [::msgcat::mc "Syntax Hint"] \
			-onvalue 1 -offvalue 0 \
			-variable ::dApp::Param(syntaxHint)

		$m2 add checkbutton -compound left \
			-label [::msgcat::mc "Code Outline"] \
			-onvalue 1 -offvalue 0 \
			-variable ::dApp::Param(codeOutline)
			
		$m2 add checkbutton -compound left \
			-label [::msgcat::mc "Sort Symbol"] \
			-onvalue 1 -offvalue 0 \
			-variable ::dApp::Param(sortSymbol)					
	
	}
	
	method Options_Post {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set nbe $dApp::Obj(nbe)
		
		$Priv(menu,options_plugins) delete 0 end
		foreach plugin [info class instances ::dApp::plugin] {
			set dir [$plugin pwd]
			if {[string first "_" [file tail $dir]] == 0} {continue}
	  		$Priv(menu,options_plugins) add checkbutton \
	  			-compound left  \
	  			-state normal \
	  			-offvalue 0 \
	  			-onvalue 1 \
				-label [$plugin name] \
				-variable [self namespace]::Priv(var,$plugin) \
				-command [list $plugin toggle]
			set Priv(var,$plugin) [$plugin state]
		}		
		
		while {[$m index end] != $Priv(options,assistant)} {$m delete end}
		
		foreach obj [info class instances ::dApp::mbar::OptionsMenu] {$obj create $m}
		
		if {[$m index end] != $Priv(options,assistant)} {
			$m insert  [expr $Priv(options,assistant) + 1] separator
		}		
				
	}
	
	method Project_Init {m} {
		variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set Priv(menu,project_active) [menu $m.active -tearoff 0]
		set Priv(menu,project_close) [menu $m.close -tearoff 0]
		set Priv(menu,project_view)  [menu $m.view -tearoff 0]
		
		$Priv(menu,project_view) add radiobutton  \
			-label [::msgcat::mc "All Projects"] \
			-value "ALL" \
			-variable [self namespace]::Priv(pmgr,viewFlag) \
			-command {$::dApp::Obj(pmgr) view_set "ALL"}
			
		$Priv(menu,project_view) add radiobutton  \
			-label [::msgcat::mc "Active Project"] \
			-value "CURRENT" \
			-variable [self namespace]::Priv(pmgr,viewFlag) \
			-command { $::dApp::Obj(pmgr) view_set "CURRENT"}
		
		$m add cascade \
			-label [::msgcat::mc "View"] \
			-menu $Priv(menu,project_view)
			
		$m add separator
		
		$m add command -compound left   \
			-image [$ibox get empty] \
			-label [::msgcat::mc "New Project..."] \
			-command {$::dApp::Obj(pmgr) new}						
		$m add command -compound left   \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Open Project..."] \
			-command {$::dApp::Obj(pmgr) open}
		
		#$m add separator
		$m add cascade -compound left \
			-label [::msgcat::mc "Close Project"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,project_close)
		set Priv(project,close) [$m index end]		
		
		$m add separator
		
		$m add command -compound left -state normal \
			-label [::msgcat::mc "Sort Projects"] \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(pmgr) sort}	
		set Priv(project,sort) [$m index end]		
		
		$m add command -compound left -state normal \
			-label [::msgcat::mc "Collapse All"] \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(pmgr) collapse}	
		set Priv(project,collapse) [$m index end]				
		
		$m add separator
		
		$m add cascade -compound left \
			-label [::msgcat::mc "Active Project"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,project_active)
		set Priv(project,make_active) [$m index end]				

		
	}
	
	method Project_Post {m} {
		variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set nbe $::dApp::Obj(nbe)
		set pmgr $::dApp::Obj(pmgr)
		
		set Priv(pmgr,viewFlag) [$::dApp::Obj(pmgr) view_set]

		$m entryconfigure $Priv(project,sort) -state "disabled"
		$m entryconfigure $Priv(project,collapse) -state "disabled"
		$m entryconfigure $Priv(project,make_active) -state "disabled"
		$m entryconfigure $Priv(project,close) -state "disabled"
		$Priv(menu,project_active) delete 0 end
		$m entryconfigure $Priv(project,make_active) -state "disabled"
		$Priv(menu,project_close) delete 0 end
		
		set projects [$pmgr projects]
		if { $projects != ""} {
			$m entryconfigure $Priv(project,collapse) -state "normal"
			$m entryconfigure $Priv(project,sort) -state "normal"
			$m entryconfigure $Priv(project,make_active) -state "normal"
			$m entryconfigure $Priv(project,close) -state "normal"
			set Priv(var,active_project) [$pmgr active]
			foreach prj $projects {
				$Priv(menu,project_close) add command \
					-compound left \
					-image [$ibox get empty] \
					-label $prj \
					-command [list $pmgr close $prj]
				$Priv(menu,project_active)  add radiobutton \
					-variable [self namespace]::Priv(var,active_project) \
					-value $prj \
					-compound left \
					-label $prj \
					-command [list $pmgr active $prj]
			}
				
		}
		
		while {[$m index end] != $Priv(project,make_active)} {$m delete end}
		
		foreach obj [info class instances ::dApp::mbar::ProjectMenu] {$obj create $m}		
		
	}
	
	method Tools_Init {m} {
		variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set Priv(menu,tools_recent) [menu $m.recent -tearoff 0]
		set Priv(menu,tools_kill) [menu $m.kill -tearoff 0]

		
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Run Command..."] \
			-accelerator "F4" \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(run) show}
		set Priv(tools,run) [$m index end]	
		
		bind . <Key-F4> [list $m invoke [$m index end]]
		
		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Recent Commands"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,tools_recent)
		set Priv(tools,recent_cmds) [$m index end]
		
		$m add cascade -compound left -state "normal" \
			-label [::msgcat::mc "Kill Running Command"] \
			-image [$ibox get empty]  \
			-menu $Priv(menu,tools_kill)
		set Priv(tools,kill_cmds) [$m index end]	
	
	}
	
	method Tools_Post {m} {
		variable Priv
		
		set ibox $::dApp::Obj(ibox)		
		
		foreach {key val} [array get Priv tools,*] {$m entryconfigure $val -state "normal"}
		
		$Priv(menu,tools_recent) delete 0 end
		set cut [$::dApp::Obj(run) make_history_menu $Priv(menu,tools_recent)]
		if {$cut == 0} {
			$m entryconfigure $Priv(tools,recent_cmds) -state "disabled"
		}
		
		$Priv(menu,tools_kill) delete 0 end
		set cut [$::dApp::Obj(run) make_kill_menu $Priv(menu,tools_kill)	]
		if {$cut == 0} {
			$m entryconfigure $Priv(tools,kill_cmds) -state "disabled"
		}
		
		while {[$m index end] != $Priv(tools,kill_cmds)} {$m delete end}
		
		foreach obj [info class instances ::dApp::mbar::ToolsMenu] {$obj create $m}
		
		if {[$m index end] != $Priv(tools,kill_cmds)} {
			$m insert  [expr $Priv(tools,kill_cmds) + 1] separator
		}
		
	}
	
	method Ui_Init {wpath} {
		my variable Priv
		set mbar [menu $wpath -type menubar -font $::dApp::Font(menu)]
		
		lappend map \
			File [::msgcat::mc "File"] \
			Edit [::msgcat::mc "Edit"] \
			View [::msgcat::mc "View"] \
			Project [::msgcat::mc "Project"] \
			Tools [::msgcat::mc "Tools"] \
			Options [::msgcat::mc "Options"] \
			Window [::msgcat::mc "Window"] \
			Help [::msgcat::mc "Help"]
		
		foreach {key msg} $map {
			set m $wpath.m$key
			menu $m -tearoff 0 -postcommand [list [self object] ${key}_Post $m]
			my ${key}_Init $m
			$mbar add cascade -label $msg -menu $m

			oo::class create ::dApp::mbar::${key}Menu {method create {m} {return 0}}
		}

		set Priv(win,menubar) $mbar
		
		return $wpath
	}		
	
	method View_Init {m} {
		variable Priv
		
		set ibox $::dApp::Obj(ibox)
		
		set Priv(menu,view_panes) [menu $m.panes -tearoff 0]
		
#	 	$m add command -compound left \
#	 		-label [::msgcat::mc "Zoom In"] \
#	 		-accelerator [::msgcat::mc "Ctrl++"] \
#	 		-image [$ibox get empty] \
#	 		-command {$::dApp::Obj(nbe) font incr}
#	
#	 	$m add command -compound left \
#	 		-label [::msgcat::mc "Zoom Out"] \
#	 		-accelerator [::msgcat::mc "Ctrl+-"] \
#	 		-image [$ibox get empty] \
#	 		-command {$::dApp::Obj(nbe) font decr}
#	 		
#	 	$m add separator
	 		
		$m add cascade -compound left \
			-label [::msgcat::mc "Panes"] \
			-image [$ibox get empty] \
			-menu $Priv(menu,view_panes)
		set Priv(view,panes) [$m index end]
		
		$m add separator
		
		$m add checkbutton -compound left \
			-onvalue 1 \
			-offvalue 0 \
			-label [::msgcat::mc "Left Frame"] \
			-variable [self namespace]::Priv(var,fmeL) \
			-command {$::dApp::Obj(layout) frame toggle L}
		set Priv(view,fmeL) [$m index end]	
		
		$m add checkbutton -compound left \
			-onvalue 1 \
			-offvalue 0 \
			-label [::msgcat::mc "Right Frame"] \
			-variable [self namespace]::Priv(var,fmeR) \
			-command {$::dApp::Obj(layout) frame toggle R}
		set Priv(view,fmeR) [$m index end]
		
		$m add checkbutton -compound left \
			-onvalue 1 \
			-offvalue 0 \
			-variable [self namespace]::Priv(var,fmeB) \
			-label [::msgcat::mc "Bottom Frame"] \
			-command {$::dApp::Obj(layout) frame toggle B}
		set Priv(view,panedwinb) [$m index end]
		
		$m add separator
		
		$m add checkbutton -compound left \
			-label [::msgcat::mc "Line Numbers"] \
			-variable [self namespace]::Priv(var,linebox) \
			-command {$::dApp::Obj(nbe) linebox toggle}
		set Priv(view,linebox) [$m index end]
	
	}
	method View_Post {m} {
		my variable Priv
		
		set layout $::dApp::Obj(layout)
		
		$Priv(menu,view_panes) delete 0 end
		$layout make_pane_menu $Priv(menu,view_panes)
		
		while {[$m index end] != $Priv(view,panedwinb)} {$m delete end}
		
		foreach obj [info class instances ::dApp::mbar::ViewMenu] {$obj create $m}	
		
		$m add separator
		
		$m add checkbutton -compound left \
			-label [::msgcat::mc "Line Numbers"] \
			-variable [self namespace]::Priv(var,linebox) \
			-command {$::dApp::Obj(nbe) linebox toggle}
		set Priv(var,linebox) [$::dApp::Obj(nbe) linebox state]
		
		
	}
	method Window_Init {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
				
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Close"] \
			-image [$ibox get empty] \
			-accelerator [::msgcat::mc "Ctrl+w"] \
			-command {$::dApp::Obj(nbe) close}
		set Priv(window,close) [$m index end]
		
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Close All"] \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(nbe) close_all}

		set Priv(window,close_all) [$m index end]
		
		$m add separator 
		
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Next File"] \
			-image [$ibox get empty] \
			-accelerator [::msgcat::mc "Ctrl+Right"] \
			-command {$::dApp::Obj(nbe) next}
		set Priv(window,next) [$m index end]			
		
		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Previous File"] \
			-image [$ibox get empty] \
			-accelerator [::msgcat::mc "Ctrl+Left"] \
			-command {$::dApp::Obj(nbe) prev}
			set Priv(window,prev) [$m index end]
	}
	method Window_Post {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set nbe $::dApp::Obj(nbe)
		
		set cut [$nbe count]
		set state "normal"
		if {$cut == 0} {set state "disabled"}
		foreach {key val} [array get Priv window,*] {$m entryconfigure $val -state $state}
		
		while {[$m index end] != $Priv(window,prev)} {$m delete end}
		foreach obj [info class instances ::dApp::mbar::WindowMenu] {$obj create $m}
				
		if {[$nbe tabs] != ""} {$m add separator}
		$nbe make_tab_menu $m

	}
	export File_Post Edit_Post View_Post Project_Post Tools_Post Options_Post Window_Post Help_Post 
}
	  
set ::dApp::Obj(mbar) [::dApp::mbar new .mbar]
. configure -menu [$::dApp::Obj(mbar) cget -menubar]
