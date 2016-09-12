set syndb(oo::define,define,type) "TCLCMD"
set syndb(oo::define,define,hint) "oo::define (class defScript | class subcommand arg ?arg ...?)"
set syndb(oo::define,define,arglist) [list constructor deletemethod destructor export filter forward method mixin renamemethod self superclass unexport variable]
set syndb(oo::define,constructor,type) "TCLARG"
set syndb(oo::define,constructor,hint)  "constructor argList bodyScript"
set syndb(oo::define,constructor,arglist)  [list] 
set syndb(oo::define,deletemethod,type) "TCLARG"
set syndb(oo::define,deletemethod,hint)  "deletemethod name ?name ..."
set syndb(oo::define,deletemethod,arglist)  [list] 
set syndb(oo::define,destructor,type) "TCLARG"
set syndb(oo::define,destructor,hint)  "destructor bodyScript"
set syndb(oo::define,destructor,arglist)  [list] 
set syndb(oo::define,export,type) "TCLARG"
set syndb(oo::define,export,hint)  "export name ?name ...?"
set syndb(oo::define,export,arglist)  [list] 
set syndb(oo::define,filter,type) "TCLARG"
set syndb(oo::define,filter,hint)  "filter ?methodName ...?"
set syndb(oo::define,filter,arglist)  [list] 
set syndb(oo::define,forward,type) "TCLARG"
set syndb(oo::define,forward,hint)  "forward name cmdName ?arg ...?"
set syndb(oo::define,forward,arglist)  [list] 
set syndb(oo::define,method,type) "TCLARG"
set syndb(oo::define,method,hint)  "method name argList bodyScript"
set syndb(oo::define,method,arglist)  [list] 
set syndb(oo::define,mixin,type) "TCLARG"
set syndb(oo::define,mixin,hint)  "mixin ?className ...?"
set syndb(oo::define,mixin,arglist)  [list] 
set syndb(oo::define,renamemethod,type) "TCLARG"
set syndb(oo::define,renamemethod,hint)  "renamemethod fromName toName"
set syndb(oo::define,renamemethod,arglist)  [list] 
set syndb(oo::define,self,type) "TCLARG"
set syndb(oo::define,self,hint)  "self (subcommand arg ... | script)"
set syndb(oo::define,self,arglist)  [list] 
set syndb(oo::define,superclass,type) "TCLARG"
set syndb(oo::define,superclass,hint)  "superclass className ?className ...?"
set syndb(oo::define,superclass,arglist)  [list] 
set syndb(oo::define,unexport,type) "TCLARG"
set syndb(oo::define,unexport,hint)  "unexport name ?name ...?"
set syndb(oo::define,unexport,arglist)  [list] 
set syndb(oo::define,variable,type) "TCLARG"
set syndb(oo::define,variable,hint)  "variable ?name ...?"
set syndb(oo::define,variable,arglist)  [list] 
