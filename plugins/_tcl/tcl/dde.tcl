set syndb(dde,dde,type) "TCLCMD"
set syndb(dde,dde,hint) ""
set syndb(dde,dde,arglist) [list eval execute poke request servername services]
set syndb(dde,eval,type) "TCLARG"
set syndb(dde,eval,hint)  "dde eval ?-async? topic cmd ?arg arg ...?"
set syndb(dde,eval,arglist)  [list] 
set syndb(dde,execute,type) "TCLARG"
set syndb(dde,execute,hint)  "dde execute ?-async? service topic data"
set syndb(dde,execute,arglist)  [list] 
set syndb(dde,poke,type) "TCLARG"
set syndb(dde,poke,hint)  "dde poke service topic item data"
set syndb(dde,poke,arglist)  [list] 
set syndb(dde,request,type) "TCLARG"
set syndb(dde,request,hint)  "dde request ?-binary? service topic item"
set syndb(dde,request,arglist)  [list] 
set syndb(dde,servername,type) "TCLARG"
set syndb(dde,servername,hint)  "dde servername ?-force? ?-handler proc? ?--? ?topic?"
set syndb(dde,servername,arglist)  [list] 
set syndb(dde,services,type) "TCLARG"
set syndb(dde,services,hint)  "dde services service topic"
set syndb(dde,services,arglist)  [list] 
