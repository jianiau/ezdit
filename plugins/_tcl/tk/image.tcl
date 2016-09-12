set syndb(image,image,type) "TKCMD"
set syndb(image,image,hint) "image option ?arg arg ...?"
set syndb(image,image,arglist) [list create delete height inuse names  type types width]
set syndb(image,image,colorlist) [list -background -data -file -foreground -maskdata -maskfile -format -gamma -height -palette -width]
set syndb(image,image,colortype) "TKOPT"
set syndb(image,-background,type) "TKOPT"
set syndb(image,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(image,-background,hint)  ""
set syndb(image,-foreground,type) "TKOPT"
set syndb(image,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(image,-foreground,hint)  ""
set syndb(image,bitmap,type) "TKARG"
set syndb(image,bitmap,arglist)  [list -background -data -file -foreground -maskdata -maskfile ]
set syndb(image,bitmap,hint)  ""
set syndb(image,create,type) "TKARG"
set syndb(image,create,hint)  "image create type ?name? ?option value ...?"
set syndb(image,create,arglist)  [list bitmap photo]
set syndb(image,delete,type) "TKARG"
set syndb(image,delete,hint)  "image delete ?name name ...?"
set syndb(image,delete,arglist)  [list ]
set syndb(image,height,type) "TKARG"
set syndb(image,height,hint)  "image height name"
set syndb(image,height,arglist)  [list ]
set syndb(image,inuse,type) "TKARG"
set syndb(image,inuse,hint)  "image inuse name"
set syndb(image,inuse,arglist)  [list ]
set syndb(image,names,type) "TKARG"
set syndb(image,names,hint)  ""
set syndb(image,names,arglist)  [list ]
set syndb(image,photo,type) "TKARG"
set syndb(image,photo,hint)  ""
set syndb(image,photo,arglist)  [list -data -file -format -gamma -height -palette -width]
set syndb(image,type,type) "TKARG"
set syndb(image,type,hint)  "image type name"
set syndb(image,type,arglist)  [list ]
set syndb(image,types,type) "TKARG"
set syndb(image,types,hint)  ""
set syndb(image,types,arglist)  [list ]
set syndb(image,width,type) "TKARG"
set syndb(image,width,hint)  "image width name"
set syndb(image,width,arglist)  [list ]
