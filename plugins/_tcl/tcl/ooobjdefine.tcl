set syndb(oo::objdefine,objdefine,type) "TCLCMD"
set syndb(oo::objdefine,objdefine,hint) "oo::define (class defScript | class subcommand arg ?arg ...?)"
set syndb(oo::objdefine,objdefine,arglist) [list class deletemethod export filter forward method mixin renamemethod unexport variable]
set syndb(oo::objdefine,class,type) "TCLARG"
set syndb(oo::objdefine,class,hint)  "class className"
set syndb(oo::objdefine,class,arglist)  [list] 
set syndb(oo::objdefine,deletemethod,type) "TCLARG"
set syndb(oo::objdefine,deletemethod,hint)  "deletemethod name ?name ..."
set syndb(oo::objdefine,deletemethod,arglist)  [list] 
set syndb(oo::objdefine,export,type) "TCLARG"
set syndb(oo::objdefine,export,hint)  "export name ?name ...?"
set syndb(oo::objdefine,export,arglist)  [list] 
set syndb(oo::objdefine,filter,type) "TCLARG"
set syndb(oo::objdefine,filter,hint)  "filter ?methodName ...?"
set syndb(oo::objdefine,filter,arglist)  [list] 
set syndb(oo::objdefine,forward,type) "TCLARG"
set syndb(oo::objdefine,forward,hint)  "forward name cmdName ?arg ...?"
set syndb(oo::objdefine,forward,arglist)  [list] 
set syndb(oo::objdefine,method,type) "TCLARG"
set syndb(oo::objdefine,method,hint)  "method name argList bodyScript"
set syndb(oo::objdefine,method,arglist)  [list] 
set syndb(oo::objdefine,mixin,type) "TCLARG"
set syndb(oo::objdefine,mixin,hint)  "mixin ?className ...?"
set syndb(oo::objdefine,mixin,arglist)  [list] 
set syndb(oo::objdefine,renamemethod,type) "TCLARG"
set syndb(oo::objdefine,renamemethod,hint)  "renamemethod fromName toName"
set syndb(oo::objdefine,renamemethod,arglist)  [list] 
set syndb(oo::objdefine,unexport,type) "TCLARG"
set syndb(oo::objdefine,unexport,hint)  "unexport name ?name ...?"
set syndb(oo::objdefine,unexport,arglist)  [list] 
set syndb(oo::objdefine,variable,type) "TCLARG"
set syndb(oo::objdefine,variable,hint)  "variable ?name ...?"
set syndb(oo::objdefine,variable,arglist)  [list] 
