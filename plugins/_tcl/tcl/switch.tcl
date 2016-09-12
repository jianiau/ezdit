set syndb(switch,switch,type) "TCLCMD"
set syndb(switch,switch,hint) "switch ?options? string {pattern body ?pattern body ...?}"
set syndb(switch,switch,arglist) [list -exact -glob -regexp]
set syndb(switch,-exact,type) "TCLARG"
set syndb(switch,-exact,hint)  ""
set syndb(switch,-exact,arglist)  [list] 
set syndb(switch,-glob,type) "TCLARG"
set syndb(switch,-glob,hint)  ""
set syndb(switch,-glob,arglist)  [list] 
set syndb(switch,-regexp,type) "TCLARG"
set syndb(switch,-regexp,hint)  ""
set syndb(switch,-regexp,arglist)  [list] 
