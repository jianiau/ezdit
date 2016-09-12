set syndb(fcopy,fcopy,type) "TCLCMD"
set syndb(fcopy,fcopy,hint) "fcopy inchan outchan ?-size size? ?-command callback?"
set syndb(fcopy,fcopy,arglist) [list -command -size]
set syndb(fcopy,-command,type) "TCLARG"
set syndb(fcopy,-command,hint)  ""
set syndb(fcopy,-command,arglist)  [list] 
set syndb(fcopy,-size,type) "TCLARG"
set syndb(fcopy,-size,hint)  ""
set syndb(fcopy,-size,arglist)  [list] 
