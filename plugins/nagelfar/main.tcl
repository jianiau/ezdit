#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}

oo::objdefine $NAGELFAR {
	method check {} {
		my variable Priv
		
		set txt $Priv(text)
		set nbo $::dApp::Obj(nbo)
		$nbo raise [::msgcat::mc "Nagelfar"]
		my clear
		
		set fpath [$::dApp::Obj(nbe) selection]
	
		set tp [interp create]
		$tp eval [list set ::Nagelfar(embedded) 1]
		$tp eval [list source [file join $Priv(plugPath)  "nagelfar.tcl"]]
		set ret [$tp eval [list synCheck $fpath [file join $Priv(plugPath) "syntaxdb.tcl"]]]	
		
		update idletasks
		foreach item $ret {
			if {[regexp {Line\s+([0-9]+): ([WE]) (.*)} $item -> line type msg]} {
				switch -- $type {
					W {set color "blue"}
					E {set color "red"}
					default {set color ""}
				}
				set out [msgcat::mc "Line %d: %s"  $line $msg]
				my puts $out $fpath $line $color
				update idletasks
			}
		}
		interp delete $tp
		$txt configure -state normal	
		incr Priv(tagCut)
		$txt insert end [::msgcat::mc "Done."] tag$Priv(tagCut)
		$txt tag configure tag$Priv(tagCut) -foreground "black" 
		$txt configure -state disabled
	}	
	
	method clear {} {
		my variable Priv
		set txt $Priv(text)
		
		$txt configure -state normal
		$txt delete 0.0 end
		$txt configure -state disabled
	}	
	
	method goto {fpath line} {
		
		$::dApp::Obj(nbe) open $fpath

		set editor [$::dApp::Obj(nbe) editor]
		
		if {$editor == ""} {return}
		
		$editor goto $line.0
		
		after idle [list focus [$editor cget -wtext]]
	}	
	
	method puts {msg fpath line color} {
		my variable Priv
		set txt $Priv(text)
		
		incr Priv(tagCut)
		
		$txt configure -state normal
		$txt insert end $msg tag$Priv(tagCut)
		
		if {$color != ""} {	$txt tag configure tag$Priv(tagCut) -foreground $color } 	
	
		$txt insert end "\n"
		$txt tag bind tag$Priv(tagCut) <ButtonPress-1> [list [self object] goto $fpath $line]
		$txt tag bind tag$Priv(tagCut) <Enter> "$txt configure -cursor hand2 ; $txt tag configure tag$Priv(tagCut) -underline 1"
		$txt tag bind tag$Priv(tagCut) <Leave> "$txt configure -cursor arrow ; $txt tag configure tag$Priv(tagCut) -underline 0"	
		$txt see end
		$txt configure -state disabled
	}	
	
	method Ui_Init {} {
		my variable Priv
		
		set pane [$::dApp::Obj(nbo) cget -frame]
		
		set fme [ttk::frame $pane.fme -borderwidth 0 -relief groove]
		set txt [text $fme.txt -height 1 -bg white -relief ridge \
			-bd 0 -takefocus 0 -highlightthickness 0 -wrap none \
			-font $::dApp::Font(middle)]
		
		set vs [ttk::scrollbar $fme.vs -command [list $txt yview] -orient vertical]
		set hs [ttk::scrollbar $fme.hs -command [list $txt xview] -orient horizontal]
		$txt configure -xscrollcommand [list $hs set] -yscrollcommand [list $vs set]
		
		::autoscroll::autoscroll $vs
		::autoscroll::autoscroll $hs
	
		grid $txt $vs -sticky "news"
		grid $hs - -sticky "we"
		grid rowconfigure $fme 0 -weight 1
		grid columnconfigure $fme 0 -weight 1
		
		set m [menu $txt.m -tearoff 0]
		$m add command -compound left \
			-label [::msgcat::mc "Clear"] \
			-image [$::dApp::Obj(ibox) get clear] \
			-command [list [self object] clear]
		
		bind $txt <<MenuPopup>> [list tk_popup $m %X %Y]
		
		$txt insert end "Nagelfar v1.1.10 , Syntax Database 8.5 (designed by Peter Spjuth)." tagHelp
		
		$txt tag configure tagHelp -foreground "blue"
		
		set Priv(nbo,tabId) [$::dApp::Obj(nbo) add [::msgcat::mc "Nagelfar"] $fme]
		
		set Priv(obj,EditorMenu) [::dApp::nbe::EditorMenu new]
		oo::objdefine $Priv(obj,EditorMenu) method create {m} {
			set fpath [$::dApp::Obj(nbe) selection]
			if {$fpath == ""} {return}
			set ext [string tolower [file extension $fpath]]
			if {$ext  != ".tcl"} {return}
			
			$m add command \
				-label [::msgcat::mc "Check Syntax (Nagelfar)"]  \
				-compound left \
				-image [$::dApp::Obj(ibox) get nagelfar] \
				-command [list $::dApp::Obj(nagelfar) check]
		}		
		
		set Priv(obj,ToolsMenu) [::dApp::mbar::ToolsMenu new]
		oo::objdefine $Priv(obj,ToolsMenu) method create {m} {
			set state "normal"
			set fpath [$::dApp::Obj(nbe) selection]
			if {$fpath == ""} {set state "disabled"}
			set ext [string tolower [file extension $fpath]]
			if {$ext  != ".tcl"} {set state "disabled"}
			
			$m add command \
				-state $state \
				-label [::msgcat::mc "Check Syntax (Nagelfar)"]  \
				-compound left \
				-image [$::dApp::Obj(ibox) get nagelfar] \
				-command [list $::dApp::Obj(nagelfar) check]
		}		
		
		set Priv(text) $txt
	}
}
