set syndb(interp,interp,type) "TCLCMD"
set syndb(interp,interp,hint) "interp subcommand ?arg arg ...?"
set syndb(interp,interp,arglist) [list alias create delete eval exists expose hidden hide invokehidden issafe marktrusted recursionlimit share slaves target transfer]
set syndb(interp,alias,type) "TCLARG"
set syndb(interp,alias,hint)  "interp alias srcPath srcCmd targetPath targetCmd ?arg arg ...?"
set syndb(interp,alias,arglist)  [list] 
set syndb(interp,create,type) "TCLARG"
set syndb(interp,create,hint)  "interp create ?-safe? ?--? ?path?"
set syndb(interp,create,arglist)  [list] 
set syndb(interp,delete,type) "TCLARG"
set syndb(interp,delete,hint)  "interp delete ?path ...?"
set syndb(interp,delete,arglist)  [list] 
set syndb(interp,eval,type) "TCLARG"
set syndb(interp,eval,hint)  "interp eval path arg ?arg ...?"
set syndb(interp,eval,arglist)  [list] 
set syndb(interp,exists,type) "TCLARG"
set syndb(interp,exists,hint)  "interp exists path"
set syndb(interp,exists,arglist)  [list] 
set syndb(interp,expose,type) "TCLARG"
set syndb(interp,expose,hint)  "interp expose path hiddenName ?exposedCmdName?"
set syndb(interp,expose,arglist)  [list] 
set syndb(interp,hidden,type) "TCLARG"
set syndb(interp,hidden,hint)  "interp hidden path"
set syndb(interp,hidden,arglist)  [list] 
set syndb(interp,hide,type) "TCLARG"
set syndb(interp,hide,hint)  "interp hide path exposedCmdName ?hiddenCmdName?"
set syndb(interp,hide,arglist)  [list] 
set syndb(interp,invokehidden,type) "TCLARG"
set syndb(interp,invokehidden,hint)  "interp invokehidden path ?-option ...? hiddenCmdName ?arg ...?"
set syndb(interp,invokehidden,arglist)  [list] 
set syndb(interp,issafe,type) "TCLARG"
set syndb(interp,issafe,hint)  "interp issafe ?path?"
set syndb(interp,issafe,arglist)  [list] 
set syndb(interp,marktrusted,type) "TCLARG"
set syndb(interp,marktrusted,hint)  "interp marktrusted path"
set syndb(interp,marktrusted,arglist)  [list] 
set syndb(interp,recursionlimit,type) "TCLARG"
set syndb(interp,recursionlimit,hint)  "interp recursionlimit path ?newlimit?"
set syndb(interp,recursionlimit,arglist)  [list] 
set syndb(interp,share,type) "TCLARG"
set syndb(interp,share,hint)  "interp share srcPath channelId destPath"
set syndb(interp,share,arglist)  [list] 
set syndb(interp,slaves,type) "TCLARG"
set syndb(interp,slaves,hint)  "interp slaves ?path?"
set syndb(interp,slaves,arglist)  [list] 
set syndb(interp,target,type) "TCLARG"
set syndb(interp,target,hint)  "interp target path alias"
set syndb(interp,target,arglist)  [list] 
set syndb(interp,transfer,type) "TCLARG"
set syndb(interp,transfer,hint)  "interp transfer srcPath channelId destPath"
set syndb(interp,transfer,arglist)  [list] 
