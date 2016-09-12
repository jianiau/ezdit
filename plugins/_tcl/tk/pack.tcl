set syndb(pack,pack,type) "TKCMD"
set syndb(pack,pack,hint) "pack (option | slave) arg ?arg ...?"
set syndb(pack,pack,arglist) [list -after -anchor -before -expand -fill -in -ipadx -ipady -padx -pady -side configure forget info propagate slaves]
set syndb(pack,-after,type) "TKOPT"
set syndb(pack,-after,hint)  ""
set syndb(pack,-after,arglist)  [list ]
set syndb(pack,-anchor,type) "TKOPT"
set syndb(pack,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(pack,-anchor,hint)  ""
set syndb(pack,-before,type) "TKOPT"
set syndb(pack,-before,hint)  ""
set syndb(pack,-before,arglist)  [list ]
set syndb(pack,-expand,type) "TKOPT"
set syndb(pack,-expand,hint)  ""
set syndb(pack,-expand,arglist)  [list 0 1]
set syndb(pack,-fill,type) "TKOPT"
set syndb(pack,-fill,hint)  ""
set syndb(pack,-fill,arglist)  [list none both x y]
set syndb(pack,-in,type) "TKOPT"
set syndb(pack,-in,hint)  ""
set syndb(pack,-in,arglist)  [list ]
set syndb(pack,-ipadx,type) "TKOPT"
set syndb(pack,-ipadx,hint)  ""
set syndb(pack,-ipadx,arglist)  [list ]
set syndb(pack,-ipady,type) "TKOPT"
set syndb(pack,-ipady,hint)  ""
set syndb(pack,-ipady,arglist)  [list ]
set syndb(pack,-padx,type) "TKOPT"
set syndb(pack,-padx,hint)  ""
set syndb(pack,-padx,arglist)  [list ]
set syndb(pack,-pady,type) "TKOPT"
set syndb(pack,-pady,hint)  ""
set syndb(pack,-pady,arglist)  [list ]
set syndb(pack,-side,type) "TKOPT"
set syndb(pack,-side,hint)  ""
set syndb(pack,-side,arglist)  [list bottom left right top]
set syndb(pack,configure,type) "TKARG"
set syndb(pack,configure,hint)  "pack configure slave ?slave ...? ?options?"
set syndb(pack,configure,arglist)  [list -after -anchor -before -expand -fill -in -ipadx -ipady -padx -pady -side]
set syndb(pack,forget,type) "TKARG"
set syndb(pack,forget,hint)  "pack forget slave ?slave ...?"
set syndb(pack,forget,arglist)  [list ]
set syndb(pack,info,type) "TKARG"
set syndb(pack,info,hint)  "pack info slave"
set syndb(pack,info,arglist)  [list ]
set syndb(pack,propagate,type) "TKARG"
set syndb(pack,propagate,hint)  "pack propagate master ?boolean?"
set syndb(pack,propagate,arglist)  [list ]
set syndb(pack,slave,type) "TKARG"
set syndb(pack,slave,hint)  ""
set syndb(pack,slave,arglist)  [list ]
set syndb(pack,slaves,type) "TKARG"
set syndb(pack,slaves,hint)  "pack slaves master"
set syndb(pack,slaves,arglist)  [list ]
