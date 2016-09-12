# WHen script is sourced, the variable $dir must contain the
# full path name of this file's directory.

if {$::tcl_platform(os) eq "Windows NT" &&
    $::tcl_platform(machine) eq "intel" &&
    [string index $::tcl_platform(osVersion) 0] >= 5} {
    source [file join $dir twapi_version.tcl]
    source [file join $dir twapi_buildinfo.tcl]
    package ifneeded $::twapi::dll_base_name $twapi::patchlevel [list source [file join $dir twapi.tcl]]
}
