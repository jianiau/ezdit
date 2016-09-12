set syndb(send,send,type) "TKCMD"
set syndb(send,send,hint) "send ?options? app cmd ?arg arg ...?"
set syndb(send,send,arglist) [list -async -displayof]
set syndb(send,-async,type) "TKOPT"
set syndb(send,-async,hint)  ""
set syndb(send,-async,arglist)  [list ]
set syndb(send,-displayof,type) "TKOPT"
set syndb(send,-displayof,hint)  ""
set syndb(send,-displayof,arglist)  [list ]
