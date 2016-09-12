#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}

namespace eval ::dApp {
	variable Priv
	array set Priv [list \
		requireTk 1 \
		appPath "" \
		title "The title of your application" \
	]

}


proc ::dApp::init {} {
	variable Priv

	set appPath [file normalize [info script]]
	if {[file type $appPath] == "link"} {set appPath [file readlink $appPath]}

	set appPath [file dirname $appPath]

#	if {[namespace exists ::vfs]} {set appPath [file dirname [file dirname $appPath]]}

	set Priv(appPath) $appPath

	if {[file exists [file join $appPath "lib"]]} {
		set ::auto_path [linsert $::auto_path 0 [file join $appPath "lib"]]
	}

	if {$Priv(requireTk)} {
		package require Tk

		wm title . $Priv(title)
		wm protocol . WM_DELETE_WINDOW ::dApp::quit
	}

	::dApp::main
}

# The quit function of your application
proc ::dApp::quit {} {
	variable Priv

	exit
}

# The main function of your application
proc ::dApp::main {} {
	variable Priv
	#puts $Priv(appPath)  ;# application path

}

::dApp::init
