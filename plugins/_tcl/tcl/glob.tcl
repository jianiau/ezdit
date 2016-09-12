set syndb(glob,glob,type) "TCLCMD"
set syndb(glob,glob,hint) "glob ?switches? pattern ?pattern ...?"
set syndb(glob,glob,arglist) [list -directory -join -nocomplain -path -tails -types]
set syndb(glob,-directory,type) "TCLOPT"
set syndb(glob,-directory,hint)  ""
set syndb(glob,-directory,arglist)  [list] 
set syndb(glob,-join,type) "TCLOPT"
set syndb(glob,-join,hint)  ""
set syndb(glob,-join,arglist)  [list] 
set syndb(glob,-nocomplain,type) "TCLOPT"
set syndb(glob,-nocomplain,hint)  ""
set syndb(glob,-nocomplain,arglist)  [list] 
set syndb(glob,-path,type) "TCLOPT"
set syndb(glob,-path,hint)  ""
set syndb(glob,-path,arglist)  [list] 
set syndb(glob,-tails,type) "TCLOPT"
set syndb(glob,-tails,hint)  ""
set syndb(glob,-tails,arglist)  [list] 
set syndb(glob,-types,type) "TCLOPT"
set syndb(glob,-types,hint)  ""
set syndb(glob,-types,arglist)  [list] 
