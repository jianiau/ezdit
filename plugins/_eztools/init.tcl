set plugin [::dApp::plugin new]

oo::objdefine $plugin {
	method author {} {return "dai"}
	method description {} {return ""}
	method name {} {return [::msgcat::mc "Color Picker"]}
	method version {} {return "1.0"}

	method init {} {
		my variable Priv

		set obj [::dApp::mbar::ToolsMenu new]
		oo::objdefine $obj method create {m} [format {
			set state "normal"
			if {[set editor [$::dApp::Obj(nbe) editor]] == "" } {set state "disabled"}
			$m add command -state $state \
				-label [::msgcat::mc "Color Picker"] \
				-compound left \
				-image [$::dApp::Obj(ibox) get color_picker] \
				-command [list %s color_picker]
		} [self object]]

		set Priv(obj,ToolsMenu,color_picker) $obj

#		set obj [::dApp::mbar::ToolsMenu new]
#		oo::objdefine $obj method create {m} [format {
#			set state "normal"
#			if {[set editor [$::dApp::Obj(nbe) editor]] == "" } {set state "disabled"}
#			$m add command -state $state \
#				-label [::msgcat::mc "Trim Trailing Space"] \
#				-compound left \
#				-image [$::dApp::Obj(ibox) get empty] \
#				-command [list %s trim_space]
#		} [self object]]

#		set Priv(obj,ToolsMenu,trim_space) $obj
	}

	method cleanup {} {
		my variable Priv

#		$Priv(obj,ToolsMenu,trim_space) destroy
		$Priv(obj,ToolsMenu,color_picker)  destroy
	}

#	method trim_space {} {
#		my variable Priv
#
#		if {[set editor [$::dApp::Obj(nbe) editor]] == "" } {return}
#		set txt [$editor cget -wtext]
#		set data ""
#		foreach {line} [split [$txt get 1.0 end] "\n"] {
#			append data [string trimright $line] "\n"
#		}
#		$txt replace 1.0 end [string trimright $data]
#		unset data
#		set idx1 [$txt index "@0,0"]
#		set idx2 [$txt index "@[winfo width $txt],[winfo height $txt]"]
#
#		$editor highlight_start $idx1 $idx2
#	}

	method color_picker {} {
		my variable Priv

		set color [tk_chooseColor -initialcolor gray -title "Choose color"]
		if {$color == ""} {return}

		set nbe $::dApp::Obj(nbe)
		set editor [$nbe editor]
		if {$editor == ""} {return}
		set txt [$editor cget -wtext]
		if {![winfo exists $txt]} {return}

		$txt insert insert $color
	}

	method convert_encoding {enc} {
		my variable Priv
	}
}

$plugin toggle
