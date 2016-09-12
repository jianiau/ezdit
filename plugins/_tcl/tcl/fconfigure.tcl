set syndb(fconfigure,fconfigure,type) "TCLCMD"
set syndb(fconfigure,fconfigure,hint) "fconfigure channelId name value ?name value ...?"
set syndb(fconfigure,fconfigure,arglist) [list -blocking -buffering -buffersize -encoding -eofchar -mode -translation]
set syndb(fconfigure,-blocking,type) "TCLOPT"
set syndb(fconfigure,-blocking,hint)  ""
set syndb(fconfigure,-blocking,arglist)  [list ] 
set syndb(fconfigure,-buffering,type) "TCLOPT"
set syndb(fconfigure,-buffering,hint)  ""
set syndb(fconfigure,-buffering,arglist)  [list full line none] 
set syndb(fconfigure,-buffersize,type) "TCLOPT"
set syndb(fconfigure,-buffersize,hint)  ""
set syndb(fconfigure,-buffersize,arglist)  [list] 
set syndb(fconfigure,-encoding,type) "TCLOPT"
set syndb(fconfigure,-encoding,hint)  ""
set syndb(fconfigure,-encoding,arglist)  [list] 
set syndb(fconfigure,-eofchar,type) "TCLOPT"
set syndb(fconfigure,-eofchar,hint)  ""
set syndb(fconfigure,-eofchar,arglist)  [list] 
set syndb(fconfigure,-mode,type) "TCLOPT"
set syndb(fconfigure,-mode,hint)  "baud_rate,parity,data_bit,stop_bit"
set syndb(fconfigure,-mode,arglist)  [list] 
set syndb(fconfigure,-translation,type) "TCLOPT"
set syndb(fconfigure,-translation,hint)  ""
set syndb(fconfigure,-translation,arglist)  [list auto binary cr crlf lf] 
