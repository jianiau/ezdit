oo::class create ::dApp::run {
	constructor {} {
		my variable Priv
		array set Priv [list \
			history,list [list] \
			history,max 8 \
			hotkey,list [list [::msgcat::mc "None"] <F6> <F7> <F8>] \
			hotkey,<F6> "" \
			hotkey,<F7> "" \
			hotkey,<F8> "" \
			run,count 0 \
			run,autoClear 1 \
		]

		set Priv(obj,hook) [::twidget::hook new]
		
		
		bind . <Key-F5> [list [self object] exec_last]
	}
	
	destructor {
		my variable Priv
		
		$Priv(obj,hook) destroy
		
		bind . <Key-F5> {}
		
		array unset Priv
	}
	
	method cget {opt} {
		my variable Priv
		
		if {$opt == "-hookobject"} {return $Priv(obj,hook)}
		return ""
	}	
	
	method auto_clear {} {
		my variable Priv
		
		return $Priv(run,autoClear)
	}
	
	method auto_clear_toggle {} {
		my variable Priv
		
		if {$Priv(run,autoClear)} {
			set Priv(run,autoClear) 0
		} else {
			set Priv(run,autoClear) 1
		}

		return $Priv(run,autoClear)
	}
	
	method exec {cmd {wdir ""}} {
		my variable Priv

		set win .run_exec
		if {[winfo exists $win]} {return}		
		set dlg [::dApp::runCmd new $win [list [self object] pipe_reader]]
		set id [$dlg exec $cmd $wdir]
		$dlg destroy
		if {$id == ""} {return}
		
		incr Priv(run,count)
		
		$Priv(obj,hook) invoke <Count> $Priv(run,count)
		
		$::dApp::Obj(nbo) raise [::msgcat::mc "Console"]
		
		set Priv(id,$id) [list $id $cmd $wdir]

		my History_Add $cmd $wdir
	}
	
	method exec_last {} {
		my variable Priv
		
		lassign [lindex $Priv(history,list) 0] cmd wdir
		
		if {$cmd == ""} {return 0}
		my exec $cmd $wdir
		return 1
	}
	
	method history_clear {} {
		my variable Priv
		
		set Priv(history,list) [list]
		
		return ""
	}
	
	method history_list {} {
		my variable Priv
		
		return $Priv(history,list)
	}
	
	method hook {cmd args} {
		return [my hook_$cmd {*}$args]
	}	
	
	method hook_install {tag script} {
		my variable Priv
		
		set id [$Priv(obj,hook) install $tag $script]
		return $id
	}

	method hook_uninstall {tag id} {
		my variable Priv

		$Priv(obj,hook) uninstall $tag $id
	}		
	
	method hotkey_list {} {
		my variable Priv
		
		return $Priv(hotkey,list)
	}

	
	method make_history_menu {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set cut 1
		set items [list]
		foreach {item} $Priv(history,list) {
			lassign $item cmd wdir
			if {[lsearch $items $item] >= 0} {continue}
			lappend items $item
			set hotkey ""
			set tmp ""
			if {$wdir != ""} {set tmp " ,  $wdir"}
			if {$cut == 1} {set hotkey "F5"}
			$m add command \
				-accelerator $hotkey \
				-compound left \
				-image [$ibox get exec] \
				-label "$cut. $cmd $tmp" \
				-command [list [self object] exec $cmd $wdir]
			incr cut
		}
		
		if {$cut == 1} {return 0}
		
		$m add separator
		$m add command \
			-compound left \
			-image [$ibox get empty] \
			-label [::msgcat::mc "Clear"] \
			-command [list [self object] history_clear]		
		return [incr cut -1]
	}
	
	method make_kill_menu {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		set cut 1
		foreach {item} [my ps_list] {
			lassign $item id cmd
			set p [lindex [lsort -increasing $id] 0 ]
			$m add command \
				-compound left \
				-image [$ibox get kill] \
				-label "$cmd (pid: $p)" \
				-command [list [self object] ps_kill $id]
			incr cut
		}
		return [incr cut -1]
	}
	
	method make_options_menu {m} {
		my variable Priv
		
		set ibox $::dApp::Obj(ibox)
		
		$m add checkbutton -compound left \
			-label [::msgcat::mc "Auto Clear before Run Command"] \
			-onvalue 1 \
			-offvalue 0 \
			-variable [self namespace]::Priv(run,autoClear)
	}
	
	method pipe_reader {fd} {
		my variable Priv

		set out $::dApp::Obj(out)
		$out puts -nonewline [chan read $fd]
		
		if {[chan eof $fd]} {
			catch {chan close $fd}
			$out puts [::msgcat::mc "Exit"]
			incr Priv(run,count) -1
			$Priv(obj,hook) invoke <Count> $Priv(run,count)
		}
	}
	
	method ps_find {ids} {
		
		if {$::dApp::Env(os) == "windows"} {
			foreach {id} $ids {
				if {[::twapi::process_exists $id]} {return 1}
			}
			return 0
		}
		
		set ret [exec ps x -o pid]
		regsub "\r" $ret "\n" ret
		regsub "\n\n" $ret "\n" ret
		set ret [lrange [split [string trim $ret] "\n"] 1 end]
		set plist [list]
		foreach item $ret {lappend plist [string trim $item]}
		
		foreach {id} $ids {
			if {[lsearch -exact $plist $id] >= 0 } {return 1}
		}
		return 0
	}
	
	method ps_kill {ids} {
		if {$::dApp::Env(os) == "windows"} {
			foreach {id} $ids {
				catch {::twapi::end_process $id -force}
			}
			return
		}		
		
		foreach id [lsort -decreasing  $ids] {catch {exec kill -9 $id}}
	}
	
	method ps_list {} {
		my variable Priv
		
		set ret [list]
		foreach {key} [lsort -increasing [array names Priv id,*]] {
			lassign $Priv($key) id cmd wdir
			if {[my ps_find $id] == 0} {
				unset Priv($key)
				continue
			}
			lappend ret [list $id $cmd]
		}
		return  $ret
	}
	
	method rc_load {} {
		my variable Priv
		
		set rc $::dApp::Obj(rc)
		
		set autoClear [$rc get "Run.AutoClear"]
		if {$autoClear != ""} {set Priv(run,autoClear) $autoClear}  
		
		foreach {cmd wdir} [$rc get "Run.History.List"] {
			if {[string trim $cmd] == ""} {continue}
			my History_Add $cmd $wdir end
		}
		
		foreach {key cmd wdir} [$rc get "Run.Hotkey.List"] {
			if {[string trim $cmd] == "" || [string trim $key] == ""} {continue}
			regsub -all {\%} $cmd {%%} cmd2
			regsub -all {\%} $wdir {%%} wdir2			
			bind . $key [list [self object] exec $cmd2 $wdir2]
			set Priv(hotkey,$key) [list $key $cmd $wdir]
		}
				
	}
	
	method rc_save {} {
		my variable Priv
		
		set rc $::dApp::Obj(rc)
		
		$rc set "Run.AutoClear" $Priv(run,autoClear)
		
		$rc delete "Run.History.List" 
		foreach item $Priv(history,list) {
			lassign $item cmd wdir
			$rc append "Run.History.List" $cmd
			$rc append "Run.History.List" $wdir
		}
		
		$rc delete "Run.Hotkey.List"
		foreach key $Priv(hotkey,list) {
			if {$key == [::msgcat::mc "None"]} {continue}
			if {$Priv(hotkey,$key) == ""} {continue}
			lassign $Priv(hotkey,$key) key cmd wdir
			if {[string trim $cmd] == ""} {continue}
			$rc append "Run.Hotkey.List" $key
			$rc append "Run.Hotkey.List" $cmd
			$rc append "Run.Hotkey.List" $wdir			
		}
		
	}
	
	method show {} {
		my variable Priv
		
		set win .run_exec
		if {[winfo exists $win]} {return}
		
		set dlg [::dApp::runCmd new \
			$win [list [self object] pipe_reader] \
			$Priv(history,list) \
			$Priv(hotkey,list)]
		set id [$dlg show]
		if {$id != ""} {lassign [$dlg data] cmd wdir hotkey}
		$dlg destroy
		if {$id == ""} {return}

		incr Priv(run,count)
		$Priv(obj,hook) invoke <Count> $Priv(run,count)
		
		$::dApp::Obj(nbo) raise [::msgcat::mc "Console"]
		
		set Priv(id,$id) [list $id $cmd $wdir]

		my History_Add $cmd $wdir
		
		if {$hotkey != [::msgcat::mc "None"]} {
			regsub -all {\%} $cmd {%%} cmd2
			regsub -all {\%} $wdir {%%} wdir2
			bind . $hotkey [list [self object] exec $cmd2 $wdir2]
			set Priv(hotkey,$hotkey) [list $hotkey $cmd $wdir]
		}		
		
		return
	}
	
	method History_Add {cmd wdir {pos start}} {
		my variable Priv

		set cut 0
		if {$pos == "start"} {
			set newitem [list $cmd $wdir]
			set newlist [list $newitem]
			foreach item $Priv(history,list) {
				if {$item == $newitem} {continue}
				lappend newlist $item
				if {[incr cut] == $Priv(history,max)} {break}
			}
			set Priv(history,list) $newlist
		} else {
			lappend Priv(history,list) [list $cmd $wdir]
			set max $Priv(history,max)
			incr max -1
			set Priv(history,list) [lrange $Priv(history,list) end-$max end]
		}
		return
	}		
	
}	

