#!/usr/local/bin/wish

package require Tk
package require msgcat
package require TclOO

 proc tk::FirstMenu {args} {}

#if {$::tcl_version < 8.6} {
	catch {package require img::png}
#}
#conf_start
namespace eval ::dApp {
	variable Obj
	array set Obj [list]

	variable Env

	array set Env [list \
		appName "ezdit" \
		os ""	\
		appPath "" \
		date "2011/12/29" \
		imgPath "" \
		locale [::msgcat::mclocale] \
		theme "default" \
		rcPath [file join $::env(HOME) ".ezdit"] \
		title "ezdit" \
		version "0.9.3" \
		homepage "http://code.google.com/p/ezdit/" \
		versionpage "http://got7.org/ezdit/ezdit-info.conf" \
		outline,timer "" \
	]

	variable Font

	set family "Arial"
	array set Font [list \
		small [font create -family $family -size 12] \
		small-bold [font create -family $family -size 12 -weight bold] \
		middle [font create -family $family -size 14] \
		middle-bold [font create -family $family -size 14 -weight bold] \
		large [font create -family $family -size 16] \
		large-bold [font create -family $family -size 16 -weight bold] \
		menu TkMenuFont \
		console [font create -family $family -size 14] \
	]

	variable Param

	array set Param [list \
		syntaxHighlight 1 \
		syntaxHint 1 \
		codeOutline 1 \
		sortSymbol 0 \
		autoUpdate 0 \
	]

}
#conf_end

