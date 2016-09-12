set syndb(file,file,type) "TCLCMD"
set syndb(file,file,hint) "file option name ?arg arg ...?"
set syndb(file,file,arglist) [list atime attributes channels copy delete dirname executable exists extension isdirectory isfile join link lstat mkdir mtime nativename normalize owned pathtype readable readlink rename rootname separator size split stat system tail type volumes writable]
set syndb(file,file,colorlist) [list -force -linktype]
set syndb(file,file,colortype) "TCLOPT"
set syndb(file,atime,type) "TCLARG"
set syndb(file,atime,hint)  "file atime name ?time?"
set syndb(file,atime,arglist)  [list] 
set syndb(file,attributes,type) "TCLARG"
set syndb(file,attributes,hint)  "file attributes name (?option? | ?option value option value...?)"
set syndb(file,attributes,arglist)  [list] 
set syndb(file,channels,type) "TCLARG"
set syndb(file,channels,hint)  "file channels ?pattern?"
set syndb(file,channels,arglist)  [list] 
set syndb(file,copy,type) "TCLARG"
set syndb(file,copy,hint)  "file copy ?-force? ?--? source target | file copy ?-force? ?--? source ?source ...? targetDir"
set syndb(file,copy,arglist)  [list -force] 
set syndb(file,delete,type) "TCLARG"
set syndb(file,delete,hint)  "file delete ?-force? ?--? pathname ?pathname ... ?"
set syndb(file,delete,arglist)  [list -force] 
set syndb(file,dirname,type) "TCLARG"
set syndb(file,dirname,hint)  "file dirname name"
set syndb(file,dirname,arglist)  [list] 
set syndb(file,executable,type) "TCLARG"
set syndb(file,executable,hint)  "file executable name"
set syndb(file,executable,arglist)  [list] 
set syndb(file,exists,type) "TCLARG"
set syndb(file,exists,hint)  "file exists name"
set syndb(file,exists,arglist)  [list] 
set syndb(file,extension,type) "TCLARG"
set syndb(file,extension,hint)  "file extension name"
set syndb(file,extension,arglist)  [list] 
set syndb(file,isdirectory,type) "TCLARG"
set syndb(file,isdirectory,hint)  "file isdirectory name"
set syndb(file,isdirectory,arglist)  [list] 
set syndb(file,isfile,type) "TCLARG"
set syndb(file,isfile,hint)  "file isfile name"
set syndb(file,isfile,arglist)  [list] 
set syndb(file,join,type) "TCLARG"
set syndb(file,join,hint)  "file join name ?name ...?"
set syndb(file,join,arglist)  [list] 
set syndb(file,link,type) "TCLARG"
set syndb(file,link,hint)  "file link ?-linktype? linkName ?target?"
set syndb(file,link,arglist)  [list -linktype] 
set syndb(file,lstat,type) "TCLARG"
set syndb(file,lstat,hint)  "file lstat name varName"
set syndb(file,lstat,arglist)  [list] 
set syndb(file,mkdir,type) "TCLARG"
set syndb(file,mkdir,hint)  "file mkdir dir ?dir ...?"
set syndb(file,mkdir,arglist)  [list] 
set syndb(file,mtime,type) "TCLARG"
set syndb(file,mtime,hint)  "file mtime name ?time?"
set syndb(file,mtime,arglist)  [list] 
set syndb(file,nativename,type) "TCLARG"
set syndb(file,nativename,hint)  "file nativename name"
set syndb(file,nativename,arglist)  [list] 
set syndb(file,normalize,type) "TCLARG"
set syndb(file,normalize,hint)  "file normalize name"
set syndb(file,normalize,arglist)  [list] 
set syndb(file,owned,type) "TCLARG"
set syndb(file,owned,hint)  "file owned name"
set syndb(file,owned,arglist)  [list] 
set syndb(file,pathtype,type) "TCLARG"
set syndb(file,pathtype,hint)  "file pathtype name"
set syndb(file,pathtype,arglist)  [list] 
set syndb(file,readable,type) "TCLARG"
set syndb(file,readable,hint)  "file readable name"
set syndb(file,readable,arglist)  [list] 
set syndb(file,readlink,type) "TCLARG"
set syndb(file,readlink,hint)  "file readlink name"
set syndb(file,readlink,arglist)  [list] 
set syndb(file,rename,type) "TCLARG"
set syndb(file,rename,hint)  "file rename ?-force? ?--? source target | file rename ?-force? ?--? source ?source ...? targetDir"
set syndb(file,rename,arglist)  [list -force] 
set syndb(file,rootname,type) "TCLARG"
set syndb(file,rootname,hint)  "file rootname name"
set syndb(file,rootname,arglist)  [list] 
set syndb(file,separator,type) "TCLARG"
set syndb(file,separator,hint)  "file separator ?name?"
set syndb(file,separator,arglist)  [list] 
set syndb(file,size,type) "TCLARG"
set syndb(file,size,hint)  "file size name"
set syndb(file,size,arglist)  [list] 
set syndb(file,split,type) "TCLARG"
set syndb(file,split,hint)  "file split name"
set syndb(file,split,arglist)  [list] 
set syndb(file,stat,type) "TCLARG"
set syndb(file,stat,hint)  "file stat name varName"
set syndb(file,stat,arglist)  [list] 
set syndb(file,system,type) "TCLARG"
set syndb(file,system,hint)  "file system name"
set syndb(file,system,arglist)  [list] 
set syndb(file,tail,type) "TCLARG"
set syndb(file,tail,hint)  "file tail name"
set syndb(file,tail,arglist)  [list] 
set syndb(file,type,type) "TCLARG"
set syndb(file,type,hint)  "file type name"
set syndb(file,type,arglist)  [list] 
set syndb(file,volumes,type) "TCLARG"
set syndb(file,volumes,hint)  "file volumes"
set syndb(file,volumes,arglist)  [list] 
set syndb(file,writable,type) "TCLARG"
set syndb(file,writable,hint)  "file writable name"
set syndb(file,writable,arglist)  [list] 
