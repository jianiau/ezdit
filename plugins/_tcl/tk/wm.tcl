set syndb(wm,wm,type) "TKCMD"
set syndb(wm,wm,hint) "winfo option ?arg arg ...?"
set syndb(wm,wm,arglist) [list aspect attributes client colormapwindows command deiconify focusmodel forget frame geometry grid group iconbitmap iconify iconmask iconname iconphoto iconposition iconwindow manage maxsize minsize overrideredirect positionfrom protocol resizable sizefrom stackorder state title transient withdraw]
set syndb(wm,wm,colorlist) [list isabove isbelow -alpha -disabled -fullscreen -modified -notify  -titlepath -topmost -toolwindow -transparent -transparentcolor -zoomed]
set syndb(wm,wm,colortype) "TKOPT"
set syndb(wm,aspect,type) "TKARG"
set syndb(wm,aspect,hint)  "wm aspect window ?minNumer minDenom maxNumer maxDenom?"
set syndb(wm,aspect,arglist)  [list ]
set syndb(wm,attributes,type) "TKARG"
set syndb(wm,attributes,hint)  "wm attributes window (?option? | ?option value option value...?)"
set syndb(wm,attributes,arglist)  [list -alpha -disabled -fullscreen -modified -notify  -titlepath -topmost -toolwindow -transparent -transparentcolor -zoomed]
set syndb(wm,client,type) "TKARG"
set syndb(wm,client,hint)  "wm client window ?name?"
set syndb(wm,client,arglist)  [list ]
set syndb(wm,colormapwindows,type) "TKARG"
set syndb(wm,colormapwindows,hint)  "wm colormapwindows window ?windowList?"
set syndb(wm,colormapwindows,arglist)  [list ]
set syndb(wm,command,type) "TKARG"
set syndb(wm,command,hint)  "wm command window ?value?"
set syndb(wm,command,arglist)  [list ]
set syndb(wm,deiconify,type) "TKARG"
set syndb(wm,deiconify,hint)  "wm deiconify window"
set syndb(wm,deiconify,arglist)  [list ]
set syndb(wm,focusmodel,type) "TKARG"
set syndb(wm,focusmodel,hint)  "wm focusmodel window ?active|passive?"
set syndb(wm,focusmodel,arglist)  [list ]
set syndb(wm,forget,type) "TKARG"
set syndb(wm,forget,hint)  "wm forget window"
set syndb(wm,forget,arglist)  [list ]
set syndb(wm,frame,type) "TKARG"
set syndb(wm,frame,hint)  "wm frame window"
set syndb(wm,frame,arglist)  [list ]
set syndb(wm,geometry,type) "TKARG"
set syndb(wm,geometry,hint)  "wm geometry window ?newGeometry?"
set syndb(wm,geometry,arglist)  [list ]
set syndb(wm,grid,type) "TKARG"
set syndb(wm,grid,hint)  "wm grid window ?baseWidth baseHeight widthInc heightInc?"
set syndb(wm,grid,arglist)  [list ]
set syndb(wm,group,type) "TKARG"
set syndb(wm,group,hint)  "wm group window ?pathName?"
set syndb(wm,group,arglist)  [list ]
set syndb(wm,iconbitmap,type) "TKARG"
set syndb(wm,iconbitmap,hint)  "wm iconbitmap window (?bitmap? | ?-default? ?image?)"
set syndb(wm,iconbitmap,arglist)  [list -default]
set syndb(wm,iconify,type) "TKARG"
set syndb(wm,iconify,hint)  "wm iconify window"
set syndb(wm,iconify,arglist)  [list ]
set syndb(wm,iconmask,type) "TKARG"
set syndb(wm,iconmask,hint)  "wm iconmask window ?bitmap?"
set syndb(wm,iconmask,arglist)  [list ]
set syndb(wm,iconname,type) "TKARG"
set syndb(wm,iconname,hint)  "wm iconname window ?newName?"
set syndb(wm,iconname,arglist)  [list ]
set syndb(wm,iconphoto,type) "TKARG"
set syndb(wm,iconphoto,hint)  "wm iconphoto window ?-default? image1 ?image2 ...?"
set syndb(wm,iconphoto,arglist)  [list -default]
set syndb(wm,iconposition,type) "TKARG"
set syndb(wm,iconposition,hint)  "wm iconposition window ?x y?"
set syndb(wm,iconposition,arglist)  [list ]
set syndb(wm,iconwindow,type) "TKARG"
set syndb(wm,iconwindow,hint)  "wm iconwindow window ?pathName?"
set syndb(wm,iconwindow,arglist)  [list ]
set syndb(wm,manage,type) "TKARG"
set syndb(wm,manage,hint)  "wm manage widget"
set syndb(wm,manage,arglist)  [list ]
set syndb(wm,maxsize,type) "TKARG"
set syndb(wm,maxsize,hint)  "wm maxsize window ?width height?"
set syndb(wm,maxsize,arglist)  [list ]
set syndb(wm,minsize,type) "TKARG"
set syndb(wm,minsize,hint)  "wm minsize window ?width height?"
set syndb(wm,minsize,arglist)  [list ]
set syndb(wm,overrideredirect,type) "TKARG"
set syndb(wm,overrideredirect,hint)  "wm overrideredirect window ?boolean?"
set syndb(wm,overrideredirect,arglist)  [list ]
set syndb(wm,positionfrom,type) "TKARG"
set syndb(wm,positionfrom,hint)  "wm positionfrom window ?who?"
set syndb(wm,positionfrom,arglist)  [list ]
set syndb(wm,protocol,type) "TKARG"
set syndb(wm,protocol,hint)  "wm protocol window ?name? ?command?"
set syndb(wm,protocol,arglist)  [list ]
set syndb(wm,resizable,type) "TKARG"
set syndb(wm,resizable,hint)  "wm resizable window ?width height?"
set syndb(wm,resizable,arglist)  [list ]
set syndb(wm,sizefrom,type) "TKARG"
set syndb(wm,sizefrom,hint)  "wm sizefrom window ?who?"
set syndb(wm,sizefrom,arglist)  [list ]
set syndb(wm,stackorder,type) "TKARG"
set syndb(wm,stackorder,hint)  "wm stackorder window ?isabove|isbelow window?"
set syndb(wm,stackorder,arglist)  [list]
set syndb(wm,state,type) "TKARG"
set syndb(wm,state,hint)  "wm state window ?newstate?"
set syndb(wm,state,arglist)  [list normal iconic withdrawn icon zoomed]
set syndb(wm,title,type) "TKARG"
set syndb(wm,title,hint)  "wm title window ?string?"
set syndb(wm,title,arglist)  [list ]
set syndb(wm,transient,type) "TKARG"
set syndb(wm,transient,hint)  "wm transient window ?master?"
set syndb(wm,transient,arglist)  [list ]
set syndb(wm,withdraw,type) "TKARG"
set syndb(wm,withdraw,hint)  "wm withdraw window"
set syndb(wm,withdraw,arglist)  [list ]
