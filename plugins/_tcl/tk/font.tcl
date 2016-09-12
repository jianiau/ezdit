set syndb(font,font,type) "TKCMD"
set syndb(font,font,hint) "font option ?arg arg ...?"
set syndb(font,font,arglist) [list actual configure create delete families measure metrics names]
set syndb(font,font,colorlist) [list -displayof -ascent -descent -fixed -linespace -family -overstrike -size -slant -underline -weight]
set syndb(font,font,colortype) "TKOPT"
set syndb(font,-weight,type) "TKOPT"
set syndb(font,-weight,arglist)  [list bold normal]
set syndb(font,-weight,hint)  ""
set syndb(font,actual,type) "TKARG"
set syndb(font,actual,hint)  "font actual font ?-displayof window? ?option? ?--? ?char?"
set syndb(font,actual,arglist)  [list -displayof -family -overstrike -size -slant -underline -weight]
set syndb(font,configure,type) "TKARG"
set syndb(font,configure,hint)  "font configure fontname ?option? ?value option value ...?"
set syndb(font,configure,arglist)  [list -family -overstrike -size -slant -underline -weight]
set syndb(font,create,type) "TKARG"
set syndb(font,create,hint)  "font create ?fontname? ?option value ...?"
set syndb(font,create,arglist)  [list -family -overstrike -size -slant -underline -weight]
set syndb(font,delete,type) "TKARG"
set syndb(font,delete,hint)  "font delete fontname ?fontname ...?"
set syndb(font,delete,arglist)  [list ]
set syndb(font,families,type) "TKARG"
set syndb(font,families,hint)  "font families ?-displayof window?"
set syndb(font,families,arglist)  [list -displayof]
set syndb(font,measure,type) "TKARG"
set syndb(font,measure,hint)  "font measure font ?-displayof window? text "
set syndb(font,measure,arglist)  [list -displayof]
set syndb(font,metrics,type) "TKARG"
set syndb(font,metrics,hint)  "font metrics font ?-displayof window? ?option?"
set syndb(font,metrics,arglist)  [list -displayof -ascent -descent -fixed -linespace ]
set syndb(font,names,type) "TKARG"
set syndb(font,names,hint)  "font names"
set syndb(font,names,arglist)  [list ]
