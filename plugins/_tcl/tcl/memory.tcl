set syndb(memory,memory,type) "TCLCMD"
set syndb(memory,memory,hint) "memory option ?arg arg ...?"
set syndb(memory,memory,arglist) [list active break_on_malloc info init onexit tag trace trace_on_at_malloc validate]
set syndb(memory,active,type) "TCLARG"
set syndb(memory,active,hint)  "memory active file"
set syndb(memory,active,arglist)  [list] 
set syndb(memory,break_on_malloc,type) "TCLARG"
set syndb(memory,break_on_malloc,hint)  "memory break_on_malloc count"
set syndb(memory,break_on_malloc,arglist)  [list] 
set syndb(memory,info,type) "TCLARG"
set syndb(memory,info,hint)  "memory info"
set syndb(memory,info,arglist)  [list] 
set syndb(memory,init,type) "TCLARG"
set syndb(memory,init,hint)  "memory init (on|off)"
set syndb(memory,init,arglist)  [list] 
set syndb(memory,onexit,type) "TCLARG"
set syndb(memory,onexit,hint)  "memory onexit file"
set syndb(memory,onexit,arglist)  [list] 
set syndb(memory,tag,type) "TCLARG"
set syndb(memory,tag,hint)  "memory tag string"
set syndb(memory,tag,arglist)  [list] 
set syndb(memory,trace,type) "TCLARG"
set syndb(memory,trace,hint)  "memory trace (on|off)"
set syndb(memory,trace,arglist)  [list] 
set syndb(memory,trace_on_at_malloc,type) "TCLARG"
set syndb(memory,trace_on_at_malloc,hint)  "memory trace_on_at_malloc count"
set syndb(memory,trace_on_at_malloc,arglist)  [list] 
set syndb(memory,validate,type) "TCLARG"
set syndb(memory,validate,hint)  "memory validate (on|off)"
set syndb(memory,validate,arglist)  [list] 
