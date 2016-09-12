set syndb(chan,chan,type) "TCLCMD"
set syndb(chan,chan,hint) "chan option ?arg arg ...?"
set syndb(chan,chan,arglist) [list blocked close configure copy create eof event flush gets names pending postevent puts read seek tell truncate]
set syndb(chan,chan,colorlist) [list -blocking -buffering -buffersize -encoding -eofchar -mode -translation -nonewline -size -command]
set syndb(chan,chan,colortype) "TCLOPT"
set syndb(chan,-blocking,type) "TCLOPT"
set syndb(chan,-blocking,hint)  ""
set syndb(chan,-blocking,arglist)  [list ] 
set syndb(chan,-buffering,type) "TCLOPT"
set syndb(chan,-buffering,hint)  ""
set syndb(chan,-buffering,arglist)  [list full line none] 
set syndb(chan,blocked,type) "TCLARG"
set syndb(chan,blocked,hint)  "chan blocked channelId"
set syndb(chan,blocked,arglist)  [list] 
set syndb(chan,close,type) "TCLARG"
set syndb(chan,close,hint)  "chan close channelId"
set syndb(chan,close,arglist)  [list] 
set syndb(chan,configure,type) "TCLARG"
set syndb(chan,configure,hint)  "chan configure channelId ?optionName? ?value? ?optionName value?..."
set syndb(chan,configure,arglist)  [list -blocking -buffering -buffersize -encoding -eofchar -mode -translation]
set syndb(chan,copy,type) "TCLARG"
set syndb(chan,copy,hint)  "chan copy inputChan outputChan ?-size size? ?-command callback?"
set syndb(chan,copy,arglist)  [list -size -command] 
set syndb(chan,create,type) "TCLARG"
set syndb(chan,create,hint)  "chan create mode cmdPrefix"
set syndb(chan,create,arglist)  [list] 
set syndb(chan,eof,type) "TCLARG"
set syndb(chan,eof,hint)  "chan eof channelId"
set syndb(chan,eof,arglist)  [list] 
set syndb(chan,event,type) "TCLARG"
set syndb(chan,event,hint)  "chan event channelId event ?script?"
set syndb(chan,event,arglist)  [list] 
set syndb(chan,flush,type) "TCLARG"
set syndb(chan,flush,hint)  "chan flush channelId"
set syndb(chan,flush,arglist)  [list] 
set syndb(chan,gets,type) "TCLARG"
set syndb(chan,gets,hint)  "chan gets channelId ?varName?"
set syndb(chan,gets,arglist)  [list] 
set syndb(chan,names,type) "TCLARG"
set syndb(chan,names,hint)  "chan names ?pattern?"
set syndb(chan,names,arglist)  [list] 
set syndb(chan,pending,type) "TCLARG"
set syndb(chan,pending,hint)  "chan pending mode channelId"
set syndb(chan,pending,arglist)  [list] 
set syndb(chan,postevent,type) "TCLARG"
set syndb(chan,postevent,hint)  "chan postevent channelId eventSpec"
set syndb(chan,postevent,arglist)  [list] 
set syndb(chan,puts,type) "TCLARG"
set syndb(chan,puts,hint)  "chan puts ?-nonewline? ?channelId? string"
set syndb(chan,puts,arglist)  [list] 
set syndb(chan,read,type) "TCLARG"
set syndb(chan,read,hint)  "chan read channelId ?numChars? | chan read ?-nonewline? channelId | "
set syndb(chan,read,arglist)  [list] 
set syndb(chan,seek,type) "TCLARG"
set syndb(chan,seek,hint)  "chan seek channelId offset ?origin?"
set syndb(chan,seek,arglist)  [list] 
set syndb(chan,tell,type) "TCLARG"
set syndb(chan,tell,hint)  "chan tell channelId"
set syndb(chan,tell,arglist)  [list] 
set syndb(chan,truncate,type) "TCLARG"
set syndb(chan,truncate,hint)  "chan truncate channelId ?length? "
set syndb(chan,truncate,arglist)  [list] 
