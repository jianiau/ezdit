oo::class create ::dApp::nbe {
	superclass ::twidget::notebook
	
	constructor {} {
		my variable Priv Cmd
		
		array set Cmd [list]
		
		array set Priv [list \
			history,max 10 \
			history,list [list] \
			linebox,show 1 \
			sn 0 \
			encoding "utf-8" \
			fileformat "lf" \
			tabwidth 5 \
			showpath 0 \
		]

		next .nbe
		$::dApp::Obj(layout) pane add "C" "NBE" .nbe 1
		
 		my configure \
			-tabfg [list "#FFFFFF" {selected} "#656565" {}] \
			-tabbg [list "#6687b4" {selected} "#cfd2cb" {}] \
			-taboutline [list "#d8d8d8" {selected} "#d8d8d8" {}] \
			-font $::dApp::Font(small-bold)
			
		bind Text <Control-Right>  [list [self object] next]
		bind Text <Control-Left>  [list [self object] prev]
		bind Text <Control-w>  [list [self object] close]
	}
	
	destructor {
		my variable Priv
		array unset Priv
	}

	method binding_setup {} {
		my variable Priv
		bind . <Control-plus>  [list [self object] font_incr]
		bind . <Control-equal>  [list [self object] font_incr]
		bind . <Control-minus>  [list [self object] font_decr]

	}

	method close {{fpath ""} {force 0}} {
		my variable Priv
		
		if {$fpath == ""} {
			if {[set fpath [my selection]] == ""} {return}
		}
		
		if {$force} {return [my Tab_Delete $fpath]}
		
		set state [string index [my tab cget $Priv($fpath,tab) -text] end]
		
		if {$state != "*"} {return [my Tab_Delete $fpath]}
		
		set ans [tk_messageBox \
			-type "yesnocancel" \
			-icon question \
			-title [::msgcat::mc "Question"] \
			-message [::msgcat::mc "Save changee to %s ?" [file tail $fpath]] \
		]
		
		if {$ans == "cancel"} {return}
		if {$ans == "yes" } {$Priv($fpath,editor) save}
		
		my Tab_Delete $fpath
		
		return
	}
	
	method close_all {{force 0}} {
		my variable Priv
		
		if {[winfo exists .save_dialog]} {
			raise .save_dialog
			return cancel
		}
		
		if {$force} {
			foreach tab [my tabs] {my Tab_Delete $Priv($tab,fpath)}
			return
		}

		set saveList [list]
		foreach tab [my tabs] {
			set state [string index [my tab cget $tab -text] end]
			if {$state == "*"} {
				lappend saveList $tab $Priv($tab,fpath)
			}
		}
		if {![llength $saveList]} {
			foreach tab [my tabs] {my Tab_Delete $Priv($tab,fpath)}
			return
		}
		
		set dlg [::dApp::nbeSaveDialog new .save_dialog]
		$dlg data {*}$saveList
		set ret [$dlg show 600x400]
		set data [$dlg data]
		$dlg destroy

		if {$ret == "cancel"} {return $ret}

		if {$ret == "save"} {
			foreach tab $data {
				set fpath $Priv($tab,fpath)
				$Priv($fpath,editor) save
			}
		}
		foreach tab [my tabs] {my Tab_Delete $Priv($tab,fpath)}
		return $ret		
	}

	method editor {{cmd ""} args} {
		my variable Priv
		
		if {[set fpath [my selection]] == ""} {return}
		
		if {$cmd == ""} {return $Priv($fpath,editor)}
		
		return [$Priv($fpath,editor) $cmd {*}$args]
	}
	
	method encoding {{enc ""}} {
		my variable Priv
		
		if {$enc == ""} {return $Priv(encoding)}
		
		set Priv(encoding) $enc
	}

	method exists {fpath} {
		my variable Priv
		
		return [info exists Priv($fpath,tab)]
	}
	
	method files {} {
		my variable Priv
		
		set ret [list]
		foreach tab [my tabs] {
		 	 lappend  ret $Priv($tab,fpath)
		}
		return $ret
	}
	
	method find {} {
		my variable Priv
		
		if {[set fpath [my selection]] == ""} {return}
		
		set win ".nbe_find"
		if {[winfo exists $win]} {return}
		
		
		set dlg [::dApp::nbeFindDialog new $win $Priv($fpath,editor)]
		set ret [$dlg show]
		$dlg destroy
		
	}
	
	method font {cmd args} {
		return [my font_$cmd {*}$args]
	}
	
	method font_incr {} {
		set size [font configure EzEditorFont -size]
		font configure EzEditorFont -size [expr abs($size) + 1]
	}
	
	method font_decr {} {
		set size [font configure EzEditorFont -size]
		font configure EzEditorFont -size [expr abs(abs($size) - 1)]		
	}
	
	method font_dialog {} {
		set dlg [::twidget::dialog new .nbe_font \
			-cancel 1 \
			-title [::msgcat::mc "Choose Font"] \
			-type "fontbox" \
			-font EzEditorFont \
			-default cancel \
			-position auto \
			-buttons [list ok [::msgcat::mc "Ok"] cancel [::msgcat::mc "Cancel"]] \
		]
		
		lassign [$dlg show] ret family size
		$dlg destroy
		if {$ret != "ok"} {return}
		set family [string trim $family "{}"]
		font configure EzEditorFont -size $size -family $family
		
		
	}
	
	method format {fmt} {
		my variable Priv
		
		if {$fmt == ""} {return $Priv(fileformat)}
		
		set Priv(fileformat) $fmt
	}	
	
	method goto {} {
		my variable Priv

		if {[set fpath [my selection]] == ""} {return}
		set dlg [::twidget::editor::gotobox new [$Priv($fpath,editor) cget -frame].goto $Priv($fpath,editor)]
		$dlg show
		$dlg destroy
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
	
	method linebox {cmd args} {
		return [my linebox_$cmd {*}$args]
	}
	
	method linebox_hide {args} {
		my variable Priv
		
		foreach f [my files] {$Priv($f,editor) linebox hide}
		set Priv(linebox,show) 0
	}
	
	method linebox_show {args} {
		my variable Priv
		
		foreach f [my files] {$Priv($f,editor) linebox show}
		set Priv(linebox,show) 1
	}
	
	method linebox_state {args} {
		my variable Priv
		
		return $Priv(linebox,show)
	}
	
	method linebox_toggle {args} {
		my variable Priv
		
		if {$Priv(linebox,show)} {
			my linebox hide
		} else {
			my linebox show
		}
		return $Priv(linebox,show)
	}	
	
	method make_editor_menu {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		
		$m add checkbutton -compound left \
			-label [::msgcat::mc "View Line Numbers"] \
			-variable [self namespace]::Priv(linebox,show) \
			-command [format {
				namespace eval %s {
					if {$Priv(linebox,show)} {
						$::dApp::Obj(nbe) linebox show
					} else {
						$::dApp::Obj(nbe) linebox hide
					}
				}
			} [self namespace]]

#		set m2 $m.ftail
#		if {[winfo exists $m2]} {destroy $m2}
#		menu $m2 -tearoff 0
#		
#		$m add checkbutton -compound left \
#			-label [::msgcat::mc "Show File Path"] \
#			-variable [self namespace]::Priv(showpath) \
#			-command		[namespace code {
#				foreach tab [my tabs] {
#					set fpath $Priv($tab,fpath)
#					set fdir [file dirname $fpath]
#					set title [my tab cget $tab -text]
#					if {$Priv(showpath)} {
#						my tab configure $tab -text [file join $fdir $title]
#					} else {
#						my tab configure $tab -text [file tail $title]
#					}
#				}
#			}]

		set m2 $m.tabwidth
		if {[winfo exists $m2]} {destroy $m2}
		menu $m2 -tearoff 0
		
		$m add cascade -compound left \
			-label [::msgcat::mc "Tab Width"] \
			-image [$ibox get empty] \
			-menu $m2
			
		foreach w [list 2 3 4 5 6 7 8] {
	 		$m2 add radiobutton -compound left \
	 			-label $w \
	 			-variable [self namespace]::Priv(tabwidth) \
	 			-command [list [self object] tabwidth $w]
	 	}
	 	
		set m2 $m.fontsize
		if {[winfo exists $m2]} {destroy $m2}
		menu $m2 -tearoff 0		 	
	 	
		$m add cascade -compound left \
			-label [::msgcat::mc "Font"] \
			-image [$ibox get empty] \
			-menu $m2	 	
	 	
	 	$m2 add command -compound left \
	 		-label [::msgcat::mc "Increase Size"] \
	 		-accelerator [::msgcat::mc "Ctrl++"] \
	 		-image [$ibox get empty] \
	 		-command [list [self object] font incr]
	
	 	$m2 add command -compound left \
	 		-label [::msgcat::mc "Descrease Size"] \
	 		-accelerator [::msgcat::mc "Ctrl+-"] \
	 		-image [$ibox get empty] \
	 		-command [list [self object] font decr]
	 	
	 	$m2 add separator
	 	
	 	$m2 add command -compound left \
	 		-label [::msgcat::mc "Details..."] \
	 		-image [$ibox get empty] \
	 		-command [list [self object] font dialog]

	}
	
	method make_encoding_menu {menc} {
		my variable Priv
	
		set var [self namespace]::Priv(encoding)

		foreach {enc name} [list "ascii" "ASCII" "utf-8" "UTF-8" ] {
			$menc add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] encoding $enc]
		}
		
		set m2 $menc.asia
		if {![winfo exists $m2]} {menu $m2 -tearoff 0	}
		$m2 delete 0 end
		
		$menc add cascade -compound left \
			-label [::msgcat::mc "Asia"] \
			-menu $m2
			
		foreach {enc name} [list  "gb12345"  "Simplified Chinese (GB12345)" \
					                    "gb2312"  "Simplified Chinese (GB2312-1980)" \
					                    "gb2312-raw"  "Simplified Chinese (GB2312-RAW)" \
					                    "big5"  "Traditional Chinese (Big5)" \
					                    "cp950"  "Traditional Chinese (Microsoft CP-950)" \
					                    "shiftjis"  "Shift JIS" \
					                    "cp932"  "Shift JIS (CP-932)" \
					                    "cp936"  "GBK (CP-936/GBK)" \
								] {
			$m2 add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] encoding $enc]
		}	
		
		set m2 $menc.eastern_europe
		if {![winfo exists $m2]} {menu $m2 -tearoff 0	}
		$m2 delete 0 end
		
		$menc add cascade -compound left \
			-label [::msgcat::mc "Eastern Europe"] \
			-menu $m2
			
		foreach {enc name} [list "iso8859-4"  "Baltic (Latin-4/ISO-8859-4)" \
					                    "iso8859-13"  "Baltic (Latin-7/ISO-8859-13)" \
					                    "cp1257"  "Baltic (CP-1257)" \
					                    "iso8859-2"  "Central European (Latin-2/ISO-8859-2)" \
					                    "cp1250"  "Central European (CP-1250)" \
					                    "iso8859-5"  "Cyrillic (ISO-8859-5)" \
					                    "koi8-r"  "Cyrillic (KOI8-R)" \
					                    "cp1251"  "Cyrillic (CP-1251)" \
					                    "macCyrillic"  "Cyrillic (Mac-Cyrillic)" \
					                    "iso8859-9"  "Turkish (Latin-5/ISO-8859-9)" \
					                    "macTurkish"  "Turkish (Mac-Turkish)" \
								] {
			$m2 add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] encoding $enc]					
		}
		
		set m2 $menc.middle_europe
		if {![winfo exists $m2]} {menu $m2 -tearoff 0	}
		$m2 delete 0 end
		
		$menc add cascade -compound left \
			-label [::msgcat::mc "Middle East"] \
			-menu $m2
			
		foreach {enc name} [list  "cp1255"  "Hebrew (CP-1255)" \
					                    "iso8859-8"  "Hebrew (ISO-8859-8)" \
								] {
			$m2 add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] encoding $enc]					
		}
		
		set m2 $menc.wastern_europe
		if {![winfo exists $m2]} {menu $m2 -tearoff 0	}
		$m2 delete 0 end
		
		$menc add cascade -compound left \
			-label [::msgcat::mc "Western Europe"] \
			-menu $m2
			
		foreach {enc name} [list  "iso8859-1"  "Western European (Latin-1/ISO-8859-1)" \
									 "macRoman"  "Western European (Mac-Roman)" \
									 "iso8859-15"  "Western European (Latin-9/ISO-8859-15)" \
									 "cp1252"  "Western European (CP-1252)" \
									 "iso8859-14"  "Celtic (Latin-8/ISO-8859-14)" \
									 "iso8859-7"  "Greek (ISO-8859-7)" \
									 "cp1253"  "Greek (CP-1253)" \
									 "macGreek"  "Greek (Mac-Greek)" \
									 "iso8859-10"  "Nordic (Latin-6/ISO-8859-10)" \
									 "macIceland"  "Iceland (Mac-Iceland)" \
									 "iso8859-4"  "Northern European (ISO-8859-4)" \
									 "iso8859-3"  "Southern European (ISO-8859-3)" \
								] {
			$m2 add radiobutton  -compound left \
			-label $name \
			-value $enc \
			-variable $var \
			-command [list [self object] encoding $enc]	
		}
	}

	method make_format_menu {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		
		foreach {lbl val} [list "cr" cr "lf" lf "crlf" crlf] {
			$m add radiobutton -compound left \
				-label $lbl \
				-value $val \
				-variable [self namespace]::Priv(fileformat) \
				-command [list [self object] format $val]
		}
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
	
	method make_tab_menu {m} {
		my variable Priv
	
		foreach tab [my tabs] {
		 	 set fpath $Priv($tab,fpath)
			$m add radiobutton -compound left -state "normal" \
				-label [file tail $fpath] \
				-accelerator "" \
				-value $fpath \
				-variable [self namespace]::Priv(var,currTab) \
				-command [list [self object] selection $fpath]
				 	 
		}
		set Priv(var,currTab) [my selection]

	}
	
	method mime {cmd args} {
		return [my mime_$cmd {*}$args]
	}
	
	method mime_install {exts editor} {
		my variable Cmd
		
		foreach ext $exts {
			set Cmd($ext) [list  [self caller] $editor]
		}
	}
	
	method mime_uninstall {exts editor} {
		my variable Cmd
		
		foreach ext $exts {
			if {![info exists Cmd($ext)]} {continue}
			lassign $Cmd($ext) caller editor2
			if {$caller == [self caller] && $editor2 == $editor} {
				unset Cmd($ext)
			}
		}
	}		
	
	method new {} {
		my variable Priv Cmd
		
		set ibox $::dApp::Obj(ibox)
		set hook [my cget -hookobject]
		
		set i 1
		set fpath "New-$i"
		while {[info exists Priv($fpath,tab)]} {
			incr i
			set fpath "New-$i"
		}

		incr Priv(sn)

		set editor [::dApp::ceditor new [my cget -frame].tab$Priv(sn) "" $Priv(encoding) $Priv(fileformat)]

		$editor configure -iboxobject $::dApp::Obj(ibox)
		$editor configure -tabwidth $Priv(tabwidth)
		if {$Priv(linebox,show) == 0} {$editor linebox hide}
		if {[namespace exists ::dnd]} {
			dnd bindtarget [$editor cget -wtext] "text/uri-list" <Drop> {
				set items [list]
				set args %D
				foreach item $args {
					lappend items [uri::urn::unquote $item]
				}
				$::dApp::Obj(ezdit) Argv_Handler {*}$items
			}
		}

		set tab [my Tab_Add $fpath $editor]
		return ""
	}
	
	method open {{fpath ""}} {
		my variable Priv Cmd
		
		set ibox $::dApp::Obj(ibox)
		set hook [my cget -hookobject]

		if {$fpath == ""} {
			set fpath [tk_getOpenFile \
				-title [::msgcat::mc "Open File"] \
				-filetypes {{{All Files} {*}}}]
			if {$fpath == "" || $fpath == "-1"} {return}
		}
		
		set ret [$hook invoke <Editor-BeforeFileOpen> $fpath]
		if {$ret == -1} {return}		
		
		if {[info exists Priv($fpath,tab)]} {
			my selection $fpath
			return $fpath
		}

		set fname [file tail $fpath]
		incr Priv(sn)
		
		set ext [file extension $fpath]
		if {[info exists Cmd($ext)]} {
			lassign $Cmd($ext) caller cmd
			set editor [$cmd new [my cget -frame].tab$Priv(sn) $fpath $Priv(encoding)]
		}  else {
			set editor [::dApp::ceditor new [my cget -frame].tab$Priv(sn) $fpath $Priv(encoding)]
		}
		$editor configure -iboxobject $::dApp::Obj(ibox)
		$editor configure -tabwidth $Priv(tabwidth)
		if {$Priv(linebox,show) == 0} {$editor linebox hide}

		if {[namespace exists ::dnd]} {
			dnd bindtarget [$editor cget -wtext] "text/uri-list" <Drop> {
				set items [list]
				set args %D
				foreach item $args {
					lappend items [uri::urn::unquote $item]
				}
				$::dApp::Obj(ezdit) Argv_Handler {*}$items
			}
		}

		set tab [my Tab_Add $fpath $editor]
		
		my History_Add $fpath
		
		set ret [$hook invoke <Editor-AfterFileOpen> $fpath]				

		
		return $fpath
	}
	
	method rc_load {} {
		my variable Priv
	
		set rc $::dApp::Obj(rc)

#		if {[set val [$rc get "Nbe.ShowPath"]] != ""} {set Priv(showpath) $val}
		if {[set val [$rc get "Nbe.Encoding"]] != ""} {set Priv(encoding) $val}
		if {[set val [$rc get "Nbe.FileFormat"]] != ""} {set Priv(fileformat) $val}
		if {[set val [$rc get "Nbe.Editor.FontSize"]] != ""} {font configure EzEditorFont -size $val}
		if {[set val [$rc get "Nbe.Editor.FontFamily"]] != ""} {
			if {[string index $val 0] == "{" && [string index $val end] == "}"} {
				set val [string range $val 1 end-1]
			}
			font configure EzEditorFont -family $val
		}
		if {[set val [$rc get "Nbe.Editor.TabWidth"]] != ""} {set Priv(tabwidth) $val}
		if {[set val [$rc get "Nbe.Editor.Linebox.Enabled"]] != ""} {set Priv(linebox,show) $val}

		foreach {fpath pos} [$rc get "Nbe.Files"] {
			if {![file exists $fpath]} {continue}
			my open $fpath
			my editor configure -pos $pos
		}
		
		lassign [$rc get "Nbe.Selection"] fpath pos
		if {$fpath != "" && [file exists $fpath]} {
			my open $fpath
			my editor configure -pos $pos
		}
	}

	method rc_save {} {
		my variable Priv

		set rc $::dApp::Obj(rc)
		
		set fpath [my selection]
		$rc delete "Nbe.Selection"
		$rc delete "Nbe.Files"
		if {$fpath != ""} {
			$rc set "Nbe.Selection" $fpath
			$rc append "Nbe.Selection" [$Priv($fpath,editor) cget -pos]
			
			$rc delete "Nbe.Files"
			foreach {fpath} [my files] {
				$rc append "Nbe.Files" $fpath
				$rc append "Nbe.Files" [$Priv($fpath,editor) cget -pos]
			}
		} 
		
#		$rc set "Nbe.ShowPath" $Priv(showpath)
		$rc set "Nbe.FileFormat" $Priv(fileformat)
		$rc set "Nbe.Encoding" $Priv(encoding)
		$rc set "Nbe.Editor.FontSize" [font configure EzEditorFont -size]
		$rc set "Nbe.Editor.FontFamily" [string trim [font configure EzEditorFont -family] "{}"]
		$rc set "Nbe.Editor.TabWidth" $Priv(tabwidth)
		$rc set "Nbe.Editor.Linebox.Enabled" $Priv(linebox,show)
	}
	
	method save {{fpath ""}} {
		my variable Priv
		
		if {$fpath == ""} {
			if {[set fpath [my selection]] == ""} {return}
		}		
		
		if {![info exists Priv($fpath,editor)]} {return}
		
		return [$Priv($fpath,editor) save]
	}
	
	method save_as {{fpath ""}} {
		my variable Priv
		if {$fpath == ""} {
			if {[set fpath [my selection]] == ""} {return}
		}
		if {![info exists Priv($fpath,editor)]} {return}
		
		set f [$Priv($fpath,editor) save_as]
		if {$f == ""} {return}

		my open $f
		return
	}
	
	method save_all {} {
		my variable Priv
		
		foreach tab [my tabs] {
			set state [string index [my tab cget $tab -text] end]
			if {$state == "*"} {my save $Priv($tab,fpath)}
		}
	}
	
	method selection {{fpath ""}} {
		my variable Priv
		
		if {$fpath == ""} {
			set tab [next]
			if {$tab == ""} {return ""}
			if {![info exists Priv($tab,fpath)]} {return ""}
			return $Priv($tab,fpath)
		}
		
		if {![info exists Priv($fpath,tab)]} {return ""}
		
		next $Priv($fpath,tab)
		
		return $fpath		
	}
	
	method tab {{cmd ""} args} {
		my variable Priv
		
		if {[set fpath [my selection]] == ""} {return}
		
		if {$cmd == ""} {return $Priv($fpath,tab)}
		
		return [next $cmd {*}$args]
	}
	
	method tabwidth {{size ""}} {
		my variable Priv
		
		if {$size == ""} {return $Priv(tabwidth)}
		set Priv(tabwidth) $size
		foreach tab [my tabs] {
#			set win [my tab cget $tab -window]
#			if {[winfo class $win] == "Text"} {
				set fpath $Priv($tab,fpath)
				$Priv($fpath,editor) configure -tabwidth $size
#			}
		}
		return	
	}
	
	method Editor_Document_Cb {fpath tab editor state} {
		my variable Priv

		if {$state == "NONE"} {
			set txt [my tab cget $tab -text]
			if {[string index $txt end] == "*"} {
				my tab configure $tab -text [string range $txt 0 end-1]
			}
		}

		if {$state == "SAVEAS"} {
			set f [$editor cget -file]
			my Tab_Replace $fpath $f
				
			if {$Priv(showpath) == 0} {set f [file tail $f]}
			my tab configure $tab -text $f
		}		
		
		if {$state == "CHANGED"} {
			if {[string index [my tab cget $tab -text] end] != "*"} {
				append txt [my tab cget $tab -text] "*"
				my tab configure $tab -text $txt
			}
		}
		
		if  {$state == "DELETED"} {
			set fname [file tail $fpath]
			set ans [tk_messageBox \
				-icon warning \
				-title [::msgcat::mc "Warning"] \
				-message [::msgcat::mc "'%s' has been delete from the file system. Save it?" $fname] \
				-default no \
				-type yesno]
			if {$ans == "yes"} {
				$editor save
			}
			my Tab_Delete $fpath
		}
		
		if  {$state == "MTIME"} {
			set fname [file tail $fpath]
			set ans [tk_messageBox \
				-icon warning \
				-title [::msgcat::mc "Warring"] \
				-message [::msgcat::mc "'%s' has been modified. Reload file ?" $fname] \
				-default yes \
				-type yesno]
			if {$ans == "yes"} {$editor open $fpath}
			if {$ans == "no" && [string index [my tab cget $tab -text] end] != "*"} {
				append txt [my tab cget $tab -text] "*"
				my tab configure $tab -text $txt
			}
		}		
		 
		$Priv(obj,hook) invoke <Editor-Document> $editor $state
		return 0
	}
	
	method Editor_Content_Cb {fpath tab editor type key} {
		my variable Priv
		$Priv(obj,hook) invoke <Editor-Content> $editor $type $key
		return 0
	}		
	
	method Editor_Cursor_Cb {fpath tab editor pos} {
		my variable Priv
		$Priv(obj,hook) invoke <Editor-Cursor> $editor $pos
		return 0
	}	
	
	method Editor_Focus_Cb {fpath tab editor} {
		my variable Priv

		$Priv(obj,hook) invoke <Editor-Focus> $editor	
		wm title . "$::dApp::Env(title) $::dApp::Env(version) - $Priv($tab,fpath)"
		return 0
	}
	
	method Editor_Menu_Cb {fpath tab editor m} {
		my variable Priv

		set end [$m index end]
		foreach obj [info class instances ::dApp::nbe::EditorMenu] {$obj create $m}
		if {$end != [$m index end]} {
			$m insert [incr end] separator
		}

		return 0
	}	
	
	method Editor_Selection_Cb {fpath tab editor len} {
		my variable Priv
		
		$Priv(obj,hook) invoke <Editor-Selection> $editor $len

		return 0
	}
	
	method Editor_YScroll_Cb {fpath tab editor idx1 idx2} {
		my variable Priv

		$Priv(obj,hook) invoke <Editor-YScroll> $editor $idx1 $idx2
		
		return 0
	}
	
	method History_Add {fpath} {
		my variable Priv
		
		set cut 1
		set newlist [list $fpath]
		foreach item $Priv(history,list) {
			if {$item == $fpath || ![file exists $item]} {continue}
			lappend newlist $item
			if {[incr cut] == $Priv(history,max)} {break}
		}
		
		set Priv(history,list) $newlist
		
		return
	}		
	
	method Tab_Button_Click {btn x y} {
		my variable Priv
		
		set tab [next $btn $x $y]
		if {$tab == -1} {return}
		
		set state [string index [my tab cget $tab -text] end]
		if {$state != "*"} {
			my close $Priv($tab,fpath) 1
			return
		}
		
		my close $Priv($tab,fpath)
	}
	
	method Tab_Add {fpath editor args} {
		my variable Priv
		
		array set opts [list \
			-tabicons "" \
			-closeicons "" \
			-title [file tail $fpath] \
			-win [$editor cget -frame] \
		]
		
		if {$Priv(showpath) == 1} {set opts(-title) $fpath}
		
		array set opts $args
		
		set Priv($fpath,editor) $editor

		set tab [my add $opts(-title) $opts(-win) $opts(-tabicons) $opts(-closeicons)]

		set Priv($fpath,tab) $tab
		set mtime 0
		if {[file exists $fpath]} {set mtime [file mtime $fpath]}
		set Priv($fpath,mtime) $mtime
		set Priv($tab,fpath) $fpath		

		bind [$editor cget -wtext] <<Find>>   [list [self object] find]

		set hook [$editor cget -hookobject]
		
		foreach evt [list Cursor Content Document Focus Menu Selection YScroll] {
			$hook install <$evt> [list [self object] Editor_${evt}_Cb $fpath $tab $editor]
		}
	}	
	
	method Tab_Delete {fpath} {
		my variable Priv
		
		if {![info exists Priv($fpath,tab)]} {return}

		set tab $Priv($fpath,tab)
		$Priv($fpath,editor)  destroy
		
		my delete $tab
		
		unset Priv($tab,fpath)
		unset Priv($fpath,tab)
		unset Priv($fpath,editor) 
		unset Priv($fpath,mtime)	
		
		return 0
	}	

	method Tab_Replace {ofpath nfpath} {
		my variable Priv Cmd

		set tab $Priv($ofpath,tab)
		set Priv($tab,fpath) $nfpath
		set Priv($nfpath,tab) $tab
		set Priv($nfpath,mtime) [file mtime $nfpath]
		set Priv($nfpath,editor) $Priv($ofpath,editor)
		set enc [$Priv($ofpath,editor) cget -encoding]

		unset Priv($ofpath,tab)
		unset Priv($ofpath,editor) 
		unset Priv($ofpath,mtime)
					
		set ext [file extension $nfpath]
		if {![info exists Cmd($ext)]} {return}
		
		incr Priv(sn)
		
		lassign $Cmd($ext) caller cmd
		set editor [$cmd new [my cget -frame].tab$Priv(sn) $nfpath $enc]

		$editor configure -iboxobject $::dApp::Obj(ibox)
		$editor configure -tabwidth $Priv(tabwidth)
		if {$Priv(linebox,show) == 0} {$editor linebox hide}

		if {[namespace exists ::dnd]} {
			dnd bindtarget [$editor cget -wtext] "text/uri-list" <Drop> {
				set items [list]
				set args %D
				foreach item $args {
					lappend items [uri::urn::unquote $item]
				}
				$::dApp::Obj(ezdit) Argv_Handler {*}$items
			}
		}
		
		bind [$editor cget -wtext] <<Find>>  [list [self object] find]

		set hook [$editor cget -hookobject]
		
		foreach evt [list Cursor Content Document Focus Menu Selection YScroll] {
			$hook install <$evt> [list [self object] Editor_${evt}_Cb $nfpath $tab $editor]
		}
		
		focus [$editor cget -wtext]
		$Priv($nfpath,editor) destroy
		set Priv($nfpath,editor) $editor

		my tab configure $tab -window [$editor cget -frame]
		
		my History_Add $nfpath
	}
	
		export Tab_Button_Click \
			Editor_Document_Cb Editor_Focus_Cb Editor_Cursor_Cb Editor_Selection_Cb \
			Editor_Content_Cb Editor_YScroll_Cb Editor_Menu_Cb Tab_Selection_Change

}

