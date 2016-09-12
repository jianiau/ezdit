set syndb(ttk::style,style,type) "TKCMD"
set syndb(ttk::style,style,hint) "ttk::style option ?args?"
set syndb(ttk::style,style,arglist) [list configure element layout lookup map theme]
set syndb(ttk::style,style,colorlist) [list create names settings use -parent -settings -option]
set syndb(ttk::style,style,colortype) "TKOPT"
set syndb(ttk::style,configure,type) "TKARG"
set syndb(ttk::style,configure,hint)  "ttk::style configure style ?-option ?value option value...? ?"
set syndb(ttk::style,configure,arglist)  [list ]
set syndb(ttk::style,element,type) "TKARG"
set syndb(ttk::style,element,hint)  "ttk::style element (create elementName type ?args...?| names | options element)"
set syndb(ttk::style,element,arglist)  [list ]
set syndb(ttk::style,layout,type) "TKARG"
set syndb(ttk::style,layout,hint)  "ttk::style layout style ?layoutSpec?"
set syndb(ttk::style,layout,arglist)  [list ]
set syndb(ttk::style,lookup,type) "TKARG"
set syndb(ttk::style,lookup,hint)  "ttk::style lookup style -option ?state ?default??"
set syndb(ttk::style,lookup,arglist)  [list ]
set syndb(ttk::style,map,type) "TKARG"
set syndb(ttk::style,map,hint)  "ttk::style map style ?-option { statespec value... }?"
set syndb(ttk::style,map,arglist)  [list ]
set syndb(ttk::style,theme,type) "TKARG"
set syndb(ttk::style,theme,hint)  "ttk::style theme (create themeName ?-parent basedon? ?-settings script... ? | settings themeName script | names | use ?themeName?)"
set syndb(ttk::style,theme,arglist)  [list create names settings use -parent -settings]
