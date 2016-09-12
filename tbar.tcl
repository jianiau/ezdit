
oo::class create ::dApp::tbar {
	superclass ::twidget::toolbar

	constructor {} {
		my variable Priv

		array set Priv [list]

		set fmeT [$::dApp::Obj(layout) cget -fmeT]

		next $fmeT.tbar -relief flat -borderwidth 0

		pack [my cget -frame]  -pady 0 -padx 0 -anchor center -fill x -side top 
		pack [ttk::separator $fmeT.sep -orient horizontal -takefocus 0] -fill x -side top

		my Ui_Init
	}

	destructor {
	}

	method binding_setup {} {
		my variable Priv
		$::dApp::Obj(nbe) hook install <Selection> [list [self object] Nbe_Selection_Cb]
		$::dApp::Obj(nbe) hook install <Editor-Focus> [list [self object] Editor_Focus_Cb]
		$::dApp::Obj(nbe) hook install <Editor-Cursor> [list [self object] Editor_Cursor_Cb]
		$::dApp::Obj(nbe) hook install <Editor-Document> [list [self object] Editor_Document_Cb]
		$::dApp::Obj(run) hook install <Count> [list [self object] Run_Count_Cb]
	}

	method cget {opt} {
		my variable Priv

		if {$opt == "-frame"} {return $Priv(win,frame)}

		return [$Priv(win,frame) cget $opt]
	}

	method item {cmd args} {
		return [my item_$cmd {*} $args]
	}

	method item_cget {item args} {
		my variable Priv
		return [eval $Priv($item) cget {*}$args]
	}

	method item_configure {item args} {
		my variable Priv
		return [eval $Priv($item) configure {*}$args]
	}

	method Btn_KillCmd_Click {} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)

		set btn $Priv(KillCmd)

		set pslist [$::dApp::Obj(run)  ps_list]
		if {[llength $pslist] == 1} {
			lassign [lindex $pslist 0] id cmd
			$::dApp::Obj(run) ps_kill $id
			return
		}

		if {[winfo exists $btn.popupMenu]} {destroy $btn.popupMenu}
		set m [menu $btn.popupMenu -tearoff 0]

		set cut [$::dApp::Obj(run) make_kill_menu $m	]

		set geo [winfo geometry $btn]
		lassign [split $geo "x"] w geo
		lassign [split $geo "+"] h x y
		set x [winfo rootx $btn]
		incr y [winfo rooty $btn]

		tk_popup $m $x [expr $y + $h]
	}

	method Btn_Marks_Click {} {
		my variable Priv
		$::dApp::Obj(nbe) editor mark toggle
	}

	method Btn_Marks_RClick {} {

		my variable Priv

		set ibox $::dApp::Obj(ibox)

		set btn $Priv(Marks)
		if {[winfo exists $btn.popupMenu]} {destroy $btn.popupMenu}
		set m [menu $btn.popupMenu -tearoff 0]

		$::dApp::Obj(nbe) editor make_marks_menu $m

		set geo [winfo geometry $btn]
		lassign [split $geo "x"] w geo
		lassign [split $geo "+"] h x y
		set x [winfo rootx $btn]
		incr y [winfo rooty $btn]

		tk_popup $m $x [expr $y + $h]
	}

	method Btn_NewItem_Click {} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)

		set btn $Priv(NewItem)
		if {[winfo exists $btn.popupMenu]} {destroy $btn.popupMenu}
		set m [menu $btn.popupMenu -tearoff 0]

		$m add command -compound left   \
			-label [::msgcat::mc "New File"] \
			-image [$ibox get empty] \
			-command [list $::dApp::Obj(nbe) new]

		$m add command -compound left   \
			-label [::msgcat::mc "New Project..."] \
			-image [$ibox get empty] \
			-command [list $::dApp::Obj(pmgr) new]


		#$::dApp::Obj(pmgr) make_add_menu $m

		set geo [winfo geometry $btn]
		lassign [split $geo "x"] w geo
		lassign [split $geo "+"] h x y
		set x [winfo rootx $btn]
		incr y [winfo rooty $btn]

		tk_popup $m $x [expr $y + $h]
	}

	method Btn_OpenFile_Click {} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)

		set btn $Priv(OpenFile)
		if {[winfo exists $btn.popupMenu]} {destroy $btn.popupMenu}
		set m [menu $btn.popupMenu -tearoff 0]

		$m add command -compound left   \
			-label [::msgcat::mc "Open File..."] \
			-image [$ibox get open_file] \
			-command [list $::dApp::Obj(nbe) open]

		$m add command -compound left   \
			-label [::msgcat::mc "Open Project..."] \
			-image [$ibox get open_project] \
			-command [list $::dApp::Obj(pmgr) open]

		set geo [winfo geometry $btn]
		lassign [split $geo "x"] w geo
		lassign [split $geo "+"] h x y
		set x [winfo rootx $btn]
		incr y [winfo rooty $btn]

		tk_popup $m $x [expr $y + $h]
	}

	method Btn_RunCmd_Click {} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)

		set btn $Priv(RunCmd)

		if {[$::dApp::Obj(run) exec_last] == 0} {
			$::dApp::Obj(run) show
		}

		return

