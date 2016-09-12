set syndb(return,return,type) "TCLCMD"
set syndb(return,return,hint) "return ?-code code? ?result?"
set syndb(return,return,arglist) [list -code -errorcode -errorinfo]
set syndb(return,-code,type) "TCLARG"
set syndb(return,-code,hint)  ""
set syndb(return,-code,arglist)  [list] 
set syndb(return,-errorcode,type) "TCLARG"
set syndb(return,-errorcode,hint)  ""
set syndb(return,-errorcode,arglist)  [list] 
set syndb(return,-errorinfo,type) "TCLARG"
set syndb(return,-errorinfo,hint)  ""
set syndb(return,-errorinfo,arglist)  [list] 
