set syndb(clipboard,clipboard,type) "TKCMD"
set syndb(clipboard,clipboard,hint) "clipboard option ?arg arg ...?"
set syndb(clipboard,clipboard,arglist) [list append clear get]
set syndb(clipboard,append,type) "TKARG"
set syndb(clipboard,append,hint)  "clipboard append ?-displayof window? ?-format format? ?-type type? ?--? data"
set syndb(clipboard,append,arglist)  [list ]
set syndb(clipboard,clear,type) "TKARG"
set syndb(clipboard,clear,hint)  "clipboard clear ?-displayof window?"
set syndb(clipboard,clear,arglist)  [list ]
set syndb(clipboard,get,type) "TKARG"
set syndb(clipboard,get,hint)  "clipboard get ?-displayof window? ?-type type?"
set syndb(clipboard,get,arglist)  [list ]
