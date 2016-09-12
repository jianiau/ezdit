set syndb(if,if,type) "TCLCMD"
set syndb(if,if,hint) "if expr1 ?then? body1 elseif expr2 ?then? body2 elseif ... ?else? ?bodyN?"
set syndb(if,if,arglist) [list else elseif then]
set syndb(if,else,type) "TCLARG"
set syndb(if,else,hint)  ""
set syndb(if,else,arglist)  [list] 
set syndb(if,elseif,type) "TCLARG"
set syndb(if,elseif,hint)  ""
set syndb(if,elseif,arglist)  [list] 
set syndb(if,then,type) "TCLARG"
set syndb(if,then,hint)  ""
set syndb(if,then,arglist)  [list] 
