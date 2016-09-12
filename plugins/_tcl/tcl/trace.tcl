set syndb(trace,trace,type) "TCLCMD"
set syndb(trace,trace,hint) "trace option ?arg arg ...?"
set syndb(trace,trace,arglist) [list add info remove variable vdelete vinfo]
set syndb(trace,add,type) "TCLARG"
set syndb(trace,add,hint)  "trace add type name ops ?args?"
set syndb(trace,add,arglist)  [list] 
set syndb(trace,info,type) "TCLARG"
set syndb(trace,info,hint)  "trace info type name"
set syndb(trace,info,arglist)  [list] 
set syndb(trace,remove,type) "TCLARG"
set syndb(trace,remove,hint)  "trace remove type name opList commandPrefix"
set syndb(trace,remove,arglist)  [list] 
set syndb(trace,variable,type) "TCLARG"
set syndb(trace,variable,hint)  "trace variable name ops command"
set syndb(trace,variable,arglist)  [list] 
set syndb(trace,vdelete,type) "TCLARG"
set syndb(trace,vdelete,hint)  "trace vdelete name ops command"
set syndb(trace,vdelete,arglist)  [list] 
set syndb(trace,vinfo,type) "TCLARG"
set syndb(trace,vinfo,hint)  "trace vinfo name"
set syndb(trace,vinfo,arglist)  [list] 
