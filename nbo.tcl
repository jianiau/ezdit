oo::class create ::dApp::nbo {
	superclass ::twidget::notebook
	constructor {} {
		my variable Priv

		array set Priv [list ]

		if {[lsearch -exact [font names] EzConsoleFont] == -1} {
			font create EzConsoleFont \
				-size [font configure $::dApp::Font(middle) -size] \
				-family [font configure $::dApp::Font(middle) -family]
		}

		next .nbo -control 0 -close 0 -icon 0
		$::dApp::Obj(layout) pane add "B" "NBO" .nbo 1

		my configure \
			-tabfg [list "#FFFFFF" {selected} "#656565" {}] \
			-tabbg [list "#6687b4" {selected} "#cfd2cb" {}] \
			-taboutline [list "#d8d8d8" {selected} "#d8d8d8" {}] \
			-font $::dApp::Font(small-bold)

		set ::dApp::Obj(nbo) [self object]

		my Tkcon_Init [my cget -frame].tkcon
		my Notes_Init [my cget -frame].wnote

#		lassign [chan pipe] rfd wfd
#		chan configure $rfd -buffering line -blocking 0
#		chan event $rfd readable [list [self object]  pipe_reader]
#		set Priv(rfd) $rfd
#		set Priv(wfd) $wfd

	}

	destructor {
		my variable Priv
		array unset Priv
	}

	method console_clear {} {
		$::dApp::Obj(out) clear
		::tkcon::Prompt
	}

	method ezdo {args} {
		eval {*}$args
	}

	method ezopen {args} {
		my variable Priv

		foreach item $args {
			if {![file exists $item]} {continue}
			if {[file isfile $item]} {$::dApp::Obj(nbe) open $item}
			if {[file isdirectory $item]} {	$::dApp::Obj(pmgr) open $item}
		}
		foreach w  [winfo children $Priv(tkcon)] {
			if {[string first ".tab" $w] > 0} {

				after 250 [list after idle [list focus $w]]
				break
			}
		}
	}

	method raise {title} {
		set item [my find $title]
		if {$item != ""} {my selection $item}
	}

	method rc_load {} {
		my variable Priv

		set rc $::dApp::Obj(rc)
		set txt [$rc get "Nbo.Selection"]
		if {$txt != ""} {my raise $txt}


	}

	method rc_save {} {
		my variable Priv

		set rc $::dApp::Obj(rc)

		set tab [my selection]

		set txt [my tab cget $tab -text]

		$rc set "Nbo.Selection" $txt
	}

#	method pipe_get {} {
#		my variable Priv
#
#		if {[chan eof $Priv(rfd)] || [chan eof $Priv(wfd)]} {
#			catch {chan close $Priv(rfd) }
#			catch {chan close $Priv(wfd)}
#			lassign [chan pipe] rfd wfd
#			chan configure $rfd -buffering line -blocking 0
#			chan event $rfd readable [list [self object]  pipe_reader]
#			set Priv(rfd) $rfd
#			set Priv(wfd) $wfd
#		}
#		return [list $Priv(rfd) $Priv(wfd)]
#	}

#	method pipe_reader {} {
#		my variable Priv
#
#		set out $::dApp::Obj(out)
#		$out puts [chan read $Priv(rfd)]
#
#		if {[chan eof $Priv(rfd)] || [chan eof $Priv(wfd)]} {
#			catch {chan close $Priv(rfd) }
#			catch {chan close $Priv(wfd)}
#			lassign [chan pipe] rfd wfd
#			chan configure $rfd -buffering full -blocking 0
#			chan event $rfd readable [list [self object]  pipe_reader]
#			set Priv(rfd) $rfd
#			set Priv(wfd) $wfd
#		}
#	}

	method Tkcon_Init {wpath} {
		my variable Priv

		namespace eval :: [list source [file join $::dApp::Env(appPath) tkcon.tcl]]
		set tkcon [tkcon::AtSource $wpath]
		my add [::msgcat::mc "Console"] $tkcon

		set Priv(tkcon) $tkcon

		set ::dApp::Obj(out) output

		interp alias {} $::dApp::Obj(out) {} ::tkcon::EvalSlave
	}

	method Notes_Init {wpath} {
		my variable Priv

		 source [file join $::dApp::Env(appPath) wnote.tcl]
		 set notes [::wnote::init $wpath]
		 my add [::msgcat::mc "Notes"] $notes
		 set Priv(notes) $notes
	}
}

set ::dApp::Obj(nbo) [::dApp::nbo new]
