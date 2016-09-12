set syndb(selection,selection,type) "TKCMD"
set syndb(selection,selection,hint) "selection option ?arg arg ...?"
set syndb(selection,selection,arglist) [list -command -displayof -format -selection -type clear get handle own]
set syndb(selection,-command,type) "TKOPT"
set syndb(selection,-command,hint)  ""
set syndb(selection,-command,arglist)  [list ]
set syndb(selection,-displayof,type) "TKOPT"
set syndb(selection,-displayof,hint)  ""
set syndb(selection,-displayof,arglist)  [list ]
set syndb(selection,-format,type) "TKOPT"
set syndb(selection,-format,hint)  ""
set syndb(selection,-format,arglist)  [list ]
set syndb(selection,-selection,type) "TKOPT"
set syndb(selection,-selection,hint)  ""
set syndb(selection,-selection,arglist)  [list ]
set syndb(selection,-type,type) "TKOPT"
set syndb(selection,-type,hint)  ""
set syndb(selection,-type,arglist)  [list ]
set syndb(selection,clear,type) "TKARG"
set syndb(selection,clear,hint)  "selection clear ?-displayof window? ?-selection selection?"
set syndb(selection,clear,arglist)  [list ]
set syndb(selection,get,type) "TKARG"
set syndb(selection,get,hint)  "selection get ?-displayof window? ?-selection selection? ?-type type?"
set syndb(selection,get,arglist)  [list ]
set syndb(selection,handle,type) "TKARG"
set syndb(selection,handle,hint)  "selection handle ?-selection s? ?-type t? ?-format f? window command "
set syndb(selection,handle,arglist)  [list ]
set syndb(selection,own,type) "TKARG"
set syndb(selection,own,hint)  ""
set syndb(selection,own,arglist)  [list ]
