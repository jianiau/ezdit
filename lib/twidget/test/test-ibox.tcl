#!/bin/sh
#\
exec tclsh "$0" ${1+"$@"}

lappend ::auto_path ../

package require twidget::ibox
package require img::png
set ibox [::twidget::ibox new]
$ibox add "folder.png"
button .btn -image [$ibox get folder]
pack .btn
#$ibox set folder  "file.png"
#$ibox replace folder [image create photo -file file.png]
puts [$ibox dump]
# The .btn should show a file icon.
