set syndb(tcltest::test,test,type) "TCLCMD"
set syndb(tcltest::test,test,hint) "tcltest::test name description optionList"
set syndb(tcltest::test,test,arglist) [list -body -cleanup -constraints -errorOutput -match -output -result -returnCodes -setup]
set syndb(tcltest::test,-body,type) "TCLARG"
set syndb(tcltest::test,-body,hint)  ""
set syndb(tcltest::test,-body,arglist)  [list] 
set syndb(tcltest::test,-cleanup,type) "TCLARG"
set syndb(tcltest::test,-cleanup,hint)  ""
set syndb(tcltest::test,-cleanup,arglist)  [list] 
set syndb(tcltest::test,-constraints,type) "TCLARG"
set syndb(tcltest::test,-constraints,hint)  ""
set syndb(tcltest::test,-constraints,arglist)  [list] 
set syndb(tcltest::test,-errorOutput,type) "TCLARG"
set syndb(tcltest::test,-errorOutput,hint)  ""
set syndb(tcltest::test,-errorOutput,arglist)  [list] 
set syndb(tcltest::test,-match,type) "TCLARG"
set syndb(tcltest::test,-match,hint)  ""
set syndb(tcltest::test,-match,arglist)  [list] 
set syndb(tcltest::test,-output,type) "TCLARG"
set syndb(tcltest::test,-output,hint)  ""
set syndb(tcltest::test,-output,arglist)  [list] 
set syndb(tcltest::test,-result,type) "TCLARG"
set syndb(tcltest::test,-result,hint)  ""
set syndb(tcltest::test,-result,arglist)  [list] 
set syndb(tcltest::test,-returnCodes,type) "TCLARG"
set syndb(tcltest::test,-returnCodes,hint)  ""
set syndb(tcltest::test,-returnCodes,arglist)  [list] 
set syndb(tcltest::test,-setup,type) "TCLARG"
set syndb(tcltest::test,-setup,hint)  ""
set syndb(tcltest::test,-setup,arglist)  [list] 
