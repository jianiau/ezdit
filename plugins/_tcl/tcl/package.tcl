set syndb(package,package,type) "TCLCMD"
set syndb(package,package,hint) "package option ?arg arg ...?"
set syndb(package,package,arglist) [list forget ifneeded names present provide require unknow vcompare versions vsatisfies]
set syndb(package,forget,type) "TCLARG"
set syndb(package,forget,hint)  "package forget ?package package ...?"
set syndb(package,forget,arglist)  [list] 
set syndb(package,ifneeded,type) "TCLARG"
set syndb(package,ifneeded,hint)  "package ifneeded package version ?script?"
set syndb(package,ifneeded,arglist)  [list] 
set syndb(package,names,type) "TCLARG"
set syndb(package,names,hint)  "package names"
set syndb(package,names,arglist)  [list] 
set syndb(package,present,type) "TCLARG"
set syndb(package,present,hint)  "package present -exact package version"
set syndb(package,present,arglist)  [list] 
set syndb(package,provide,type) "TCLARG"
set syndb(package,provide,hint)  "package provide package ?version?"
set syndb(package,provide,arglist)  [list] 
set syndb(package,require,type) "TCLARG"
set syndb(package,require,hint)  "package require -exact package version"
set syndb(package,require,arglist)  [lsort [package names]]
set syndb(package,unknow,type) "TCLARG"
set syndb(package,unknow,hint)  ""
set syndb(package,unknow,arglist)  [list] 
set syndb(package,vcompare,type) "TCLARG"
set syndb(package,vcompare,hint)  "package vcompare version1 version2"
set syndb(package,vcompare,arglist)  [list] 
set syndb(package,versions,type) "TCLARG"
set syndb(package,versions,hint)  "package versions package"
set syndb(package,versions,arglist)  [list] 
set syndb(package,vsatisfies,type) "TCLARG"
set syndb(package,vsatisfies,hint)  "package vsatisfies version requirement..."
set syndb(package,vsatisfies,arglist)  [list] 