oo::class create ::dApp::nbeSaveDialog {
	superclass ::twidget::dialog
	
	constructor {wpath} {
		my variable Priv
		array set Priv [list]
		
		next $wpath\
			-title [::msgcat::mc "Please select the files you want to save"]  \
			-default save \
			-position auto \
			-buttons [list \
				save [::msgcat::mc "Save"] \
				no [::msgcat::mc "Do Not Save"] \
				cancel [::msgcat::mc "Cancel"] ] \
	}
	
	destructor {
		next
		array unset Priv
	}
	
	method body {fme} {
		my variable Priv
		
		ttk::style configure Nbe.Treeview 	-rowheight 32
		
		set tree [ttk::treeview $fme.tree -selectmode extended -show tree -padding 3 -style Nbe.Treeview]
		set vs [ttk::scrollbar $fme.vs -command [list $tree yview] -orient vertical]
		set hs [ttk::scrollbar $fme.hs -command [list $tree xview] -orient horizontal]
		$tree configure -xscrollcommand [list $hs set] -yscrollcommand [list $vs set]
		::autoscroll::autoscroll $vs
		::autoscroll::autoscroll $hs				
		
		set fmeBtn [ttk::frame $fme.btns]
		set btnSelectAll [ttk::button $fmeBtn.selectAll \
			-text [::msgcat::mc  "Select All"] \
			-command "$tree selection add \[$tree children {}\]" \
		]
		set btnSelectNone [::ttk::button $fmeBtn.selectNone \
				-text [::msgcat::mc "Clear All"] \
				-command "$tree selection remove \[$tree children {}\]" \
		]
		pack $btnSelectAll $btnSelectNone -side right  -padx 3 -pady 3
		
		foreach {tab fpath} $Priv(data) {
			$tree insert {} end -id $tab -text $fpath
		}
		
		$tree selection add [$tree children {}]
		
		grid $tree $vs -sticky "news"
		grid $hs - -sticky "news"
		grid $fmeBtn - -sticky "news"
		grid rowconfigure $fme 0 -weight 1
		grid columnconfigure $fme 0 -weight 1
		
		set Priv(tree) $tree
	}
	
	method close {ret} {
		my variable Priv
		
		set tree $Priv(tree)
		set Priv(data) [$tree selection]
		next $ret
	}
		
	method data {args} {
		my variable Priv
		if {[llength $args] == 0} {return $Priv(data)}

		set Priv(data) $args
	}
}

oo::class create ::dApp::nbeFindDialog {
	superclass ::twidget::editor::searchbox 
	constructor {wpath editor args} {
		next $wpath $editor none {*}$args
	}
	destructor {next}
	
	method find  {{back 0}} {
		my variable Priv
		
		set editor [$::dApp::Obj(nbe) editor]
		if {$editor != ""} {
			set Priv(editor) $editor
			next $back
		} 
	}

	method find_all {} {
		my variable Priv
		
		set editor [$::dApp::Obj(nbe) editor]
		if {$editor != ""} {
			set Priv(editor) $editor
			next
		} 
	}

	method replace {} {
		my variable Priv
		
		set editor [$::dApp::Obj(nbe) editor]
		if {$editor != ""} {
			set Priv(editor) $editor
			next
		} 
	}
	
	method replace_all {} {
		my variable Priv
		
		set editor [$::dApp::Obj(nbe) editor]
		if {$editor != ""} {
			set Priv(editor) $editor
			next
		}
	}	
	
}

oo::class create ::dApp::nbe::EditorMenu {method create {m} {return 0}}

set ::dApp::Obj(nbe) [::dApp::nbe new]
