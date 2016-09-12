set syndb(history,history,type) "TCLCMD"
set syndb(history,history,hint) "history ?option? ?arg arg ...?"
set syndb(history,history,arglist) [list add change clear event info keep nextid redo]
set syndb(history,add,type) "TCLARG"
set syndb(history,add,hint)  "history add command ?exec?"
set syndb(history,add,arglist)  [list] 
set syndb(history,change,type) "TCLARG"
set syndb(history,change,hint)  "history change newValue ?event?"
set syndb(history,change,arglist)  [list] 
set syndb(history,clear,type) "TCLARG"
set syndb(history,clear,hint)  "history clear"
set syndb(history,clear,arglist)  [list] 
set syndb(history,event,type) "TCLARG"
set syndb(history,event,hint)  "history event ?event?"
set syndb(history,event,arglist)  [list] 
set syndb(history,info,type) "TCLARG"
set syndb(history,info,hint)  "history info ?count?"
set syndb(history,info,arglist)  [list] 
set syndb(history,keep,type) "TCLARG"
set syndb(history,keep,hint)  "history keep ?count?"
set syndb(history,keep,arglist)  [list] 
set syndb(history,nextid,type) "TCLARG"
set syndb(history,nextid,hint)  "history nextid"
set syndb(history,nextid,arglist)  [list] 
set syndb(history,redo,type) "TCLARG"
set syndb(history,redo,hint)  "history redo ?event?"
set syndb(history,redo,arglist)  [list] 
