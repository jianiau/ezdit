set syndb(clock,clock,type) "TCLCMD"
set syndb(clock,clock,hint) "clock option ?arg arg ...?"
set syndb(clock,clock,arglist) [list add clicks format microseconds milliseconds scan seconds]
set syndb(clock,add,type) "TCLARG"
set syndb(clock,add,hint)  "clock add timeVal ?count unit...? ?-option value?"
set syndb(clock,add,arglist)  [list -base -format -gmt -locale -timezone]  
set syndb(clock,clicks,type) "TCLARG"
set syndb(clock,clicks,hint)  "clock clicks ?-option?"
set syndb(clock,clicks,arglist)  [list] 
set syndb(clock,format,type) "TCLARG"
set syndb(clock,format,hint)  "clock format timeVal ?-option value...?"
set syndb(clock,format,arglist)  [list -base -format -gmt -locale -timezone] 
set syndb(clock,microseconds,type) "TCLARG"
set syndb(clock,microseconds,hint)  "clock microseconds"
set syndb(clock,microseconds,arglist)  [list] 
set syndb(clock,milliseconds,type) "TCLARG"
set syndb(clock,milliseconds,hint)  "clock milliseconds"
set syndb(clock,milliseconds,arglist)  [list] 
set syndb(clock,scan,type) "TCLARG"
set syndb(clock,scan,hint)  "clock scan inputString ?-option value...?"
set syndb(clock,scan,arglist)  [list -base -format -gmt -locale -timezone]
set syndb(clock,seconds,type) "TCLARG"
set syndb(clock,seconds,hint)  "clock seconds"
set syndb(clock,seconds,arglist)  [list] 
