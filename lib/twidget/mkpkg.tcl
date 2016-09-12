
set cmd [list pkg_mkIndex ./]
foreach f [lsort [glob *.tcl]] {
	if {$f == "mkpkg.tcl"} {continue}
	lappend cmd $f
}
eval $cmd
button .btn -text "bye" -command {exit}
pack .btn -expand 1 -fill both
