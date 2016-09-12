set plugin [::dApp::plugin new]

oo::objdefine $plugin {
	method author {} {return "dai"}
	method description {} {return ""}
	method name {} {return [::msgcat::mc "EzSDX"]}
	method version {} {return "1.0"}

	method init {} {
		my variable Priv

		set obj [::dApp::mbar::ToolsMenu new]
		oo::objdefine $obj method create {m} [format {
			set state "normal"
			if {[set editor [$::dApp::Obj(nbe) editor]] == "" && [$::dApp::Obj(pmgr) projects] == ""} {set state "disabled"}
			$m add command -state $state \
				-label [::msgcat::mc "EzSDX"] \
				-compound left \
				-image [$::dApp::Obj(ibox) get sdx] \
				-command [list %s sdx_show]
		} [self object]]

		set Priv(obj,ToolsMenu,sdx) $obj
	}

	method cleanup {} {
		my variable Priv

		$Priv(obj,ToolsMenu,sdx) destroy
	}

	method sdx_show {} {
		my variable Priv

		set dlg [::twidget::dialog new .dialog \
			-title [::msgcat::mc "EzSDX"] \
			-default "Ok" \
			-cancel 1 \
			-position center \
			-buttons [list wrap [::msgcat::mc "Start"]] \
		]

		oo::objdefine $dlg method start_wrap {} {
			my variable Priv
			
			set cmd "exec "
	
			set tclkit2 [file join $::dApp::Env(rcPath) tclkit.copy]
			set output $Priv(var,output)
			if {$output == ""} {
				puts [::msgcat::mc "Output can't empty!!"]
				return
			}
			file copy -force $Priv(var,tclkit) $tclkit2
			append cmd $Priv(var,cmd)
			puts $cmd
			update			
			regsub $output $cmd tmpkit cmd
			set opwd [pwd]
			cd $::dApp::Env(rcPath)
			if {[catch {eval $cmd} ret]} {
				puts $ret
				catch {file delete $tclkit2}
				cd $opwd
				return
			}
			catch {file delete $tclkit2}
			catch {file delete $output}
			file rename tmpkit $output
			cd $opwd
			puts [::msgcat::mc "Successed!!"]

			set rc $::dApp::Obj(rc)
			if {[file exists $Priv(var,tclkit)]} {	$rc set "ezSDX.tclkit" $Priv(var,tclkit) }
			if {[file exists $Priv(var,sdx)]} { $rc set "ezSDX.sdx" $Priv(var,sdx)}
			$rc set "EzSDX.cmbFile" $Priv(var,cmbFile)
			$rc set "EzSDX.cmbProject" $Priv(var,cmbProject)
			$rc set "EzSDX.output" $Priv(var,output)
			$rc set "EzSDX.chkWritable" $Priv(var,chkWritable)
			$rc set "EzSDX.chkNoComp" $Priv(var,chkNoComp)
			$rc set "EzSDX.chkStarpack" $Priv(var,chkStarpack)
			$rc set "EzSDX.rdoTarget" $Priv(var,rdoTarget)
			
			$rc flush			
			

		}

		oo::objdefine $dlg method cmd_update {} {
			my variable Priv

			set txt $Priv(wdg,txt)
			$txt delete 1.0 end
			set type "qwrap"
			set QWRAP "\"$Priv(var,cmbFile)\""
			set VFS ""
			set WRITABLE ""
			set NOCOMP ""
			set TCLKIT "%TCLKIT%"
			set SDX "%SDX%"
			set OUTPUT "%OUTPUT%"
			set RUNTIME "%TCLKIT%"
			if {$Priv(var,output) != ""} {set OUTPUT "\"$Priv(var,output)\""}

			if {$Priv(var,chkStarpack) == 0} {set RUNTIME ""}

			if {$Priv(var,rdoTarget) == "project"} {
				set type "wrap"
				set QWRAP ""
				set VFS "-vfs %VFS%"
				if {$Priv(var,cmbProject) != ""} { set VFS "-vfs \"$Priv(var,cmbProject)\""	}
			}

			if {$Priv(var,chkNoComp) == 1} {set NOCOMP "-nocomp"}
			if {$Priv(var,chkWritable) == 1} {set WRITABLE "-writable"}
			
			if {$Priv(var,tclkit) != ""} {
				set TCLKIT "\"$Priv(var,tclkit)\""
				if {$Priv(var,chkStarpack) == 1} {
					set tclkit2 [file join $::dApp::Env(rcPath) tclkit.copy]
					set RUNTIME "-runtime \"$tclkit2\""
				}
			}
			if {$Priv(var,sdx) != ""} {set SDX "\"$Priv(var,sdx)\""}

			set cmd "$TCLKIT $SDX $type $QWRAP $OUTPUT $VFS $RUNTIME $WRITABLE $NOCOMP"

			$txt insert end $cmd
			set Priv(var,cmd) [string trim $cmd]
		}

		oo::objdefine $dlg method body {parent} {
			my variable Priv

			set rc $::dApp::Obj(rc)
			set Priv(var,tclkit) "" 
			set Priv(var,sdx) ""
						
			set fmeTarget [ttk::labelframe $parent.fmeTarget -text [::msgcat::mc "Options"] -padding 8]

			set rdoFile [ttk::radiobutton $fmeTarget.rdoFile -value "file" -text [::msgcat::mc "Wrap File"] \
				-variable [self namespace]::Priv(var,rdoTarget) \
				-command [format {
					set parent %s
					set obj %s
					$parent.cmbFile configure -state normal
					$parent.btnFile configure -state normal
					$parent.cmbProject configure -state disabled
					$parent.btnProject configure -state disabled
					$obj cmd_update
			} $fmeTarget [self object]]]
			set files [$::dApp::Obj(nbe) files]
			set cmbFile [ttk::combobox $fmeTarget.cmbFile \
				-textvariable [self namespace]::Priv(var,cmbFile) \
				-values $files \
			]
			$cmbFile set [$::dApp::Obj(nbe) selection]
			set btnFile [ttk::button $fmeTarget.btnFile -text [::msgcat::mc "Browse..."] \
				-command [format {
					set parent %s
					set obj %s
					set ret [tk_getOpenFile -title [::msgcat::mc "Choose A File"]]
					if {[file exists $ret]} {
						$parent.cmbFile set $ret
						$obj cmd_update
					}
			} $fmeTarget [self object]]]
			
			bind $cmbFile <FocusOut> [list [self object] cmd_update]

			set rdoProject [ttk::radiobutton $fmeTarget.rdoProject -value "project" -text [::msgcat::mc "Wrap Project"] \
				-variable [self namespace]::Priv(var,rdoTarget) \
				-command [format {
					set parent %s
					set obj %s
					$parent.cmbFile configure -state disabled
					$parent.btnFile configure -state disabled
					$parent.cmbProject configure -state normal
					$parent.btnProject configure -state normal
					$obj cmd_update
			} $fmeTarget [self object]]]
			set projects [$::dApp::Obj(pmgr) projects]
			set cmbProject [ttk::combobox $fmeTarget.cmbProject \
				-textvariable [self namespace]::Priv(var,cmbProject) \
				-values $projects \
			]
			$cmbProject set [$::dApp::Obj(pmgr) active]
			set btnProject [ttk::button $fmeTarget.btnProject -text [::msgcat::mc "Browse..."] \
				-command [format {
					set parent %s
					set obj %s
					set ret [tk_chooseDirectory -title [::msgcat::mc "Choose A Project"] -mustexist 1]
					if {[file exists $ret]} {
						$parent.cmbProject set $ret
						$obj cmd_update
					}
			} $fmeTarget [self object]]]

			bind $cmbProject <FocusOut> [list [self object] cmd_update]

			set Priv(var,output) [lindex $files 0]
			if {$Priv(var,output) != ""} {
				set dir [file dirname $Priv(var,output)]
				set name [file rootname [file tail $Priv(var,output)]]
				set Priv(var,output) [file join $dir $name]
				if {$::dApp::Env(os) == "windows"} {
					append Priv(var,output) .exe
				} else {
					append Priv(var,output) .bin
				}
			}
			set lblOutput [ttk::label $fmeTarget.lblOutput -text [::msgcat::mc "Output"] -justify left -anchor w]
			set txtOutput [ttk::entry $fmeTarget.txtOutput -textvariable [self namespace]::Priv(var,output)]
			set btnOutput [ttk::button $fmeTarget.btnOutput -text [::msgcat::mc "Browse..."] \
				-command [format {
					set parent %s
					set obj %s
					set ret [tk_getSaveFile -title [::msgcat::mc "Save To?"]]
					if {$ret != ""} {
						$parent.txtOutput delete 0 end
						$parent.txtOutput insert 0 $ret
						$obj cmd_update
					}
			} $fmeTarget [self object]]]

			bind $txtOutput <FocusOut> [list [self object] cmd_update]

			grid $rdoFile - -sticky news -padx 2 -pady 2
			grid $cmbFile $btnFile -sticky news -padx 2 -pady 2
			grid $rdoProject - -sticky news -padx 2 -pady 2
			grid $cmbProject $btnProject -sticky news -padx 2 -pady 2
			grid $lblOutput - -sticky news -padx 2 -pady 2
			grid $txtOutput $btnOutput -sticky news -padx 2 -pady 2
			grid columnconfigure $fmeTarget 0 -weight 1
			pack $fmeTarget -expand 1 -fill x -padx 3 -pady 3


			set fmeTclkit [ttk::labelframe $parent.fmeTclkit -text [::msgcat::mc "Command"] -padding 8]

			set lblTclkit [ttk::label $fmeTclkit.lblTclkit -text [::msgcat::mc "Tclkit"] -justify left -anchor w]
			set txtTclkit [ttk::entry $fmeTclkit.txtTclkit -textvariable [self namespace]::Priv(var,tclkit)]
			set btnTclkit [ttk::button $fmeTclkit.btnTclkit -text [::msgcat::mc "Browse..."] \
				-command [format {
					set parent %s
					set obj %s
					set ret [tk_getOpenFile -title [::msgcat::mc "Where is your Tclkit?"]]
					if {[file exists $ret]} {
						$parent.txtTclkit delete 0 end
						$parent.txtTclkit insert 0 $ret
						$obj cmd_update
					}
			} $fmeTclkit [self object]]]

			bind $txtTclkit <FocusOut> [list [self object] cmd_update]


			set lblSDX [ttk::label $fmeTclkit.lblSDX -text [::msgcat::mc "SDX"] -justify left -anchor w]
			set txtSDX [ttk::entry $fmeTclkit.txtSDX -textvariable [self namespace]::Priv(var,sdx)]
			set btnSDX [ttk::button $fmeTclkit.btnSDX -text [::msgcat::mc "Browse..."] \
				-command [format {
					set parent %s
					set obj %s
					set ret [tk_getOpenFile -title [::msgcat::mc "Where is your SDX?"]]
					if {[file exists $ret]} {
						$parent.txtSDX delete 0 end
						$parent.txtSDX insert 0 $ret
						$obj cmd_update
					}
			}  $fmeTclkit [self object]]]

			bind $txtSDX <FocusOut> [list [self object] cmd_update]

			set Priv(var,chkNoComp) 0
			set Priv(var,chkWritable) 0
			set Priv(var,chkStarpack) 1

			set chkNoComp [ttk::checkbutton $fmeTclkit.chkNoComp -onvalue 1 -offvalue 0 \
				-text [::msgcat::mc "Do not compress files added to starkit"] \
				-variable [self namespace]::Priv(var,chkNoComp) \
				-command [list [self object] cmd_update] ]
			set chkWritable [ttk::checkbutton $fmeTclkit.chkWritable -onvalue 1 -offvalue 0 \
				-text [::msgcat::mc "Allow modifications (must be single writer)"] \
				-variable [self namespace]::Priv(var,chkWritable) \
				-command [list [self object] cmd_update] ]

			set chkStarpack [ttk::checkbutton $fmeTclkit.chkStarpack -onvalue 1 -offvalue 0 \
				-text [::msgcat::mc "Include Runtime (Starpack)"] \
				-variable [self namespace]::Priv(var,chkStarpack) \
				-command [list [self object] cmd_update] ]

			set lbltxt [ttk::label $fmeTclkit.lbltxt -text [::msgcat::mc "Command:"] -justify left -anchor w]
			set txt [text $fmeTclkit.txt -height 4]
			bind $txt <FocusOut> [list [self object] cmd_update]

			grid $lblTclkit $txtTclkit $btnTclkit -padx 2 -pady 2 -sticky news
			grid $lblSDX $txtSDX $btnSDX -padx 2 -pady 2 -sticky news
			grid $chkNoComp - - -padx 2 -pady 2 -sticky news
			grid $chkWritable - - -padx 2 -pady 2 -sticky news
			grid $chkStarpack - - -padx 2 -pady 2 -sticky news
			grid $lbltxt - - -padx 2 -pady 2 -sticky news
			grid $txt - - -padx 2 -pady 2 -sticky news

			grid columnconfigure $fmeTclkit 1 -weight 1
			pack $fmeTclkit -expand 1 -fill x -padx 3 -pady 3

			set Priv(wdg,txt) $txt
			$rdoFile invoke

			if {[set val [$rc get "EzSDX.cmbFile"]] != ""} {set Priv(var,cmbFile) $val }
			if {[set val [$rc get "EzSDX.cmbProject"]] != ""} {set Priv(var,cmbProject) $val}
			if {[set val [$rc get "EzSDX.output"]] != ""} {set Priv(var,output) $val}
			if {[set val [$rc get "EzSDX.chkWritable"]] != ""} {set Priv(var,chkWritable) $val }
			if {[set val [$rc get "EzSDX.chkNoComp"]] != ""} {set Priv(var,chkNoComp) $val }
			if {[set val [$rc get "EzSDX.chkStarpack"]] != ""} {set Priv(var,chkStarpack) $val }
			if {[set val [$rc get "EzSDX.rdoTarget"]] != ""} {
				set Priv(var,rdoTarget) $val 
				if {$val == "file"} {$rdoFile invoke}
				if {$val == "project"} {$rdoProject invoke}
			}
			if {[set val [$rc get "ezSDX.tclkit"]] != ""} {set Priv(var,tclkit) $val }
			if {[set val [$rc get "ezSDX.sdx"]] != ""} {set Priv(var,sdx) $val }
			
			[self object] cmd_update
		}

		set ret [$dlg show]
		if {$ret == "wrap"} { $dlg start_wrap }		
		$dlg destroy
	}
}




$plugin toggle
