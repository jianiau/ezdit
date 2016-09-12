set syndb(dict,dict,type) "TCLCMD"
set syndb(dict,dict,hint) "dict option arg ?arg ...?"
set syndb(dict,dict,arglist) [list append create exists filter for get incr info keys lappend merge remove replace set size unset update values with]
set syndb(dict,append,type) "TCLARG"
set syndb(dict,append,hint)  "dict append dictionaryVariable key ?string ...?"
set syndb(dict,append,arglist)  [list] 
set syndb(dict,create,type) "TCLARG"
set syndb(dict,create,hint)  "dict create ?key value ...?"
set syndb(dict,create,arglist)  [list] 
set syndb(dict,exists,type) "TCLARG"
set syndb(dict,exists,hint)  "dict exists dictionaryValue key ?key ...?"
set syndb(dict,exists,arglist)  [list] 
set syndb(dict,filter,type) "TCLARG"
set syndb(dict,filter,hint)  "dict filter dictionaryValue (filterType arg ?arg ...? | key globPattern | script {keyVar valueVar} script | value globPattern)"
set syndb(dict,filter,arglist)  [list] 
set syndb(dict,for,type) "TCLARG"
set syndb(dict,for,hint)  "dict for {keyVar valueVar} dictionaryValue body"
set syndb(dict,for,arglist)  [list] 
set syndb(dict,get,type) "TCLARG"
set syndb(dict,get,hint)  "dict get dictionaryValue ?key ...?"
set syndb(dict,get,arglist)  [list] 
set syndb(dict,incr,type) "TCLARG"
set syndb(dict,incr,hint)  "dict incr dictionaryVariable key ?increment?"
set syndb(dict,incr,arglist)  [list] 
set syndb(dict,info,type) "TCLARG"
set syndb(dict,info,hint)  "dict info dictionaryValue"
set syndb(dict,info,arglist)  [list] 
set syndb(dict,keys,type) "TCLARG"
set syndb(dict,keys,hint)  "dict keys dictionaryValue ?globPattern?"
set syndb(dict,keys,arglist)  [list] 
set syndb(dict,lappend,type) "TCLARG"
set syndb(dict,lappend,hint)  "dict lappend dictionaryVariable key ?value ...?"
set syndb(dict,lappend,arglist)  [list] 
set syndb(dict,merge,type) "TCLARG"
set syndb(dict,merge,hint)  "dict merge ?dictionaryValue ...?"
set syndb(dict,merge,arglist)  [list] 
set syndb(dict,remove,type) "TCLARG"
set syndb(dict,remove,hint)  "dict remove dictionaryValue ?key ...?"
set syndb(dict,remove,arglist)  [list] 
set syndb(dict,replace,type) "TCLARG"
set syndb(dict,replace,hint)  "dict replace dictionaryValue ?key value ...?"
set syndb(dict,replace,arglist)  [list] 
set syndb(dict,set,type) "TCLARG"
set syndb(dict,set,hint)  "dict set dictionaryVariable key ?key ...? value"
set syndb(dict,set,arglist)  [list] 
set syndb(dict,size,type) "TCLARG"
set syndb(dict,size,hint)  "dict size dictionaryValue"
set syndb(dict,size,arglist)  [list] 
set syndb(dict,unset,type) "TCLARG"
set syndb(dict,unset,hint)  "dict unset dictionaryVariable key ?key ...?"
set syndb(dict,unset,arglist)  [list] 
set syndb(dict,update,type) "TCLARG"
set syndb(dict,update,hint)  "dict update dictionaryVariable key varName ?key varName ...? body"
set syndb(dict,update,arglist)  [list] 
set syndb(dict,values,type) "TCLARG"
set syndb(dict,values,hint)  "dict values dictionaryValue ?globPattern?"
set syndb(dict,values,arglist)  [list] 
set syndb(dict,with,type) "TCLARG"
set syndb(dict,with,hint)  "dict with dictionaryVariable ?key ...? body"
set syndb(dict,with,arglist)  [list] 
