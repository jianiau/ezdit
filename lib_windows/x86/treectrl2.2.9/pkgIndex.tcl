if {[catch {package require Tcl 8.4}]} return
set script ""
if {![info exists ::env(TREECTRL_LIBRARY)]
    && [file exists [file join $dir treectrl.tcl]]} {
    append script "[list set ::treectrl_library $dir]\n"
}
append script [list load [file join $dir treectrl22.dll] treectrl]
package ifneeded treectrl 2.2.9 $script