oo::class create ::dApp::main {

	constructor {args} {
		set ::dApp::Obj(ezdit) [self object]

		my Env_Init
		my Templ_Init
		my Ui_Init
		my Plugin_Init
		#my Test
		my Rc_Load
		my Argv_Handler {*}$::argv
	}

	destructor {

	}

	method make_locale_menu {m} {
		set ibox $::dApp::Obj(ibox)
		foreach {key} [lsort -dictionary [array names ::dApp::Locale *]] {
			set val $::dApp::Locale($key)
			$m add radiobutton -compound left \
				-label $val \
				-value $key \
				-variable ::dApp::Env(locale) \
				-command {
						tk_messageBox -title [::msgcat::mc "Information"] \
							-icon info \
							-type ok \
							-message [::msgcat::mc "Please restart %s to apply settings." $::dApp::Env(title)]
				}
		}
	}

	method make_theme_menu {m} {
		set ibox $::dApp::Obj(ibox)
		set m2 [menu $m.ui_themes -tearoff 0]

		$m add cascade -compound left \
			-label [::msgcat::mc "Themes"] \
			-image [$ibox get empty] \
			-menu $m2

		set Priv(var,theme) [ttk::style theme use]
		foreach t [lsort [ttk::style theme names]] {
		 	$m2	 add radiobutton -compound left \
		 		-variable ::dApp::Env(theme) \
		 		-label $t \
		 		-image [$ibox get empty] \
		 		-command [list ttk::style theme use $t]
		}
	}

	method font {cmd args} {
		return [my font_$cmd {*}$args]
	}

	method font_decr {type} {
		set f $::dApp::Font($type)
		set size [font configure $f -size]
		font configure $f -size [expr abs(abs($size) - 1)]
	}

	method font_incr {type} {
		set f $::dApp::Font($type)
		set size [font configure $f -size]
		font configure $f -size [expr abs($size) + 1]
	}

	method font_set {type {family ""} {size ""}} {
		if {$family == "" || $size == ""} {
			set dlg [::twidget::dialog new .nbe_font \
				-cancel 1 \
				-title [::msgcat::mc "Choose %s Font" [string totitle $type]] \
				-type "fontbox" \
				-font $::dApp::Font($type) \
				-default cancel \
				-position auto \
				-buttons [list ok [::msgcat::mc "Ok"] cancel [::msgcat::mc "Cancel"]] \
			]

			lassign [$dlg show] ret family size
			$dlg destroy
			if {$ret != "ok"} {return}
		}
		set family [string trim $family "{}"]

		if {$type == "menu" || $type == "console"} {
			font configure $::dApp::Font($type) -family $family -size $size
			return
		}
		font configure $::dApp::Font($type) -family $family -size $size
		font configure $::dApp::Font(${type}-bold) -family $family -size $size

		if {$type  == "middle"} {
			font configure EzTreeviewFont -family $family -size $size
		}

		if {$type == "small"} {
			font configure TkDefaultFont -family $family -size $size
			font configure TkFixedFont -family $family -size $size
			font configure TkTextFont -family $family -size $size
			font configure TkCaptionFont -family $family -size $size
			$::dApp::Obj(nbe) configure -font $::dApp::Font($type)
			$::dApp::Obj(nbo) configure -font $::dApp::Font($type)
		}
	}

	method quit {} {
		my Rc_Save

		if {[$::dApp::Obj(nbe) close_all] == "cancel"} {return}
		if {[info commands dbus] != ""} {catch {dbus close}}
		exit
	}

	method Argv_Handler {args} {
		foreach item $args {
			#set item [encoding convertfrom [encoding system] $item]
			if {[string range $item 0 6] == "file://"} {set item [string range $item 7 end]}
			if {![file exists $item]} {continue}
			if {[file isfile $item]} {
				$::dApp::Obj(nbe) open $item
				continue
			}
			if {[file isdirectory $item]} {
				$::dApp::Obj(pmgr) open $item
				continue
			}
		}
		return ""
	}

	method Env_Init {} {

		set appPath [file normalize [info script]]
		if {[file type $appPath] == "link"} {set appPath [file readlink $appPath]}

		set appPath [file dirname $appPath]

		set ::auto_path [linsert $::auto_path 0 [file join $appPath "lib"]]
		set os [string tolower $::tcl_platform(os)]

		if {[string first "windows" $os] >= 0} {set os "windows"}

		set lib [file join $appPath lib_$os]
		if {[file exists $lib]} {lappend ::auto_path $lib}

		my Service_[string totitle $os]_Init

		package require twidget::ibox
		package require twidget::rc
		package require twidget::hook
		package require twidget::dialog
		package require twidget::editor
		package require twidget::notebook
		package require twidget::toolbar
		package require twidget::treeview
		package require dApp::ceditor

		if {![file exists $::dApp::Env(rcPath)]} {file mkdir $::dApp::Env(rcPath)}

		set ::dApp::Env(os) $os
		set ::dApp::Env(appPath) $appPath
		set ::dApp::Env(imgPath) [file join $appPath images]
		set ::dApp::Obj(rc)	[::twidget::rc new [file join $::dApp::Env(rcPath) "ezdit.conf"]]
		set ::dApp::Obj(ibox)	[::twidget::ibox new]

		# <-- load images
		if {[file exists $::dApp::Env(imgPath)]} {
			foreach {f} [glob -nocomplain -directory [file join $appPath images] -- *.png] {
				if {[string index [file tail $f] 0] == "."} {continue}
				$::dApp::Obj(ibox) add $f
			}
		}
		#-->
		option add *nbtree.Background [. cget -background]
		option add *Menu.Font $::dApp::Font(menu)

		ttk::style element create Clear.field image [$::dApp::Obj(ibox) get clear]
		ttk::style layout Clear.TEntry {
			Entry.field -sticky nswe -children {
				Entry.padding -sticky nswe -children {
					Entry.textarea -sticky nswe -side left
					Clear.field -sticky e -side left
				}
			}
		}
		
		ttk::style configure Toolbutton \
			-font $::dApp::Font(small)

		my Env_[string totitle $os]_Init

		my Locale_Init
	}

	method Env_Darwin_Init {} {
		option add *nbtree.Background  systemToolbarBackground

		event delete <<TabClose>>
		event delete <<MenuPopup>>
		event add <<TabClose>> <ButtonRelease-3>
		event add <<MenuPopup>> <ButtonRelease-2>

		ttk::style configure Toolbutton -padding 2 -font $::dApp::Font(small)

	}

	method Env_Windows_Init {} {
		package require twapi

		append ::env(Path) ";" $::dApp::Env(rcPath)
		if {![file exists [file join $::dApp::Env(rcPath) cat.exe]]} {
			file copy -force [file join $::dApp::Env(appPath) tools cat.exe] [file join $::dApp::Env(rcPath) cat.exe]
		}		
		
	}

	method Env_Linux_Init {} {
		

	}

	method Locale_Init {} {
		set appPath $::dApp::Env(appPath)
		source -encoding utf-8 [file join $appPath locales list.tcl]
		set locale [$::dApp::Obj(rc) get "Ezdit.Locale"]
		if {$locale != ""} {
			set ::dApp::Env(locale) $locale
			::msgcat::mclocale $locale
		}
		::msgcat::mcload [file join $appPath locales]
	}

	method Plugin_Init {} {

		set appPath $::dApp::Env(appPath)
		set plugdir [file join $appPath plugins]
		source -encoding utf-8 [file join $plugdir plugin.tcl]

		set dlist [glob -nocomplain -directory $plugdir -types {d} -- *]
		set cut 0
		foreach {d} $dlist {
			set init [file join $d init.tcl]
			if {![file isfile $init]} {continue}
			#set PLUGIN [::dApp::plugin new $d]
			source -encoding utf-8 $init
			#if {[string first "_" [file tail $d]] == 0} {$PLUGIN toggle}

		}
	}

	method Rc_Load {} {
		set rc $::dApp::Obj(rc)

		foreach item [list small middle large menu console] {
			set size [$rc get "Ezdit.Font.$item.Size"]
			set family [$rc get "Ezdit.Font.$item.Family" ]
			if {$size != "" && $family != ""} {my font set $item $family $size}
		}

		set plugins [$rc get "Ezdit.Plugin.List"]
		if {[llength $plugins] > 0} {
			foreach plugin [info class instances ::dApp::plugin] {
				set dir [$plugin pwd]
				set fname [file tail $dir]
				if {[string first "_" $fname] == 0} {continue}
				if {[lsearch -exact $plugins $fname] < 0} {continue}
				$plugin toggle
			}
		}
		if {[set val [$rc get "Ezdit.Theme"]] != ""} {
			set ::dApp::Env(theme) $val
			#ttk::style theme use $val
		}
		if {[set val [$rc get "Ezdit.SyntaxHighlight.Enabled"]] != ""} {set ::dApp::Param(syntaxHighlight) $val}
		if {[set val [$rc get "Ezdit.SyntaxHint.Enabled"]] != ""} {set ::dApp::Param(syntaxHint) $val}
		if {[set val [$rc get "Ezdit.CodeOutline.Enabled"]] != ""} {set ::dApp::Param(codeOutline) $val}
		if {[set val [$rc get "Ezdit.SortSymbol.Enabled"]] != ""} {set ::dApp::Param(sortSymbol) $val}
		if {[set val [$rc get "Ezdit.AutoUpdate.Enabled"]] != ""} {set ::dApp::Param(autoUpdate) $val}

		foreach {obj} [list nbo pmgr nbe layout run] {
			$::dApp::Obj($obj) rc_load
		}

	}

	method Rc_Save {} {
		foreach {obj} [list nbo pmgr nbe layout run] {
			$::dApp::Obj($obj) rc_save
		}

		set rc $::dApp::Obj(rc)
		$rc set "Ezdit.Locale" $::dApp::Env(locale)
		$rc set "Ezdit.Theme" $::dApp::Env(theme)

		foreach item [list small middle large menu console] {
			$rc set "Ezdit.Font.$item.Size" [font configure $::dApp::Font($item) -size]
			$rc set "Ezdit.Font.$item.Family" [string trim [font configure $::dApp::Font($item) -family] "{}"]
		}

		$rc delete "Ezdit.Plugin.List"
		foreach plugin [info class instances ::dApp::plugin] {
			if {![$plugin state]} {continue}
			set dir [$plugin pwd]
			if {[string first "_" [file tail $dir]] == 0} {continue}
			$rc append "Ezdit.Plugin.List" [file tail $dir]
		}

		$rc set "Ezdit.SyntaxHighlight.Enabled" $::dApp::Param(syntaxHighlight)
		$rc set "Ezdit.SyntaxHint.Enabled" $::dApp::Param(syntaxHint)
		$rc set "Ezdit.CodeOutline.Enabled" $::dApp::Param(codeOutline)
		$rc set "Ezdit.SortSymbol.Enabled" $::dApp::Param(sortSymbol)
		$rc set "Ezdit.AutoUpdate.Enabled" $::dApp::Param(autoUpdate)

	}

	method Service_Darwin_Init {} {
	}

	method Service_Linux_Init {} {
		if {[catch {package require dbus-tcl}]} {return	}
		dbus connect

		if {[llength $::argv] && ![catch {dbus call -dest org.got7.ezdit.dbus / org.got7.ezdit open {*}$::argv}]} {
			dbus close
			exit
		}

		dbus name -yield -replace org.got7.ezdit.dbus
		dbus filter add -interface org.got7.ezdit
		dbus method / open [list [self object] Argv_Handler]

		return
	}

	method Service_Windows_Init {} {
		package require dde
		if {[catch {[dde execute TclEval EzditService {_file_not_exists_}]}]} {
			dde servername -handler [list [self object] Argv_Handler] EzditService
			return
		}
		if {[info exists ::argv] && $::argv != ""} {
			dde execute TclEval EzditService {*}$::argv
			exit
		}
	}

	method Templ_Init {} {
		set appPath $::dApp::Env(appPath)

		set templdir [file join $appPath templates]

		source [file join $templdir templ.tcl]

		foreach type [list file project] {
			set dlist [glob -nocomplain -directory [file join $templdir ${type}s] -types {d} -- *]
			set cut 0

			foreach {d} $dlist {
				set init [file join $d init.tcl]
				if {![file isfile $init]} {continue}
				source -encoding utf-8 $init
			}
		}

	}

	method Ui_Init {} {

		set ibox $::dApp::Obj(ibox)
		set appPath $::dApp::Env(appPath)

		wm iconphoto . [$ibox get logo]
		wm title . "$::dApp::Env(title) v$::dApp::Env(version)"

		source [file join $appPath mbar.tcl]
		source [file join $appPath layout.tcl]

		source [file join $appPath about.tcl]
		source [file join $appPath run.tcl]
		source [file join $appPath wfind.tcl]

		source [file join $appPath tbar.tcl]
		source [file join $appPath sbar.tcl]
		#-------------------------------init left frame-----------------------------
		source [file join $appPath pmgr.tcl]
		source [file join $appPath cbs.tcl]
		#-------------------------------init center frame-----------------------------
		source [file join $appPath nbe.tcl]
		#-------------------------------init bottom frame-----------------------------
		source [file join $appPath nbo.tcl]

		wm protocol . WM_DELETE_WINDOW [list [self object] quit]

		::wnote::binding_setup
		$::dApp::Obj(mbar) binding_setup
		$::dApp::Obj(tbar) binding_setup
		$::dApp::Obj(sbar) binding_setup
		$::dApp::Obj(nbe) binding_setup
		$::dApp::Obj(cbs) binding_setup

		#setup  tkdnd : linux & windows
		if {![catch {package require tkdnd 1.0}]} {
			package require uri::urn
			dnd bindtarget [$::dApp::Obj(pmgr) cget -wtree] "text/uri-list" <Drop> {
				set items [list]
				set args %D
				foreach item $args {
					 set item [uri::urn::unquote $item]
					 if {$::dApp::Env(os) == "linux"} {
						 set item [encoding convertfrom [encoding system] $item]
					}
					 lappend items $item
				}
				$::dApp::Obj(ezdit) Argv_Handler {*}$items
			}
			dnd bindtarget [$::dApp::Obj(nbe) cget -body] "text/uri-list" <Drop> {
				set items [list]
				set args %D
				foreach item $args {
					lappend items [uri::urn::unquote $item]
				}
				$::dApp::Obj(ezdit) Argv_Handler {*}$items
			}

		}


	}

	method Test {} {
		foreach item [list File Edit View Tools Options Window Help] {
			oo::objdefine [::dApp::mbar::${item}Menu new] method create {m} {
				$m add command \
				-label "Client Menu Item" \
				-compound left \
				-image [$::dApp::Obj(ibox) get client]
			}
		}
		foreach item [list Tree Item] {
			oo::objdefine [::dApp::pmgr::${item}Menu new] method create {m} {
				$m add command \
				-label "Client Menu Item" \
				-compound left \
				-image [$::dApp::Obj(ibox) get client]
			}
		}
	}

	oo::define ::dApp::main export Argv_Handler
}


::dApp::main new
