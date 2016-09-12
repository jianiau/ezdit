set syndb(after,after,type) "TCLCMD"
set syndb(after,after,hint) "after option ?arg arg ...?"
set syndb(after,after,arglist) [list cancel idle info ms]
set syndb(after,cancel,type) "TCLARG"
set syndb(after,cancel,hint)  "after cancel id | after cancel script script script ..."
set syndb(after,cancel,arglist)  [list] 
set syndb(after,idle,type) "TCLARG"
set syndb(after,idle,hint)  "after idle ?script script script ...?"
set syndb(after,idle,arglist)  [list] 
set syndb(after,info,type) "TCLARG"
set syndb(after,info,hint)  "after info ?id?"
set syndb(after,info,arglist)  [list] 
set syndb(after,ms,type) "TCLARG"
set syndb(after,ms,hint)  "after ms ?script script script ...?"
set syndb(after,ms,arglist)  [list] 