#		if {[winfo exists $btn.popupMenu]} {destroy $btn.popupMenu}
#		set m [menu $btn.popupMenu -tearoff 0]
#
#		set cut [$::dApp::Obj(run) make_history_menu $m]
##		if {$cut == 0} {return [$::dApp::Obj(run) show]}
#		if {$cut > 0} {$m delete end}
#
#		$m add command -compound left -state "normal" \
#			-label [::msgcat::mc "Run Command..."] \
#			-accelerator "F4" \
#			-image [$ibox get empty] \
#			-command {$::dApp::Obj(run) show}
#
#		set geo [winfo geometry $btn]
#		lassign [split $geo "x"] w geo
#		lassign [split $geo "+"] h x y
#		set x [winfo rootx $btn]
#		incr y [winfo rooty $btn]
#
#		tk_popup $m $x [expr $y + $h]
	}

	method Btn_RunCmd_RClick {} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)

		set btn $Priv(RunCmd)

		if {[winfo exists $btn.popupMenu]} {destroy $btn.popupMenu}
		set m [menu $btn.popupMenu -tearoff 0]

		set cut [$::dApp::Obj(run) make_history_menu $m]
#		if {$cut == 0} {return [$::dApp::Obj(run) show]}
		if {$cut > 0} {$m delete end}

		$m add command -compound left -state "normal" \
			-label [::msgcat::mc "Run Command..."] \
			-accelerator "F4" \
			-image [$ibox get empty] \
			-command {$::dApp::Obj(run) show}

		set geo [winfo geometry $btn]
		lassign [split $geo "x"] w geo
		lassign [split $geo "+"] h x y
		set x [winfo rootx $btn]
		incr y [winfo rooty $btn]

		tk_popup $m $x [expr $y + $h]
	}

	method Editor_Cursor_Cb {editor pos} {
		my variable Priv

		set nbe $::dApp::Obj(nbe)

		$Priv(Cut) configure -state disabled
		$Priv(Copy) configure -state disabled
		if {[$nbe editor selection get] != ""} {
			$Priv(Cut) configure -state normal
			$Priv(Copy) configure -state normal
		}

		$Priv(Paste) configure -state normal
		if {[catch {clipboard get}]} {
			$Priv(Paste) configure -state disabled
		}

#		$Priv(MatchingBrace) configure -state "normal"
#		if {[$nbe editor bracket_state] == ""} {
#			$Priv(MatchingBrace) configure -state "disabled"
#		}

		return 0
	}

	method Editor_Document_Cb {editor state} {
		my variable Priv

		set nbe $::dApp::Obj(nbe)

		if {$state == "NONE" || $state == "SAVEAS"} {$Priv(SaveFile)  configure -state disabled}
		if {$state == "CHANGED"} {$Priv(SaveFile)  configure -state normal}

		return 0
	}

	method Editor_Focus_Cb {editor} {
		my variable Priv

		set btnList [list Comment UnComment]
		foreach btn $btnList {$Priv($btn) configure -state disabled}

		if {$editor != "" && [$editor cget -comment] != ""} {
			$Priv(Comment)  configure -state normal
			$Priv(UnComment)  configure -state normal
		}
		return 0
	}

	method Nbe_Selection_Cb {tab} {
		my variable Priv

		set nbe $::dApp::Obj(nbe)
		set editor [$nbe editor]
		set btnList [list SaveFile SaveAllFiles Undo Redo \
			Cut Copy Paste FindReplace Comment UnComment Search \
			UnIndent Indent  ]
		foreach btn $btnList {$Priv($btn) configure -state disabled}

		if {$tab == ""} {
			wm title . "$::dApp::Env(title) $::dApp::Env(version)"
			return 0
		}

		if {[$nbe editor modified] == 1} {$Priv(SaveFile)  configure -state normal}
		$Priv(SaveAllFiles)  configure -state normal
		$Priv(Undo)  configure -state normal
		$Priv(Redo)  configure -state normal
		$Priv(Comment)  configure -state normal
		$Priv(UnComment)  configure -state normal
		if {[$nbe editor selection get] != ""} {
			$Priv(Cut) configure -state normal
			$Priv(Copy) configure -state normal
		}
		if {![catch {clipboard get}]} {
			$Priv(Paste) configure -state normal
		}
		$Priv(FindReplace)  configure -state normal
#		$Priv(GotoLine)  configure -state normal
		$Priv(UnIndent)  configure -state normal
		$Priv(Indent)  configure -state normal
		$Priv(Search)  configure -state normal
#		$Priv(Marks)  configure -state normal

#		if {[$nbe editor bracket_state] != ""} {$Priv(MatchingBrace) configure -state normal}

		return 0
	}

	method Run_Count_Cb {cut} {
		my variable Priv

		 set state "normal"
		 if {$cut == 0} {set state "disabled"}
		 $Priv(KillCmd) configure -state $state

		 return 0
	}

	method Search_Text {} {
		my variable Priv

		set cmb $Priv(SearchText)
		set nbe $::dApp::Obj(nbe)
		set sbar $::dApp::Obj(sbar)
		set txt [$cmb get]

		set editor [$nbe editor]

		if {$editor == ""} {return}

		set wtext [$editor cget -wtext]

		$wtext tag remove FIND_ALL 1.0 end

		if {[string trim $txt] == ""} {
			$wtext tag remove FIND 1.0 end
			return
		}

		set idx1 1.0
		foreach rng [$wtext tag ranges FIND] {
			set idx1 [$wtext index "$rng + 1 chars"]
			break
		}

		catch {set ret [$editor search $txt -start $idx1]}
		if {$ret == ""} {
			$sbar put [::msgcat::mc "The pattern was not found."]
			return
		}

		set cut [$editor search $txt -all 1]

		$sbar put [::msgcat::mc "'%s' occurrence(s) were found." $cut]


#		set vals [list $txt]
#		foreach item [$cmb cget -values] {
#			if {$item == $txt} {continue}
#			lappend vals $item
#		}
#		$cmb configure -values [lrange $vals 0 10]


	}

	method Ui_Init {} {
		my variable Priv

		set ibox $::dApp::Obj(ibox)
		set Priv(NewItem) [my add button \
			-image [$ibox get file-new] \
			-tooltip [::msgcat::mc "Left-Click : New File%sRight-Click : Show Menu" "\n"] \
			-command {$::dApp::Obj(nbe) new}]
			#[list [self object] Btn_NewItem_Click]]

			bind $Priv(NewItem) <<MenuPopup>> [list [self object] Btn_NewItem_Click]

		set Priv(OpenFile) [my add button \
			-tooltip [::msgcat::mc "Left-Click : Open File...%sRight-Click : Show Menu" "\n"] \
			-image [$ibox get file-open] \
			-command {$::dApp::Obj(nbe) open}]
			#[list [self object] Btn_OpenFile_Click]]
			
		bind $Priv(OpenFile) <<MenuPopup>> [list [self object] Btn_OpenFile_Click]

#		set Priv(OpenProject) [my add button \
#			-text [::msgcat::mc "Open"] \
#			-tooltip [::msgcat::mc "Open Project..."] \
#			-image [$ibox get project-open] \
#			-command {$::dApp::Obj(pmgr) open}]

		set Priv(SaveFile) [my add button \
			-tooltip [::msgcat::mc "Save File"] \
			-image [$ibox get file-save] \
			-state disabled \
			-command {$dApp::Obj(nbe) save}]

		set Priv(SaveAllFiles) [my add button \
			-tooltip [::msgcat::mc "Save All Files"] \
			-image [$ibox get save-all] \
			-state disabled \
			-command {$dApp::Obj(nbe) save_all}]

#		my add separator

		set Priv(Cut) [my add button \
			-tooltip [::msgcat::mc "Cut"] \
			-image [$ibox get cut] \
			-state disabled \
			-command {$dApp::Obj(nbe) editor cut}]

		set Priv(Copy) [my add button \
			-tooltip [::msgcat::mc "Copy"] \
			-image [$ibox get copy] \
			-state disabled \
			-command {$dApp::Obj(nbe) editor copy}]

		set Priv(Paste) [my add button \
			-tooltip [::msgcat::mc "Paste"] \
			-image [$ibox get paste] \
			-state disabled \
			-command {$dApp::Obj(nbe) editor paste}]

#		my add separator

		set Priv(Undo) [my add button \
			-tooltip [::msgcat::mc "Undo"] \
			-image [$ibox get undo] \
			-state disabled \
			-command {$dApp::Obj(nbe) editor undo}]

		set Priv(Redo) [my add button \
			-tooltip [::msgcat::mc "Redo"] \
			-image [$ibox get redo] \
			-state disabled \
			-command {$dApp::Obj(nbe) editor redo}]

#		my add separator

		set Priv(FindReplace) [my add button \
			-tooltip [::msgcat::mc "Find/Replace..."] \
			-image [$ibox get find] \
			-state disabled \
			-command {$dApp::Obj(nbe) find}]

#		my add separator
#		set Priv(MatchingBrace) [my add button \
#			-text [::msgcat::mc ""] \
#			-tooltip [::msgcat::mc "Jump to Matching Brace"] \
#			-image [$ibox get bracket_find] \
#			-state disabled \
#			-command {$dApp::Obj(nbe) editor bracket find}]

#		set Priv(GotoLine) [my add button \
#			-text [::msgcat::mc "Jump"] \
#			-tooltip [::msgcat::mc "Goto Line..."] \
#			-image [$ibox get jump] \
#			-state disabled \
#			-command {$dApp::Obj(nbe) goto}]

#		set Priv(Marks) [my add button \
#			-text [::msgcat::mc "Marks"] \
#			-tooltip [::msgcat::mc "Left-Click : Toggle Current Line%sRight-Click : Show Menu" "\n"] \
#			-image [$ibox get marks] \
#			-state disabled \
#			-command [list [self object] Btn_Marks_Click]]
#
#			bind $Priv(Marks) <<MenuPopup>> [list [self object] Btn_Marks_RClick]

		set Priv(Comment) [my add button \
			-tooltip [::msgcat::mc "Add Block Comment"] \
			-image [$ibox get comment] \
			-state disabled \
			-command {$::dApp::Obj(nbe) editor comment_add}]

		set Priv(UnComment) [my add button \
			-tooltip [::msgcat::mc "Remove Block Comment"] \
			-image [$ibox get uncomment] \
			-state disabled \
			-command {$::dApp::Obj(nbe) editor comment_delete}]

#		my add separator

		set Priv(UnIndent) [my add button \
			-tooltip [::msgcat::mc "Decrease Line Indent"] \
			-image [$ibox get unindent] \
			-state disabled \
			-command {$dApp::Obj(nbe) editor indent delete}]

		set Priv(Indent) [my add button \
			-tooltip [::msgcat::mc "Increase Line Indent"] \
			-image [$ibox get indent] \
			-state disabled \
			-command {$dApp::Obj(nbe) editor indent add}]

#		my add separator

		set Priv(RunCmd) [my add button \
			-tooltip [::msgcat::mc "Left-Click : Run Last Command%sRight-Click : Show Menu" "\n"] \
			-image [$ibox get run] \
			-state normal \
			-command [list [self object] Btn_RunCmd_Click]]

		bind $Priv(RunCmd) <<MenuPopup>> [list [self object] Btn_RunCmd_RClick]

		set Priv(KillCmd) [my add button \
			-tooltip [::msgcat::mc "Kill Running Command"] \
			-image [$ibox get stop] \
			-state disabled \
			-command [list [self object] Btn_KillCmd_Click]]

#		set Priv(ClearConsole) [my add button \
#			-tooltip [::msgcat::mc "Clear Console"] \
#			-image [$ibox get clear] \
#			-command {$::dApp::Obj(nbo) console_clear}]


		my add space_expand
		
		my add label -text [::msgcat::mc "Find : "]
		my add space -width 1
		
		set Priv(SearchText) [my add entry \
			-width 17 \
			-style Clear.TEntry \
			-font [font create -size 10] \
			-tooltip [::msgcat::mc "Find In Current Document"] ]

		bind $Priv(SearchText) <Return> [list [self object] Search_Text]
		bind $Priv(SearchText) <Motion> {
			%W configure -cursor "xterm"
			if {[%W identify  %x %y] == "Clear.field"} {%W configure -cursor "hand2"}
		}
		bind $Priv(SearchText) <<ButtonLClick>> [namespace code {
			if {[%W identify  %x %y] == "Clear.field"} {%W delete 0 end}
		}]


		my add space -width 0
		
		set Priv(Search) [my add button \
			-tooltip [::msgcat::mc "Find"] \
			-image [$ibox get search] \
			-state disabled \
			-command [list [self object] Search_Text]]

		my add space -width 1

		bind . <Key-Escape> [list focus $Priv(SearchText)]
		bind $Priv(SearchText) <Key-Escape> {
			set nbe $::dApp::Obj(nbe)
			set editor [$::dApp::Obj(nbe) editor]
			if {$editor != ""} {
				after idle [list focus [$editor cget -wtext]]
			}
		}

		return
	}

	export Search_Text \
		Btn_NewItem_Click Btn_OpenFile_Click \
		Btn_RunCmd_Click Btn_RunCmd_RClick Btn_KillCmd_Click\
		Btn_Marks_Click Btn_Marks_RClick \
		Editor_Focus_Cb Editor_Cursor_Cb Editor_Document_Cb Nbe_Selection_Cb \
		Run_Count_Cb

}

set ::dApp::Obj(tbar) [::dApp::tbar new ]
