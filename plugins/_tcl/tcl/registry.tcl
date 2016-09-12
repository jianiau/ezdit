set syndb(registry,registry,type) "TCLCMD"
set syndb(registry,registry,hint) "registry option keyName ?arg arg ...?"
set syndb(registry,registry,arglist) [list broadcase delete get keys set type values]
set syndb(registry,broadcase,type) "TCLARG"
set syndb(registry,broadcase,hint)  ""
set syndb(registry,broadcase,arglist)  [list] 
set syndb(registry,delete,type) "TCLARG"
set syndb(registry,delete,hint)  "registry delete keyName ?valueName?"
set syndb(registry,delete,arglist)  [list] 
set syndb(registry,get,type) "TCLARG"
set syndb(registry,get,hint)  "registry get keyName valueName"
set syndb(registry,get,arglist)  [list] 
set syndb(registry,keys,type) "TCLARG"
set syndb(registry,keys,hint)  "registry keys keyName ?pattern?"
set syndb(registry,keys,arglist)  [list] 
set syndb(registry,set,type) "TCLARG"
set syndb(registry,set,hint)  "registry set keyName ?valueName data ?type??"
set syndb(registry,set,arglist)  [list] 
set syndb(registry,type,type) "TCLARG"
set syndb(registry,type,hint)  "registry type keyName valueName"
set syndb(registry,type,arglist)  [list] 
set syndb(registry,values,type) "TCLARG"
set syndb(registry,values,hint)  "registry values keyName ?pattern?"
set syndb(registry,values,arglist)  [list] 
