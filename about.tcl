package require http

oo::class create ::dApp::about {
	superclass ::twidget::dialog
	constructor {wpath} {
		my variable Priv
		array set Priv [list]

		next $wpath\
			-title [::msgcat::mc "About"]  \
			-cancel 1 \
			-position auto \
			-buttons [list]
	}

	destructor {
		my variable Priv
		next
		array unset Priv
	}

	method body {fme} {

		set ibox $::dApp::Obj(ibox)
		set fontVersion $::dApp::Font(large-bold)
		set fontDate $::dApp::Font(small)
		set fontTitle $::dApp::Font(middle-bold)
		set fontName $::dApp::Font(middle)
		set fontEmail $::dApp::Font(middle)

		set fmeLeft [ttk::frame $fme.fmeLeft]
		set fmeRight [ttk::frame $fme.fmeRight -padding 20]
		pack $fmeLeft  -side left -expand 0 -fill both
		pack $fmeRight -side left -expand 1 -fill both

		set lblIcon [ttk::label $fmeLeft.lblIcon -compound "left" -image [$ibox get logo] -anchor "center" -anchor s]
		set lblVer [ttk::label $fmeLeft.lblVer -text "$::dApp::Env(title) v$::dApp::Env(version)" -anchor "center" -font $fontVersion]
		set lblDate [ttk::label $fmeLeft.lblDate -text "$::dApp::Env(date)" -anchor "center" -font $fontDate]
		set btnHome [ttk::button $fmeLeft.btnHome -text [::msgcat::mc "Web Site"] -command {}]
		set btnClose [ttk::button $fmeLeft.btnClose \
			-default active \
			-text [::msgcat::mc "Close"] \
			-command [list [self object] close -1]]
		pack $lblIcon -expand 1 -fill both -side top -padx 30 -pady 10
		pack $lblVer -fill x -side top -pady 6
		pack $lblDate -fill x -side top -pady 1
		#pack $btnHome -side top -pady 6 -fill x -padx 15
		pack $btnClose -side top -pady 6 -fill x -padx 15

		set txt [text $fmeRight.txt -bd 2 -relief groove -highlightthickness 0 -takefocus 0 -width 45 -height 15]
		set lblCp [ttk::label $fmeRight.lblCp \
			-text [::msgcat::mc "Copyright (C) 2009 - %s Yuan-Liang Tai" [clock format [clock scan now] -format "%Y"]] \
			-anchor "center" \
			-font $fontDate]
		set vs [ttk::scrollbar $fmeRight.vs -command [list $txt yview] -orient vertical]
		::autoscroll::autoscroll $vs
		$txt configure -yscrollcommand [list $vs set]

		grid $txt $vs -sticky "news"
		grid $lblCp -  -sticky "news"
		grid rowconfigure $fmeRight 0 -weight 1
		grid columnconfigure $fmeRight 0 -weight 1

		$txt insert end "Programming\n" title
		$txt insert end "Yuan-Liang Tai\n" name
		$txt insert end "dai@turtle.ee.ncku.edu.tw\n" mail
		$txt insert end "http://code.google.com/p/ezdit/\n\n" mail
		$txt insert end "Guang-Hung Huang\n" name
		$txt insert end "labyrinth@turtle.ee.ncku.edu.tw\n\n" mail

		$txt insert end "Credits\n" title
		$txt insert end "Thanks to Fabien Legiret , who translated the ezdit into French.\n" name
		$txt insert end "Thanks to Holger Jakobs , who translated the ezdit into German.\n" name
		$txt insert end "Thanks to Mozillazg , who translated the ezdit into Simplified Chinese.\n" name
		$txt insert end "\n" name

		$txt insert end "License\n" title
		set fd [open [file join $::dApp::Env(appPath) license.txt] r]
		$txt insert end [read $fd] name
		close $fd

		$txt tag configure title -font $fontTitle
		$txt tag configure name -font $fontName
		$txt tag configure mail -font $fontEmail -foreground blue
		$txt configure -state disabled
	}
}

