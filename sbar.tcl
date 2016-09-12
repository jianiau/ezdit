oo::class create ::dApp::sbar {

	constructor {} {
		my variable Priv
		
		array set Priv [list \
			tid 0 \
			msg [::msgcat::mc "Ready"] \
			pos [::msgcat::mc "Line: %s   Column: %s" 0 0] \
			lines [::msgcat::mc "Lines: %s" 0] \
			format [::msgcat::mc "Format: %s" ""] \
			encoding [::msgcat::mc "Encoding: %s" ""] \
			tok "" \
		]
		set fmeS [$::dApp::Obj(layout) cget -fmeS]
		
		set sbar [my Ui_Init $fmeS.sbar]

		pack $sbar -fill x -ipady 1
	}
	
	destructor {
	}	
	
	method binding_setup {} {
		my variable Priv
		
		$::dApp::Obj(nbe) hook install <Selection> [list [self object] Editor_Update_Cb]
		$::dApp::Obj(nbe) hook install <Editor-Cursor> [list [self object] Editor_Update_Cb]
		$::dApp::Obj(nbe) hook install <Editor-AfterFileOpen> [list [self object] Editor_Update_Cb]
	}
	
	method cget {opt} {
		my variable Priv

		if {$opt == "-frame"} {return $Priv(win,frame)}

		return [$Priv(win,frame) cget $opt]
	}
	
	method put {msg {tout 2500}} {
		my variable Priv
		
		after cancel $Priv(tid)
		set Priv(msg) $msg
		if {$tout >= 0} {set Priv(tid) [after $tout [list set [self namespace]::Priv(msg) ""]]}
	}
	
	method Ui_Init {wpath} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		
		set ns 	[self namespace]
		set sbar [ttk::frame $wpath -borderwidth 0 -relief flat]

		set lblMsg [ttk::label $wpath.lblMsg -textvariable ${ns}::Priv(msg) -anchor w -justify left]
		set lblLines [ttk::label $wpath.lblLines -textvariable ${ns}::Priv(lines) -anchor w -justify left -width 11]
		set lblPos [ttk::label $wpath.lblPos -textvariable ${ns}::Priv(pos) -anchor w -justify left -width 25]
		
		set lblFmt [ttk::label $wpath.lblFmt \
			-textvariable ${ns}::Priv(format) \
			-compound right \
			-image [$ibox get arrow_topdown] \
			-anchor w -justify left -width 20]
			
		set lblEnc [ttk::label $wpath.lblEnc \
			-textvariable ${ns}::Priv(encoding) \
			-compound right \
			-image [$ibox get arrow_topdown] \
			-anchor w -justify left -width 20]
			
		set sizegrip [ttk::sizegrip $wpath.srip]
		
		pack $lblMsg -expand 1 -fill x -padx 3 -side left -pady 2
		pack $lblLines -expand 0 -padx 3 -side left -pady 4 -pady 1
		pack $lblPos -expand 0 -padx 3 -side left -pady 4 -pady 1
		pack $lblFmt -expand 0 -padx 3 -side left -pady 4 -pady 1
		pack $lblEnc -expand 0 -padx 3 -side left -pady 4 -pady 1
		pack $sizegrip -expand 0 -padx 3 -side left -pady 4 -pady 1
		
		bind $lblEnc <<ButtonLRelease>> [list [self object] Enc_Menu_Popup]
		bind $lblFmt <<ButtonLRelease>> [list [self object] Fmt_Menu_Popup]
		
		set Priv(win,lblEnc) $lblEnc
		set Priv(win,lblFmt) $lblFmt
		set Priv(win,frame) $sbar
		
		return $wpath
	}	

	method Enc_Menu_Popup {} {
		my variable Priv
		
		set btn $Priv(win,lblEnc)
		set ibox $::dApp::Obj(ibox)
		set nbe $::dApp::Obj(nbe)
		set m $btn.m
		if {[winfo exists $m]} {destroy $m}
		if {[set editor [$nbe editor]] == ""} {return}
		
		menu $m -tearoff 0
		
		$editor make_encoding_menu $m
		
		set geo [winfo geometry $btn]
		lassign [split $geo "x"] w geo
		lassign [split $geo "+"] h x y
		set x [winfo rootx $btn]
		incr y [winfo rooty $btn] 	
		
		tk_popup $m $x $y
	}
		
	method Fmt_Menu_Popup {} {
		my variable Priv
		
		set btn $Priv(win,lblFmt)
		set ibox $::dApp::Obj(ibox)
		set nbe $::dApp::Obj(nbe)
		set m $btn.m
		if {[winfo exists $m]} {destroy $m}
		if {[set editor [$nbe editor]] == ""} {return}
		
		menu $m -tearoff 0

		foreach {lbl val} [list "cr" cr "lf" lf "crlf" crlf] {
			$m add radiobutton -compound left \
				-label $lbl \
				-value $val \
				-variable [self namespace]::Priv(editor,fileformat) \
				-command [format {
					$::dApp::Obj(nbe) editor configure -format "%s" 
					$::dApp::Obj(sbar) Editor_Update_Cb
				} $val]
		}
		
		set geo [winfo geometry $btn]
		lassign [split $geo "x"] w geo
		lassign [split $geo "+"] h x y
		set x [winfo rootx $btn]
		incr y [winfo rooty $btn] 	
		
		tk_popup $m $x $y		
	}
	
	method Editor_Update_Cb {args} {
		my variable Priv
		
		set nbe $::dApp::Obj(nbe)
		set row 0
		set col 0
		set lines 0
		set fmt ""
		set enc ""				
					
		if {[$nbe editor] != ""} {
			set pos [$nbe editor cget -pos]
			lassign [split $pos "."] row col
			incr col
			set lines [$nbe editor cget -lines]
			set fmt [$nbe editor cget -format]
			set enc [$nbe editor cget -encoding]
			set Priv(editor,fileformat) $fmt
			if {$fmt == "lf"} {set fmt "lf"}
			if {$fmt == "cr"} {set fmt "cr"}
			if {$fmt == "crlf"} {set fmt "crlf"}
			
		}
		
		set Priv(pos) [::msgcat::mc "Line: %s   Column: %s" $row $col]
		set Priv(lines) [::msgcat::mc "Lines: %s" $lines]
		set Priv(format) [::msgcat::mc "Format: %s" $fmt]
		set Priv(encoding) [::msgcat::mc "Encoding: %s" $enc]

		return 0
	}

	export Editor_Update_Cb Enc_Menu_Popup Fmt_Menu_Popup
}

set ::dApp::Obj(sbar) [::dApp::sbar new ]
