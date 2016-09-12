set syndb(socket,socket,type) "TCLCMD"
set syndb(socket,socket,hint) "socket ?options? host port | socket -server command ?options? port"
set syndb(socket,socket,arglist) [list -async -myaddr -myport -server ]
set syndb(socket,-async,type) "TCLOPT"
set syndb(socket,-async,hint)  ""
set syndb(socket,-async,arglist)  [list] 
set syndb(socket,-myaddr,type) "TCLOPT"
set syndb(socket,-myaddr,hint)  ""
set syndb(socket,-myaddr,arglist)  [list] 
set syndb(socket,-myport,type) "TCLOPT"
set syndb(socket,-myport,hint)  ""
set syndb(socket,-myport,arglist)  [list] 
set syndb(socket,-server,type) "TCLOPT"
set syndb(socket,-server,hint)  ""
set syndb(socket,-server,arglist)  [list] 

