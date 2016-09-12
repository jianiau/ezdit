set syndb(namespace,namespace,type) "TCLCMD"
set syndb(namespace,namespace,hint) "namespace ?subcommand? ?arg ...?"
set syndb(namespace,namespace,arglist) [list children code current delete eval exists export forget import inscope origin parent qualifiers tail which]
set syndb(namespace,children,type) "TCLARG"
set syndb(namespace,children,hint)  "namespace children ?namespace? ?pattern?"
set syndb(namespace,children,arglist)  [list] 
set syndb(namespace,code,type) "TCLARG"
set syndb(namespace,code,hint)  "namespace code script"
set syndb(namespace,code,arglist)  [list] 
set syndb(namespace,current,type) "TCLARG"
set syndb(namespace,current,hint)  "namespace current"
set syndb(namespace,current,arglist)  [list] 
set syndb(namespace,delete,type) "TCLARG"
set syndb(namespace,delete,hint)  "namespace delete ?namespace namespace ...?"
set syndb(namespace,delete,arglist)  [list] 
set syndb(namespace,eval,type) "TCLARG"
set syndb(namespace,eval,hint)  "namespace eval namespace arg ?arg ...?"
set syndb(namespace,eval,arglist)  [list] 
set syndb(namespace,exists,type) "TCLARG"
set syndb(namespace,exists,hint)  "namespace exists namespace"
set syndb(namespace,exists,arglist)  [list] 
set syndb(namespace,export,type) "TCLARG"
set syndb(namespace,export,hint)  "namespace export ?-clear? ?pattern pattern ...?"
set syndb(namespace,export,arglist)  [list] 
set syndb(namespace,forget,type) "TCLARG"
set syndb(namespace,forget,hint)  "namespace forget ?pattern pattern ...?"
set syndb(namespace,forget,arglist)  [list] 
set syndb(namespace,import,type) "TCLARG"
set syndb(namespace,import,hint)  "namespace import ?-force? ?pattern pattern ...?"
set syndb(namespace,import,arglist)  [list] 
set syndb(namespace,inscope,type) "TCLARG"
set syndb(namespace,inscope,hint)  "namespace inscope namespace script ?arg ...?"
set syndb(namespace,inscope,arglist)  [list] 
set syndb(namespace,origin,type) "TCLARG"
set syndb(namespace,origin,hint)  "namespace origin command"
set syndb(namespace,origin,arglist)  [list] 
set syndb(namespace,parent,type) "TCLARG"
set syndb(namespace,parent,hint)  "namespace parent ?namespace?"
set syndb(namespace,parent,arglist)  [list] 
set syndb(namespace,qualifiers,type) "TCLARG"
set syndb(namespace,qualifiers,hint)  "namespace qualifiers string"
set syndb(namespace,qualifiers,arglist)  [list] 
set syndb(namespace,tail,type) "TCLARG"
set syndb(namespace,tail,hint)  "namespace tail string"
set syndb(namespace,tail,arglist)  [list] 
set syndb(namespace,which,type) "TCLARG"
set syndb(namespace,which,hint)  "namespace which ?-command? ?-variable? name"
set syndb(namespace,which,arglist)  [list] 