oo::class create ::dApp::runCmd {
	superclass ::twidget::dialog 
	
	constructor {wpath {reader ""} {historys ""} {hotkeys ""}} {
		my variable Priv
		array set Priv [list \
			reader $reader \
			cmds "" \
			pwds "" \
			hotkeys $hotkeys \
		]
		
		foreach item $historys {
			lassign $item cmd wdir
			if {[string trim $cmd] != "" && [lsearch $Priv(cmds) $cmd] == -1} {lappend Priv(cmds) $cmd}
			if {[string trim $wdir] != "" && [lsearch $Priv(pwds) $wdir] == -1} {lappend Priv(pwds) $wdir}
		}
		
		next $wpath\
			-title [::msgcat::mc "Run Command"]  \
			-default cancel \
			-cancel 1 \
			-position auto \
			-buttons [list \
				run [::msgcat::mc "Run"] \
				cancel [::msgcat::mc "Cancel"] ]
				
		set Priv(run,msg) "\n"
		append Priv(run,msg) "{%F} : "  [::msgcat::mc "file path" ] "\t"
		append Priv(run,msg) "{%D} : " [::msgcat::mc "directory path of file"] "\n\n"
		append Priv(run,msg) "{%f} : "  [::msgcat::mc "file base name"] "\t\t"
		append Priv(run,msg) "{%d} : "  [::msgcat::mc "directory base name of file"]
	}
	
	destructor {
		my variable Priv
		next
		array unset Priv
	}
	
	method body {fme} {
		my variable Priv
		
		set cmds $Priv(cmds)
		set pwds $Priv(pwds)
		set hotkeys $Priv(hotkeys)
		
		 set Priv(run,cmd) "" 
		 set Priv(run,pwd) ""
		 
		 set lblHotkey [ttk::label $fme.lblHotkey -text [::msgcat::mc "Hotkey:"]]
		set cmbHotKey [ttk::combobox $fme.cmbHotKey \
			-state readonly \
			-values $hotkeys \
			-textvariable [self namespace]::Priv(run,hotkey)]
		set Priv(run,hotkey) [lindex $hotkeys 0]
		 
#		bind $cmbHotKey <<ComboboxSelected>> {}		 
		 
		set lblRun [ttk::label $fme.lbl -text [::msgcat::mc "Run:"] -anchor w]
		set txtRun [ttk::combobox $fme.cmb -width 50 \
			-values $cmds \
			-textvariable [self namespace]::Priv(run,cmd)]
			
		set btnRun [ttk::button $fme.btn -text [::msgcat::mc "Browse..."] \
			-command [list [self object] choose program]]
			
		set lblIn [ttk::label $fme.lblIn -text [::msgcat::mc "Start in:"]  -anchor w]
		set txtIn [ttk::combobox $fme.cmbIn \
			-values $pwds \
			-textvariable [self namespace]::Priv(run,pwd)]
		set btnIn [ttk::button $fme.btnIn \
			-text [::msgcat::mc "Browse..."] \
			-command [list [self object] choose pwd]]
		
		set msg [ttk::label $fme.msg -text $Priv(run,msg)]
		
		grid $lblHotkey $cmbHotKey - -sticky "news" -pady 3 -padx 3
		grid $lblRun $txtRun $btnRun -sticky "we" -pady 3 -padx 3
		grid $lblIn $txtIn $btnIn -sticky "we" -pady 3 -padx 3
		grid $msg - - -sticky "we" -pady 3 -padx 3
		grid columnconfigure $fme 1 -weight 1
		grid rowconfigure $fme 4 -weight 1		
	}	
	
	method choose {cmd args} {
		return [my choose_$cmd {*}$args]
	}
	
	method choose_program {args} {
		my variable Priv
		
		set ans [tk_getOpenFile \
			-parent $Priv(win) \
			-title [::msgcat::mc "Choose Program"] \
			-initialdir [pwd] \
			-filetypes {{{All Files} {*}}}]
		if {$ans != "" && $ans != -1} {set Priv(run,cmd) $ans}
	}
	
	method choose_pwd {args} {
		my variable Priv
		
		set ans [tk_chooseDirectory \
			-parent $Priv(win) \
			-title [::msgcat::mc "Choose Directory"] \
			-initialdir [pwd] \
			-mustexist 1]
		if {$ans != "" && $ans != -1} {set Priv(run,pwd) $ans}
	}
	
	method close {ret} {
		my variable Priv
		
		if {$ret != "run"} {return [next ""]}

		return [next [my exec $Priv(run,cmd) $Priv(run,pwd)]]
	}
	
	method data { } {
		my variable Priv

		return [list $Priv(run,cmd) $Priv(run,pwd) $Priv(run,hotkey)]

	}
	
	method exec {cmd wdir} {
		my variable Priv
		
		set nbe $::dApp::Obj(nbe)
		set out $::dApp::Obj(out)
		
		set fpath [$nbe selection]
		set fname [file tail $fpath]
		set dpath [file dirname $fpath]
		set dname [file tail $dpath]
		
		set runCmd $cmd
	
		regsub -all {\%F} $runCmd $fpath runCmd
		regsub -all {\%f} $runCmd $fname runCmd
		regsub -all {\%d} $runCmd $dname runCmd
		regsub -all {\%D} $runCmd $dpath runCmd
		
		set runPwd $wdir
		regsub -all {\%F} $runPwd $fpath runPwd
		regsub -all {\%f} $runPwd $fname runPwd
		regsub -all {\%d} $runPwd $dname runPwd
		regsub -all {\%D} $runPwd $dpath runPwd
		
		if {[$::dApp::Obj(run) auto_clear]} {$::dApp::Obj(nbo) console_clear}		
		
		$out puts [::msgcat::mc "Run Command : %s" $runCmd]
		if {[string index $runPwd 0] == "\{" && [string index $runPwd end] == "\}"} {
			set runPwd [string range $runPwd 1 end-1]
		}
		
		if {$runPwd != "" && ![file isdirectory $runPwd]} {
			$out puts [::msgcat::mc "Can't change directory to %s" $runPwd]
			$out puts [::msgcat::mc "Exit"]
			return ""
		}
		
		if {$runPwd != "" && [catch {cd $runPwd} ret] } {
			$out puts $ret
			$out puts [::msgcat::mc "Exit"]
			return ""
		}
		
		#lassign [$::dApp::Obj(nbo) pipe_get] rfd wfd
		#append run "exec " $runCmd 		" >&@ $wfd &"
		
		append run "| " $runCmd " |& cat"
		if {[ catch {set fd [open $run r+]} ret]} {
			$out puts $ret
			$out puts [::msgcat::mc "Exit"]
			return ""
		}

		if {$Priv(reader) != ""} {
			chan configure $fd -buffering line -blocking 0
			chan event $fd readable [linsert $Priv(reader) end $fd]		
		}

		return [pid $fd]
	}
	

}


set ::dApp::Obj(run) [::dApp::run new]


