set syndb(array,array,type) "TCLCMD"
set syndb(array,array,hint) "array option arrayName ?arg arg ...?"
set syndb(array,array,arglist) [list anymore donesearch exists get names nextelement set size startsearch statistics unset]
set syndb(array,anymore,type) "TCLARG"
set syndb(array,anymore,hint)  "array anymore arrayName searchId"
set syndb(array,anymore,arglist)  [list] 
set syndb(array,donesearch,type) "TCLARG"
set syndb(array,donesearch,hint)  "array donesearch arrayName searchId"
set syndb(array,donesearch,arglist)  [list] 
set syndb(array,exists,type) "TCLARG"
set syndb(array,exists,hint)  "array exists arrayName"
set syndb(array,exists,arglist)  [list] 
set syndb(array,get,type) "TCLARG"
set syndb(array,get,hint)  "array get arrayName ?pattern?"
set syndb(array,get,arglist)  [list] 
set syndb(array,names,type) "TCLARG"
set syndb(array,names,hint)  "array names arrayName ?mode? ?pattern?"
set syndb(array,names,arglist)  [list] 
set syndb(array,nextelement,type) "TCLARG"
set syndb(array,nextelement,hint)  "array nextelement arrayName searchId"
set syndb(array,nextelement,arglist)  [list] 
set syndb(array,set,type) "TCLARG"
set syndb(array,set,hint)  "array set arrayName list"
set syndb(array,set,arglist)  [list] 
set syndb(array,size,type) "TCLARG"
set syndb(array,size,hint)  "array size arrayName"
set syndb(array,size,arglist)  [list] 
set syndb(array,startsearch,type) "TCLARG"
set syndb(array,startsearch,hint)  "array startsearch arrayName"
set syndb(array,startsearch,arglist)  [list] 
set syndb(array,statistics,type) "TCLARG"
set syndb(array,statistics,hint)  "array statistics arrayName"
set syndb(array,statistics,arglist)  [list] 
set syndb(array,unset,type) "TCLARG"
set syndb(array,unset,hint)  "array unset arrayName ?pattern? "
set syndb(array,unset,arglist)  [list] 