oo::class create ::dApp::update {
	superclass ::twidget::dialog
	constructor {wpath} {
		my variable Priv
		array set Priv [list]

		next $wpath\
			-title [::msgcat::mc "%s Updates" $::dApp::Env(title)]  \
			-cancel 1 \
			-position auto \
			-buttons [list]
	}

	destructor {
		my variable Priv
		next
		array unset Priv
	}

	method body {fme} {
		my variable Priv

		$fme configure -padding 3
		set lbl [::ttk::label $fme.lbl -text [::msgcat::mc "Message:"]]
		set txt [text $fme.txt -bd 2 -relief groove -highlightthickness 0 \
			-takefocus 0 -width 60 -height 15 \
			-font $::dApp::Font(middle)]
		set vs [ttk::scrollbar $fme.vs -command [list $txt yview] -orient vertical]
		$txt configure -yscrollcommand [list $vs set]
		::autoscroll::autoscroll $vs
		set fmeBtn [::ttk::frame $fme.fmeBtn]

		set chkUpdate [::ttk::checkbutton $fmeBtn.chkUpdate \
			-offvalue 0 \
			-onvalue 1 \
			-variable ::dApp::Param(autoUpdate) \
			-text [::msgcat::mc "Automatic check on startup."] \
		]

		set btnCheck [::ttk::button $fmeBtn.btnCheck \
			-text [::msgcat::mc "Check"] \
			-command [list [self object] check $txt]]
		set btnClose [::ttk::button $fmeBtn.btnClose \
			-default active \
			-text [::msgcat::mc "Close"] \
			-command [list [self object] close -1]]

		#pack $chkUpdate -side left -padx 5
		pack $btnClose $btnCheck -side right -padx 5 -pady 3

		grid $lbl - -sticky "news" -pady 3
		grid $txt $vs -sticky "news"  -pady 3
		grid $fmeBtn -  -sticky "news" -pady 3
		grid rowconfigure $fme 1 -weight 1
		grid columnconfigure $fme 0 -weight 1

		after 1000 [list catch [list [self object] check $txt]]
	}

	method check {{txt ""} {timeout 5000}} {
		my variable Priv

		if {[winfo exists $txt]} {
			$txt delete 1.0 end
			$txt insert end [::msgcat::mc "Checking for Updates ..."]
			$txt insert end "\n\n"
			update
		}

		set code 403
		set ver 0
		set changes [::msgcat::mc "These are no new updates available."]
		http::config -useragent "$::dApp::Env(title) v$::dApp::Env(version) "
		catch {
				set headers [list Accept-Charset "utf-8;q=0.7,*;q=0.7"]
				set tok [http::geturl $::dApp::Env(versionpage) -timeout $timeout -type "text/plain" -headers $headers]
				set data  [string trim [http::data $tok]]
				set s [http::status $tok]
				set code [http::ncode $tok]
				http::cleanup $tok
		}

		if {$code != 200} {
			set ret [::msgcat::mc "Can't connect to update server."]
			if {[winfo exists $txt]} { $txt insert end $ret}
			return $ret
		}

		if {[catch {
			my rc_parse $data
			set ver $Priv(rc,version)
			set url $Priv(rc,url)
		}]} {return [::msgcat::mc "These are no new updates available."]}

		set flag 0
		foreach	{new} [split $ver "."] {old} [split $::dApp::Env(version) "."] {
			if {$new > $old} {
				set flag 1
				break
			}
		}

		if {$flag == 1} {
			set changes [::msgcat::mc "Version %s changelog : " $ver]
			append changes "\n\n"
			foreach  item $Priv(rc,changes) {append changes "   -" $item "\n"}
		}

		if {$flag == 0} {
			set ret [::msgcat::mc "These are no new updates available."]
			if {[winfo exists $txt]} {$txt insert end $ret}
			return $ret
		}

		if {![winfo exists $txt]} {
			return  [::msgcat::mc "These is new %s available!!" $::dApp::Env(title)]
		}

		$txt insert end [::msgcat::mc "These is new %s available!!" $::dApp::Env(title)]
		$txt insert end "\n\n"

		$txt insert end $changes
		$txt insert end "\n"
		$txt insert end [::msgcat::mc "Web Site: %s" $::dApp::Env(homepage)]
		$txt insert end "\n\n"
		$txt insert end [::msgcat::mc "Download latest version of the %s ." $::dApp::Env(title)] download


		$txt tag configure download -foreground blue -underline 1
		$txt tag bind download <ButtonPress> [list [self object] goto $url]
		$txt tag bind download <Enter> [list $txt configure -cursor "hand2"]
		$txt tag bind download <Leave> [list $txt configure -cursor ""]

		return
	}

	method rc_parse {data} {
		my variable Priv
		array unset Priv rc,*
		set key ""
		foreach {data} [split $data "\n"] {
			set data [string trim $data]
			if {[string trim $data] == ""} {continue}
			set type [string index $data 0]
			set data [string range $data 1 end]
			if {$type == "+"} {
				set key $data
				continue
			}
			if {$type == "-"} {
				lappend Priv(rc,$key) $data
				continue
			}
		}
	}

	method goto {url} {
		switch -exact -- $::dApp::Env(os) {
			"windows" {
				set ie "C:/Program Files/Internet Explorer/iexplore.exe"
				if {![file exists $ie]} {return}
				if {[catch {exec $ie $url &} ret]} {$::dApp::Obj(out) puts $ret\n}
			}
			"linux" {
				if {[catch {exec firefox $url & } ret]} {$::dApp::Obj(out) puts $ret\n}
			}
			"darwin" {
				if {[catch {exec open -a Safari $url &} ret]} {$::dApp::Obj(out) puts $ret\n}
			}
		}
	}

}
