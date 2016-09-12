set syndb(abs,abs,type) "TCLCMD"
set syndb(abs,abs,hint) ""
set syndb(abs,abs,arglist) [list ]

set syndb(acos,acos,type) "TCLCMD"
set syndb(acos,acos,hint) ""
set syndb(acos,acos,arglist) [list ]

set syndb(after,after,type) "TCLCMD"
set syndb(after,after,hint) "after option ?arg arg ...?"
set syndb(after,after,arglist) [list cancel idle info ms]
set syndb(after,cancel,type) "TCLARG"
set syndb(after,cancel,hint)  "after cancel id | after cancel script script script ..."
set syndb(after,cancel,arglist)  [list] 
set syndb(after,idle,type) "TCLARG"
set syndb(after,idle,hint)  "after idle ?script script script ...?"
set syndb(after,idle,arglist)  [list] 
set syndb(after,info,type) "TCLARG"
set syndb(after,info,hint)  "after info ?id?"
set syndb(after,info,arglist)  [list] 
set syndb(after,ms,type) "TCLARG"
set syndb(after,ms,hint)  "after ms ?script script script ...?"
set syndb(after,ms,arglist)  [list] 

set syndb(append,append,type) "TCLCMD"
set syndb(append,append,hint) "append varName ?value value value ...?"
set syndb(append,append,arglist) [list ]

set syndb(apply,apply,type) "TCLCMD"
set syndb(apply,apply,hint) "apply func ?arg1 arg2 ...?"
set syndb(apply,apply,arglist) [list ]

set syndb(array,array,type) "TCLCMD"
set syndb(array,array,hint) "array option arrayName ?arg arg ...?"
set syndb(array,array,arglist) [list anymore donesearch exists get names nextelement set size startsearch statistics unset]
set syndb(array,anymore,type) "TCLARG"
set syndb(array,anymore,hint)  "array anymore arrayName searchId"
set syndb(array,anymore,arglist)  [list] 
set syndb(array,donesearch,type) "TCLARG"
set syndb(array,donesearch,hint)  "array donesearch arrayName searchId"
set syndb(array,donesearch,arglist)  [list] 
set syndb(array,exists,type) "TCLARG"
set syndb(array,exists,hint)  "array exists arrayName"
set syndb(array,exists,arglist)  [list] 
set syndb(array,get,type) "TCLARG"
set syndb(array,get,hint)  "array get arrayName ?pattern?"
set syndb(array,get,arglist)  [list] 
set syndb(array,names,type) "TCLARG"
set syndb(array,names,hint)  "array names arrayName ?mode? ?pattern?"
set syndb(array,names,arglist)  [list] 
set syndb(array,nextelement,type) "TCLARG"
set syndb(array,nextelement,hint)  "array nextelement arrayName searchId"
set syndb(array,nextelement,arglist)  [list] 
set syndb(array,set,type) "TCLARG"
set syndb(array,set,hint)  "array set arrayName list"
set syndb(array,set,arglist)  [list] 
set syndb(array,size,type) "TCLARG"
set syndb(array,size,hint)  "array size arrayName"
set syndb(array,size,arglist)  [list] 
set syndb(array,startsearch,type) "TCLARG"
set syndb(array,startsearch,hint)  "array startsearch arrayName"
set syndb(array,startsearch,arglist)  [list] 
set syndb(array,statistics,type) "TCLARG"
set syndb(array,statistics,hint)  "array statistics arrayName"
set syndb(array,statistics,arglist)  [list] 
set syndb(array,unset,type) "TCLARG"
set syndb(array,unset,hint)  "array unset arrayName ?pattern? "
set syndb(array,unset,arglist)  [list] 

set syndb(asin,asin,type) "TCLCMD"
set syndb(asin,asin,hint) ""
set syndb(asin,asin,arglist) [list ]

set syndb(atan,atan,type) "TCLCMD"
set syndb(atan,atan,hint) ""
set syndb(atan,atan,arglist) [list ]

set syndb(atan2,atan2,type) "TCLCMD"
set syndb(atan2,atan2,hint) ""
set syndb(atan2,atan2,arglist) [list ]

set syndb(auto_execok,auto_execok,type) "TCLCMD"
set syndb(auto_execok,auto_execok,hint) "auto_execok cmd"
set syndb(auto_execok,auto_execok,arglist) [list ]

set syndb(auto_load,auto_load,type) "TCLCMD"
set syndb(auto_load,auto_load,hint) "auto_load cmd"
set syndb(auto_load,auto_load,arglist) [list ]

set syndb(auto_mkindex,auto_mkindex,type) "TCLCMD"
set syndb(auto_mkindex,auto_mkindex,hint) "auto_mkindex dir pattern pattern ..."
set syndb(auto_mkindex,auto_mkindex,arglist) [list ]

set syndb(auto_mkindex_old,auto_mkindex_old,type) "TCLCMD"
set syndb(auto_mkindex_old,auto_mkindex_old,hint) "auto_mkindex_old dir pattern pattern ..."
set syndb(auto_mkindex_old,auto_mkindex_old,arglist) [list ]

set syndb(auto_qualify,auto_qualify,type) "TCLCMD"
set syndb(auto_qualify,auto_qualify,hint) "auto_qualify command namespace"
set syndb(auto_qualify,auto_qualify,arglist) [list ]

set syndb(auto_reset,auto_reset,type) "TCLCMD"
set syndb(auto_reset,auto_reset,hint) "auto_reset"
set syndb(auto_reset,auto_reset,arglist) [list ]

set syndb(bgerror,bgerror,type) "TCLCMD"
set syndb(bgerror,bgerror,hint) "bgerror message"
set syndb(bgerror,bgerror,arglist) [list ]

set syndb(binary,binary,type) "TCLCMD"
set syndb(binary,binary,hint) "binary format | binary scan"
set syndb(binary,binary,arglist) [list format scan]
set syndb(binary,format,type) "TCLARG"
set syndb(binary,format,hint)  "binary format formatString ?arg arg ...?"
set syndb(binary,format,arglist)  [list] 
set syndb(binary,scan,type) "TCLARG"
set syndb(binary,scan,hint)  "binary scan string formatString ?varName varName ...?"
set syndb(binary,scan,arglist)  [list] 

set syndb(break,break,type) "TCLCMD"
set syndb(break,break,hint) ""
set syndb(break,break,arglist) [list ]

set syndb(catch,catch,type) "TCLCMD"
set syndb(catch,catch,hint) "catch script ?resultVarName? ?optionsVarName?"
set syndb(catch,catch,arglist) [list ]

set syndb(cd,cd,type) "TCLCMD"
set syndb(cd,cd,hint) "cd ?dirName?"
set syndb(cd,cd,arglist) [list ]

set syndb(ceil,ceil,type) "TCLCMD"
set syndb(ceil,ceil,hint) ""
set syndb(ceil,ceil,arglist) [list ]

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

set syndb(class,class,type) "TCLCMD"
set syndb(class,class,hint) ""
set syndb(class,class,arglist) [list create]
set syndb(class,create,type) "TCLARG"
set syndb(class,create,hint)  ""
set syndb(class,create,arglist)  [list] 

set syndb(clock,clock,type) "TCLCMD"
set syndb(clock,clock,hint) "clock option ?arg arg ...?"
set syndb(clock,clock,arglist) [list add clicks format microseconds milliseconds scan seconds]
set syndb(clock,add,type) "TCLARG"
set syndb(clock,add,hint)  "clock add timeVal ?count unit...? ?-option value?"
set syndb(clock,add,arglist)  [list -base -format -gmt -locale -timezone]  
set syndb(clock,clicks,type) "TCLARG"
set syndb(clock,clicks,hint)  "clock clicks ?-option?"
set syndb(clock,clicks,arglist)  [list] 
set syndb(clock,format,type) "TCLARG"
set syndb(clock,format,hint)  "clock format timeVal ?-option value...?"
set syndb(clock,format,arglist)  [list -base -format -gmt -locale -timezone] 
set syndb(clock,microseconds,type) "TCLARG"
set syndb(clock,microseconds,hint)  "clock microseconds"
set syndb(clock,microseconds,arglist)  [list] 
set syndb(clock,milliseconds,type) "TCLARG"
set syndb(clock,milliseconds,hint)  "clock milliseconds"
set syndb(clock,milliseconds,arglist)  [list] 
set syndb(clock,scan,type) "TCLARG"
set syndb(clock,scan,hint)  "clock scan inputString ?-option value...?"
set syndb(clock,scan,arglist)  [list -base -format -gmt -locale -timezone]
set syndb(clock,seconds,type) "TCLARG"
set syndb(clock,seconds,hint)  "clock seconds"
set syndb(clock,seconds,arglist)  [list] 

set syndb(close,close,type) "TCLCMD"
set syndb(close,close,hint) "close channelId"
set syndb(close,close,arglist) [list ]

set syndb(concat,concat,type) "TCLCMD"
set syndb(concat,concat,hint) "concat ?arg arg ...?"
set syndb(concat,concat,arglist) [list ]

set syndb(constructor,constructor,type) "TCLCMD"
set syndb(constructor,constructor,hint) "constructor argList bodyScript"
set syndb(constructor,constructor,arglist) [list ]

set syndb(continue,continue,type) "TCLCMD"
set syndb(continue,continue,hint) ""
set syndb(continue,continue,arglist) [list ]

set syndb(cos,cos,type) "TCLCMD"
set syndb(cos,cos,hint) ""
set syndb(cos,cos,arglist) [list ]

set syndb(cosh,cosh,type) "TCLCMD"
set syndb(cosh,cosh,hint) ""
set syndb(cosh,cosh,arglist) [list ]

set syndb(dde,dde,type) "TCLCMD"
set syndb(dde,dde,hint) ""
set syndb(dde,dde,arglist) [list eval execute poke request servername services]
set syndb(dde,eval,type) "TCLARG"
set syndb(dde,eval,hint)  "dde eval ?-async? topic cmd ?arg arg ...?"
set syndb(dde,eval,arglist)  [list] 
set syndb(dde,execute,type) "TCLARG"
set syndb(dde,execute,hint)  "dde execute ?-async? service topic data"
set syndb(dde,execute,arglist)  [list] 
set syndb(dde,poke,type) "TCLARG"
set syndb(dde,poke,hint)  "dde poke service topic item data"
set syndb(dde,poke,arglist)  [list] 
set syndb(dde,request,type) "TCLARG"
set syndb(dde,request,hint)  "dde request ?-binary? service topic item"
set syndb(dde,request,arglist)  [list] 
set syndb(dde,servername,type) "TCLARG"
set syndb(dde,servername,hint)  "dde servername ?-force? ?-handler proc? ?--? ?topic?"
set syndb(dde,servername,arglist)  [list] 
set syndb(dde,services,type) "TCLARG"
set syndb(dde,services,hint)  "dde services service topic"
set syndb(dde,services,arglist)  [list] 

set syndb(deletemethod,deletemethod,type) "TCLCMD"
set syndb(deletemethod,deletemethod,hint) "deletemethod name ?name ..."
set syndb(deletemethod,deletemethod,arglist) [list ]

set syndb(destructor,destructor,type) "TCLCMD"
set syndb(destructor,destructor,hint) "destructor bodyScript"
set syndb(destructor,destructor,arglist) [list ]

set syndb(dict,dict,type) "TCLCMD"
set syndb(dict,dict,hint) "dict option arg ?arg ...?"
set syndb(dict,dict,arglist) [list append create exists filter for get incr info keys lappend merge remove replace set size unset update values with]
set syndb(dict,append,type) "TCLARG"
set syndb(dict,append,hint)  "dict append dictionaryVariable key ?string ...?"
set syndb(dict,append,arglist)  [list] 
set syndb(dict,create,type) "TCLARG"
set syndb(dict,create,hint)  "dict create ?key value ...?"
set syndb(dict,create,arglist)  [list] 
set syndb(dict,exists,type) "TCLARG"
set syndb(dict,exists,hint)  "dict exists dictionaryValue key ?key ...?"
set syndb(dict,exists,arglist)  [list] 
set syndb(dict,filter,type) "TCLARG"
set syndb(dict,filter,hint)  "dict filter dictionaryValue (filterType arg ?arg ...? | key globPattern | script {keyVar valueVar} script | value globPattern)"
set syndb(dict,filter,arglist)  [list] 
set syndb(dict,for,type) "TCLARG"
set syndb(dict,for,hint)  "dict for {keyVar valueVar} dictionaryValue body"
set syndb(dict,for,arglist)  [list] 
set syndb(dict,get,type) "TCLARG"
set syndb(dict,get,hint)  "dict get dictionaryValue ?key ...?"
set syndb(dict,get,arglist)  [list] 
set syndb(dict,incr,type) "TCLARG"
set syndb(dict,incr,hint)  "dict incr dictionaryVariable key ?increment?"
set syndb(dict,incr,arglist)  [list] 
set syndb(dict,info,type) "TCLARG"
set syndb(dict,info,hint)  "dict info dictionaryValue"
set syndb(dict,info,arglist)  [list] 
set syndb(dict,keys,type) "TCLARG"
set syndb(dict,keys,hint)  "dict keys dictionaryValue ?globPattern?"
set syndb(dict,keys,arglist)  [list] 
set syndb(dict,lappend,type) "TCLARG"
set syndb(dict,lappend,hint)  "dict lappend dictionaryVariable key ?value ...?"
set syndb(dict,lappend,arglist)  [list] 
set syndb(dict,merge,type) "TCLARG"
set syndb(dict,merge,hint)  "dict merge ?dictionaryValue ...?"
set syndb(dict,merge,arglist)  [list] 
set syndb(dict,remove,type) "TCLARG"
set syndb(dict,remove,hint)  "dict remove dictionaryValue ?key ...?"
set syndb(dict,remove,arglist)  [list] 
set syndb(dict,replace,type) "TCLARG"
set syndb(dict,replace,hint)  "dict replace dictionaryValue ?key value ...?"
set syndb(dict,replace,arglist)  [list] 
set syndb(dict,set,type) "TCLARG"
set syndb(dict,set,hint)  "dict set dictionaryVariable key ?key ...? value"
set syndb(dict,set,arglist)  [list] 
set syndb(dict,size,type) "TCLARG"
set syndb(dict,size,hint)  "dict size dictionaryValue"
set syndb(dict,size,arglist)  [list] 
set syndb(dict,unset,type) "TCLARG"
set syndb(dict,unset,hint)  "dict unset dictionaryVariable key ?key ...?"
set syndb(dict,unset,arglist)  [list] 
set syndb(dict,update,type) "TCLARG"
set syndb(dict,update,hint)  "dict update dictionaryVariable key varName ?key varName ...? body"
set syndb(dict,update,arglist)  [list] 
set syndb(dict,values,type) "TCLARG"
set syndb(dict,values,hint)  "dict values dictionaryValue ?globPattern?"
set syndb(dict,values,arglist)  [list] 
set syndb(dict,with,type) "TCLARG"
set syndb(dict,with,hint)  "dict with dictionaryVariable ?key ...? body"
set syndb(dict,with,arglist)  [list] 

set syndb(double,double,type) "TCLCMD"
set syndb(double,double,hint) ""
set syndb(double,double,arglist) [list ]

set syndb(encoding,encoding,type) "TCLCMD"
set syndb(encoding,encoding,hint) "encoding option ?arg arg ...?"
set syndb(encoding,encoding,arglist) [list convertfrom convertto names system]
set syndb(encoding,convertfrom,type) "TCLARG"
set syndb(encoding,convertfrom,hint)  "encoding convertfrom ?encoding? data"
set syndb(encoding,convertfrom,arglist)  [list] 
set syndb(encoding,convertto,type) "TCLARG"
set syndb(encoding,convertto,hint)  "encoding convertto ?encoding? string"
set syndb(encoding,convertto,arglist)  [list] 
set syndb(encoding,names,type) "TCLARG"
set syndb(encoding,names,hint)  "encoding names"
set syndb(encoding,names,arglist)  [list] 
set syndb(encoding,system,type) "TCLARG"
set syndb(encoding,system,hint)  "encoding system ?encoding? "
set syndb(encoding,system,arglist)  [list] 

set syndb(platform::shell::identify,identify,type) "TCLCMD"
set syndb(platform::shell::identify,identify,hint) "platform::shell::identify shell"
set syndb(platform::shell::identify,identify,arglist) [list ]

set syndb(platform::shell::platform,platform,type) "TCLCMD"
set syndb(platform::shell::platform,platform,hint) "platform::shell::platform shell"
set syndb(platform::shell::platform,platform,arglist) [list ]

set syndb(pow,pow,type) "TCLCMD"
set syndb(pow,pow,hint) ""
set syndb(pow,pow,arglist) [list ]

set syndb(proc,proc,type) "TCLCMD"
set syndb(proc,proc,hint) "proc name args body"
set syndb(proc,proc,arglist) [list ]

set syndb(puts,puts,type) "TCLCMD"
set syndb(puts,puts,hint) "puts ?-nonewline? ?channelId? string"
set syndb(puts,puts,arglist) [list -nonewline]
set syndb(puts,-nonewline,type) "TCLARG"
set syndb(puts,-nonewline,hint)  ""
set syndb(puts,-nonewline,arglist)  [list] 

set syndb(pwd,pwd,type) "TCLCMD"
set syndb(pwd,pwd,hint) "pwd"
set syndb(pwd,pwd,arglist) [list ]

set syndb(rand,rand,type) "TCLCMD"
set syndb(rand,rand,hint) ""
set syndb(rand,rand,arglist) [list ]

set syndb(read,read,type) "TCLCMD"
set syndb(read,read,hint) "read (?-nonewline? channelId |  channelId numChars)"
set syndb(read,read,arglist) [list -nonewline]
set syndb(read,-nonewline,type) "TCLARG"
set syndb(read,-nonewline,hint)  ""
set syndb(read,-nonewline,arglist)  [list] 

set syndb(refchan,refchan,type) "TCLCMD"
set syndb(refchan,refchan,hint) ""
set syndb(refchan,refchan,arglist) [list ]

set syndb(regexp,regexp,type) "TCLCMD"
set syndb(regexp,regexp,hint) "regexp ?switches? exp string ?matchVar? ?subMatchVar subMatchVar ...?"
set syndb(regexp,regexp,arglist) [list -about -all -expanded -indices -inline -line -lineanchor -linestop -nocase -start]
set syndb(regexp,-about,type) "TCLARG"
set syndb(regexp,-about,hint)  ""
set syndb(regexp,-about,arglist)  [list] 
set syndb(regexp,-all,type) "TCLARG"
set syndb(regexp,-all,hint)  ""
set syndb(regexp,-all,arglist)  [list] 
set syndb(regexp,-expanded,type) "TCLARG"
set syndb(regexp,-expanded,hint)  ""
set syndb(regexp,-expanded,arglist)  [list] 
set syndb(regexp,-indices,type) "TCLARG"
set syndb(regexp,-indices,hint)  ""
set syndb(regexp,-indices,arglist)  [list] 
set syndb(regexp,-inline,type) "TCLARG"
set syndb(regexp,-inline,hint)  ""
set syndb(regexp,-inline,arglist)  [list] 
set syndb(regexp,-line,type) "TCLARG"
set syndb(regexp,-line,hint)  ""
set syndb(regexp,-line,arglist)  [list] 
set syndb(regexp,-lineanchor,type) "TCLARG"
set syndb(regexp,-lineanchor,hint)  ""
set syndb(regexp,-lineanchor,arglist)  [list] 
set syndb(regexp,-linestop,type) "TCLARG"
set syndb(regexp,-linestop,hint)  ""
set syndb(regexp,-linestop,arglist)  [list] 
set syndb(regexp,-nocase,type) "TCLARG"
set syndb(regexp,-nocase,hint)  ""
set syndb(regexp,-nocase,arglist)  [list] 
set syndb(regexp,-start,type) "TCLARG"
set syndb(regexp,-start,hint)  ""
set syndb(regexp,-start,arglist)  [list] 

set syndb(registry,registry,type) "TCLCMD"
set syndb(registry,registry,hint) "registry option keyName ?arg arg ...?"
set syndb(registry,registry,arglist) [list broadcase delete get keys set type values]
set syndb(registry,broadcase,type) "TCLARG"
set syndb(registry,broadcase,hint)  ""
set syndb(registry,broadcase,arglist)  [list] 
set syndb(registry,delete,type) "TCLARG"
set syndb(registry,delete,hint)  "registry delete keyName ?valueName?"
set syndb(registry,delete,arglist)  [list] 
set syndb(registry,get,type) "TCLARG"
set syndb(registry,get,hint)  "registry get keyName valueName"
set syndb(registry,get,arglist)  [list] 
set syndb(registry,keys,type) "TCLARG"
set syndb(registry,keys,hint)  "registry keys keyName ?pattern?"
set syndb(registry,keys,arglist)  [list] 
set syndb(registry,set,type) "TCLARG"
set syndb(registry,set,hint)  "registry set keyName ?valueName data ?type??"
set syndb(registry,set,arglist)  [list] 
set syndb(registry,type,type) "TCLARG"
set syndb(registry,type,hint)  "registry type keyName valueName"
set syndb(registry,type,arglist)  [list] 
set syndb(registry,values,type) "TCLARG"
set syndb(registry,values,hint)  "registry values keyName ?pattern?"
set syndb(registry,values,arglist)  [list] 

set syndb(regsub,regsub,type) "TCLCMD"
set syndb(regsub,regsub,hint) "regsub ?switches? exp string subSpec ?varName?"
set syndb(regsub,regsub,arglist) [list -all -expanded -line -lineanchor -linestop -nocase -start]
set syndb(regsub,-all,type) "TCLARG"
set syndb(regsub,-all,hint)  ""
set syndb(regsub,-all,arglist)  [list] 
set syndb(regsub,-expanded,type) "TCLARG"
set syndb(regsub,-expanded,hint)  ""
set syndb(regsub,-expanded,arglist)  [list] 
set syndb(regsub,-line,type) "TCLARG"
set syndb(regsub,-line,hint)  ""
set syndb(regsub,-line,arglist)  [list] 
set syndb(regsub,-lineanchor,type) "TCLARG"
set syndb(regsub,-lineanchor,hint)  ""
set syndb(regsub,-lineanchor,arglist)  [list] 
set syndb(regsub,-linestop,type) "TCLARG"
set syndb(regsub,-linestop,hint)  ""
set syndb(regsub,-linestop,arglist)  [list] 
set syndb(regsub,-nocase,type) "TCLARG"
set syndb(regsub,-nocase,hint)  ""
set syndb(regsub,-nocase,arglist)  [list] 
set syndb(regsub,-start,type) "TCLARG"
set syndb(regsub,-start,hint)  ""
set syndb(regsub,-start,arglist)  [list] 

set syndb(rename,rename,type) "TCLCMD"
set syndb(rename,rename,hint) "rename oldName newName"
set syndb(rename,rename,arglist) [list ]

set syndb(renamemethod,renamemethod,type) "TCLCMD"
set syndb(renamemethod,renamemethod,hint) "renamemethod fromName toName"
set syndb(renamemethod,renamemethod,arglist) [list ]

set syndb(resource,resource,type) "TCLCMD"
set syndb(resource,resource,hint) ""
set syndb(resource,resource,arglist) [list close delete files list open read types write]
set syndb(resource,close,type) "TCLARG"
set syndb(resource,close,hint)  ""
set syndb(resource,close,arglist)  [list] 
set syndb(resource,delete,type) "TCLARG"
set syndb(resource,delete,hint)  ""
set syndb(resource,delete,arglist)  [list] 
set syndb(resource,files,type) "TCLARG"
set syndb(resource,files,hint)  ""
set syndb(resource,files,arglist)  [list] 
set syndb(resource,list,type) "TCLARG"
set syndb(resource,list,hint)  ""
set syndb(resource,list,arglist)  [list] 
set syndb(resource,open,type) "TCLARG"
set syndb(resource,open,hint)  ""
set syndb(resource,open,arglist)  [list] 
set syndb(resource,read,type) "TCLARG"
set syndb(resource,read,hint)  ""
set syndb(resource,read,arglist)  [list] 
set syndb(resource,types,type) "TCLARG"
set syndb(resource,types,hint)  ""
set syndb(resource,types,arglist)  [list] 
set syndb(resource,write,type) "TCLARG"
set syndb(resource,write,hint)  ""
set syndb(resource,write,arglist)  [list] 

set syndb(return,return,type) "TCLCMD"
set syndb(return,return,hint) "return ?-code code? ?result?"
set syndb(return,return,arglist) [list -code -errorcode -errorinfo]
set syndb(return,-code,type) "TCLARG"
set syndb(return,-code,hint)  ""
set syndb(return,-code,arglist)  [list] 
set syndb(return,-errorcode,type) "TCLARG"
set syndb(return,-errorcode,hint)  ""
set syndb(return,-errorcode,arglist)  [list] 
set syndb(return,-errorinfo,type) "TCLARG"
set syndb(return,-errorinfo,hint)  ""
set syndb(return,-errorinfo,arglist)  [list] 

set syndb(http::formatQuery,formatQuery,type) "TCLCMD"
set syndb(http::formatQuery,formatQuery,hint) "http::formatQuery key value ?key value ...?"
set syndb(http::formatQuery,formatQuery,arglist) [list ]

set syndb(http::geturl,geturl,type) "TCLCMD"
set syndb(http::geturl,geturl,hint) "http::geturl url ?options?"
set syndb(http::geturl,geturl,arglist) [list -blocksize -channel -command -handler -headers -keepalive \
	-method -myaddr -progress -protocol -query -queryblocksize -querychannel -queryprogress -strict -timeout -type -validate \
]


set syndb(http::meta,meta,type) "TCLCMD"
set syndb(http::meta,meta,hint) "http::meta token"
set syndb(http::meta,meta,arglist) [list ]

set syndb(http::ncode,ncode,type) "TCLCMD"
set syndb(http::ncode,ncode,hint) "http::ncode token"
set syndb(http::ncode,ncode,arglist) [list ]

set syndb(http::register,register,type) "TCLCMD"
set syndb(http::register,register,hint) "http::register proto port command"
set syndb(http::register,register,arglist) [list ]

set syndb(http::reset,reset,type) "TCLCMD"
set syndb(http::reset,reset,hint) "http::reset token ?why?"
set syndb(http::reset,reset,arglist) [list ]

set syndb(http::size,size,type) "TCLCMD"
set syndb(http::size,size,hint) "http::size token"
set syndb(http::size,size,arglist) [list ]

set syndb(http::status,status,type) "TCLCMD"
set syndb(http::status,status,hint) "http::status token"
set syndb(http::status,status,arglist) [list ]

set syndb(http::unregister,unregister,type) "TCLCMD"
set syndb(http::unregister,unregister,hint) "http::unregister proto"
set syndb(http::unregister,unregister,arglist) [list ]

set syndb(http::wait,wait,type) "TCLCMD"
set syndb(http::wait,wait,hint) "http::wait token"
set syndb(http::wait,wait,arglist) [list ]

set syndb(hypot,hypot,type) "TCLCMD"
set syndb(hypot,hypot,hint) ""
set syndb(hypot,hypot,arglist) [list ]

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

set syndb(incr,incr,type) "TCLCMD"
set syndb(incr,incr,hint) "incr varName ?increment?"
set syndb(incr,incr,arglist) [list ]

set syndb(info,info,type) "TCLCMD"
set syndb(info,info,hint) "info option ?arg arg ...?"
set syndb(info,info,arglist) [list args body cmdcount commands complete default exists functions globals hostname level library loaded locals nameofexecutable patchlevel procs script sharedlibextension tclversion vars]
set syndb(info,args,type) "TCLARG"
set syndb(info,args,hint)  "info args procname"
set syndb(info,args,arglist)  [list] 
set syndb(info,body,type) "TCLARG"
set syndb(info,body,hint)  "info body procname"
set syndb(info,body,arglist)  [list] 
set syndb(info,cmdcount,type) "TCLARG"
set syndb(info,cmdcount,hint)  "info cmdcount"
set syndb(info,cmdcount,arglist)  [list] 
set syndb(info,commands,type) "TCLARG"
set syndb(info,commands,hint)  "info commands ?pattern?"
set syndb(info,commands,arglist)  [list] 
set syndb(info,complete,type) "TCLARG"
set syndb(info,complete,hint)  "info complete command"
set syndb(info,complete,arglist)  [list] 
set syndb(info,default,type) "TCLARG"
set syndb(info,default,hint)  "info default procname arg varname"
set syndb(info,default,arglist)  [list] 
set syndb(info,exists,type) "TCLARG"
set syndb(info,exists,hint)  "info exists varName"
set syndb(info,exists,arglist)  [list] 
set syndb(info,functions,type) "TCLARG"
set syndb(info,functions,hint)  "info functions ?pattern?"
set syndb(info,functions,arglist)  [list] 
set syndb(info,globals,type) "TCLARG"
set syndb(info,globals,hint)  "info globals ?pattern?"
set syndb(info,globals,arglist)  [list] 
set syndb(info,hostname,type) "TCLARG"
set syndb(info,hostname,hint)  "info hostname"
set syndb(info,hostname,arglist)  [list] 
set syndb(info,level,type) "TCLARG"
set syndb(info,level,hint)  "info level ?number?"
set syndb(info,level,arglist)  [list] 
set syndb(info,library,type) "TCLARG"
set syndb(info,library,hint)  "info library"
set syndb(info,library,arglist)  [list] 
set syndb(info,loaded,type) "TCLARG"
set syndb(info,loaded,hint)  "info loaded ?interp?"
set syndb(info,loaded,arglist)  [list] 
set syndb(info,locals,type) "TCLARG"
set syndb(info,locals,hint)  "info locals ?pattern?"
set syndb(info,locals,arglist)  [list] 
set syndb(info,nameofexecutable,type) "TCLARG"
set syndb(info,nameofexecutable,hint)  "info nameofexecutable"
set syndb(info,nameofexecutable,arglist)  [list] 
set syndb(info,patchlevel,type) "TCLARG"
set syndb(info,patchlevel,hint)  "info patchlevel"
set syndb(info,patchlevel,arglist)  [list] 
set syndb(info,procs,type) "TCLARG"
set syndb(info,procs,hint)  "info procs ?pattern?"
set syndb(info,procs,arglist)  [list] 
set syndb(info,script,type) "TCLARG"
set syndb(info,script,hint)  "info script ?filename?"
set syndb(info,script,arglist)  [list] 
set syndb(info,sharedlibextension,type) "TCLARG"
set syndb(info,sharedlibextension,hint)  "info sharedlibextension"
set syndb(info,sharedlibextension,arglist)  [list] 
set syndb(info,tclversion,type) "TCLARG"
set syndb(info,tclversion,hint)  "info tclversion"
set syndb(info,tclversion,arglist)  [list] 
set syndb(info,vars,type) "TCLARG"
set syndb(info,vars,hint)  "info vars ?pattern?"
set syndb(info,vars,arglist)  [list] 

set syndb(int,int,type) "TCLCMD"
set syndb(int,int,hint) ""
set syndb(int,int,arglist) [list ]

set syndb(interp,interp,type) "TCLCMD"
set syndb(interp,interp,hint) "interp subcommand ?arg arg ...?"
set syndb(interp,interp,arglist) [list alias create delete eval exists expose hidden hide invokehidden issafe marktrusted recursionlimit share slaves target transfer]
set syndb(interp,alias,type) "TCLARG"
set syndb(interp,alias,hint)  "interp alias srcPath srcCmd targetPath targetCmd ?arg arg ...?"
set syndb(interp,alias,arglist)  [list] 
set syndb(interp,create,type) "TCLARG"
set syndb(interp,create,hint)  "interp create ?-safe? ?--? ?path?"
set syndb(interp,create,arglist)  [list] 
set syndb(interp,delete,type) "TCLARG"
set syndb(interp,delete,hint)  "interp delete ?path ...?"
set syndb(interp,delete,arglist)  [list] 
set syndb(interp,eval,type) "TCLARG"
set syndb(interp,eval,hint)  "interp eval path arg ?arg ...?"
set syndb(interp,eval,arglist)  [list] 
set syndb(interp,exists,type) "TCLARG"
set syndb(interp,exists,hint)  "interp exists path"
set syndb(interp,exists,arglist)  [list] 
set syndb(interp,expose,type) "TCLARG"
set syndb(interp,expose,hint)  "interp expose path hiddenName ?exposedCmdName?"
set syndb(interp,expose,arglist)  [list] 
set syndb(interp,hidden,type) "TCLARG"
set syndb(interp,hidden,hint)  "interp hidden path"
set syndb(interp,hidden,arglist)  [list] 
set syndb(interp,hide,type) "TCLARG"
set syndb(interp,hide,hint)  "interp hide path exposedCmdName ?hiddenCmdName?"
set syndb(interp,hide,arglist)  [list] 
set syndb(interp,invokehidden,type) "TCLARG"
set syndb(interp,invokehidden,hint)  "interp invokehidden path ?-option ...? hiddenCmdName ?arg ...?"
set syndb(interp,invokehidden,arglist)  [list] 
set syndb(interp,issafe,type) "TCLARG"
set syndb(interp,issafe,hint)  "interp issafe ?path?"
set syndb(interp,issafe,arglist)  [list] 
set syndb(interp,marktrusted,type) "TCLARG"
set syndb(interp,marktrusted,hint)  "interp marktrusted path"
set syndb(interp,marktrusted,arglist)  [list] 
set syndb(interp,recursionlimit,type) "TCLARG"
set syndb(interp,recursionlimit,hint)  "interp recursionlimit path ?newlimit?"
set syndb(interp,recursionlimit,arglist)  [list] 
set syndb(interp,share,type) "TCLARG"
set syndb(interp,share,hint)  "interp share srcPath channelId destPath"
set syndb(interp,share,arglist)  [list] 
set syndb(interp,slaves,type) "TCLARG"
set syndb(interp,slaves,hint)  "interp slaves ?path?"
set syndb(interp,slaves,arglist)  [list] 
set syndb(interp,target,type) "TCLARG"
set syndb(interp,target,hint)  "interp target path alias"
set syndb(interp,target,arglist)  [list] 
set syndb(interp,transfer,type) "TCLARG"
set syndb(interp,transfer,hint)  "interp transfer srcPath channelId destPath"
set syndb(interp,transfer,arglist)  [list] 

set syndb(isqrt,isqrt,type) "TCLCMD"
set syndb(isqrt,isqrt,hint) ""
set syndb(isqrt,isqrt,arglist) [list ]

set syndb(join,join,type) "TCLCMD"
set syndb(join,join,hint) "join list ?joinString?"
set syndb(join,join,arglist) [list ]

set syndb(bool,bool,type) "TCLCMD"
set syndb(bool,bool,hint) ""
set syndb(bool,bool,arglist) [list ]

set syndb(entier,entier,type) "TCLCMD"
set syndb(entier,entier,hint) ""
set syndb(entier,entier,arglist) [list ]

set syndb(http::error,error,type) "TCLCMD"
set syndb(http::error,error,hint) "http::error token"
set syndb(http::error,error,arglist) [list ]

set syndb(lappend,lappend,type) "TCLCMD"
set syndb(lappend,lappend,hint) "lappend varName ?value value value ...?"
set syndb(lappend,lappend,arglist) [list ]

set syndb(min,min,type) "TCLCMD"
set syndb(min,min,hint) ""
set syndb(min,min,arglist) [list ]

set syndb(platform::shell::generic,generic,type) "TCLCMD"
set syndb(platform::shell::generic,generic,hint) "platform::shell::generic shell"
set syndb(platform::shell::generic,generic,arglist) [list ]

set syndb(re_syntax,re_syntax,type) "TCLCMD"
set syndb(re_syntax,re_syntax,hint) ""
set syndb(re_syntax,re_syntax,arglist) [list ]

set syndb(sqrt,sqrt,type) "TCLCMD"
set syndb(sqrt,sqrt,hint) ""
set syndb(sqrt,sqrt,arglist) [list ]

set syndb(tcltest::preserveCore,preserveCore,type) "TCLCMD"
set syndb(tcltest::preserveCore,preserveCore,hint) "tcltest::preserveCore ?level?"
set syndb(tcltest::preserveCore,preserveCore,arglist) [list ]

set syndb(tcl_startOfNextWord,tcl_startOfNextWord,type) "TCLCMD"
set syndb(tcl_startOfNextWord,tcl_startOfNextWord,hint) "tcl_startOfNextWord str start"
set syndb(tcl_startOfNextWord,tcl_startOfNextWord,arglist) [list ]

set syndb(round,round,type) "TCLCMD"
set syndb(round,round,hint) ""
set syndb(round,round,arglist) [list ]

set syndb(safe::interpAddToAccessPath,interpAddToAccessPath,type) "TCLCMD"
set syndb(safe::interpAddToAccessPath,interpAddToAccessPath,hint) "safe::interpAddToAccessPath slave directory"
set syndb(safe::interpAddToAccessPath,interpAddToAccessPath,arglist) [list ]

set syndb(safe::interpConfigure,interpConfigure,type) "TCLCMD"
set syndb(safe::interpConfigure,interpConfigure,hint) "safe::interpConfigure slave ?options...?"
set syndb(safe::interpConfigure,interpConfigure,arglist) [list ]

set syndb(safe::interpCreate,interpCreate,type) "TCLCMD"
set syndb(safe::interpCreate,interpCreate,hint) "safe::interpCreate ?slave? ?options...?"
set syndb(safe::interpCreate,interpCreate,arglist) [list ]

set syndb(safe::interpDelete,interpDelete,type) "TCLCMD"
set syndb(safe::interpDelete,interpDelete,hint) "safe::interpDelete slave"
set syndb(safe::interpDelete,interpDelete,arglist) [list ]

set syndb(safe::interpFindInAccessPath,interpFindInAccessPath,type) "TCLCMD"
set syndb(safe::interpFindInAccessPath,interpFindInAccessPath,hint) "safe::interpFindInAccessPath slave directory"
set syndb(safe::interpFindInAccessPath,interpFindInAccessPath,arglist) [list ]

set syndb(safe::interpInit,interpInit,type) "TCLCMD"
set syndb(safe::interpInit,interpInit,hint) "safe::interpInit slave ?options...?"
set syndb(safe::interpInit,interpInit,arglist) [list ]

set syndb(safe::setLogCmd,setLogCmd,type) "TCLCMD"
set syndb(safe::setLogCmd,setLogCmd,hint) "safe::setLogCmd ?cmd arg...? "
set syndb(safe::setLogCmd,setLogCmd,arglist) [list ]

set syndb(scan,scan,type) "TCLCMD"
set syndb(scan,scan,hint) "scan string format ?varName varName ...?"
set syndb(scan,scan,arglist) [list ]

set syndb(seek,seek,type) "TCLCMD"
set syndb(seek,seek,hint) "seek channelId offset ?origin?"
set syndb(seek,seek,arglist) [list current end start]
set syndb(seek,current,type) "TCLARG"
set syndb(seek,current,hint)  ""
set syndb(seek,current,arglist)  [list] 
set syndb(seek,end,type) "TCLARG"
set syndb(seek,end,hint)  ""
set syndb(seek,end,arglist)  [list] 
set syndb(seek,start,type) "TCLARG"
set syndb(seek,start,hint)  ""
set syndb(seek,start,arglist)  [list] 

set syndb(self,self,type) "TCLCMD"
set syndb(self,self,hint) "self (subcommand arg ... | script)"
set syndb(self,self,arglist) [list caller class filter method namespace next object target]
set syndb(self,caller,type) "TCLARG"
set syndb(self,caller,hint)  ""
set syndb(self,caller,arglist)  [list] 
set syndb(self,class,type) "TCLARG"
set syndb(self,class,hint)  ""
set syndb(self,class,arglist)  [list] 
set syndb(self,filter,type) "TCLARG"
set syndb(self,filter,hint)  ""
set syndb(self,filter,arglist)  [list] 
set syndb(self,method,type) "TCLARG"
set syndb(self,method,hint)  ""
set syndb(self,method,arglist)  [list] 
set syndb(self,namespace,type) "TCLARG"
set syndb(self,namespace,hint)  ""
set syndb(self,namespace,arglist)  [list] 
set syndb(self,next,type) "TCLARG"
set syndb(self,next,hint)  ""
set syndb(self,next,arglist)  [list] 
set syndb(self,object,type) "TCLARG"
set syndb(self,object,hint)  ""
set syndb(self,object,arglist)  [list] 
set syndb(self,target,type) "TCLARG"
set syndb(self,target,hint)  ""
set syndb(self,target,arglist)  [list] 

set syndb(set,set,type) "TCLCMD"
set syndb(set,set,hint) "set varName ?value?"
set syndb(set,set,arglist) [list ]

set syndb(sin,sin,type) "TCLCMD"
set syndb(sin,sin,hint) ""
set syndb(sin,sin,arglist) [list ]

set syndb(sinh,sinh,type) "TCLCMD"
set syndb(sinh,sinh,hint) ""
set syndb(sinh,sinh,arglist) [list ]

set syndb(socket,socket,type) "TCLCMD"
set syndb(socket,socket,hint) "socket ?options? host port | socket -server command ?options? port"
set syndb(socket,socket,arglist) [list -async -myaddr -myport -server ]
set syndb(socket,-async,type) "TCLOPT"
set syndb(socket,-async,hint)  ""
set syndb(socket,-async,arglist)  [list] 
set syndb(socket,-myaddr,type) "TCLOPT"
set syndb(socket,-myaddr,hint)  ""
set syndb(socket,-myaddr,arglist)  [list] 
set syndb(socket,-myport,type) "TCLOPT"
set syndb(socket,-myport,hint)  ""
set syndb(socket,-myport,arglist)  [list] 
set syndb(socket,-server,type) "TCLOPT"
set syndb(socket,-server,hint)  ""
set syndb(socket,-server,arglist)  [list] 


set syndb(source,source,type) "TCLCMD"
set syndb(source,source,hint) "source fileName | source -encoding encodingName fileName"
set syndb(source,source,arglist) [list -encoding]
set syndb(source,-encoding,type) "TCLARG"
set syndb(source,-encoding,hint)  ""
set syndb(source,-encoding,arglist)  [list] 

set syndb(split,split,type) "TCLCMD"
set syndb(split,split,hint) "split string ?splitChars?"
set syndb(split,split,arglist) [list ]

set syndb(tcltest::removeDirectory,removeDirectory,type) "TCLCMD"
set syndb(tcltest::removeDirectory,removeDirectory,hint) "tcltest::removeDirectory name ?directory?"
set syndb(tcltest::removeDirectory,removeDirectory,arglist) [list ]

set syndb(tcltest::removeFile,removeFile,type) "TCLCMD"
set syndb(tcltest::removeFile,removeFile,hint) "tcltest::removeFile name ?directory?"
set syndb(tcltest::removeFile,removeFile,arglist) [list ]

set syndb(tcltest::runAllTests,runAllTests,type) "TCLCMD"
set syndb(tcltest::runAllTests,runAllTests,hint) "tcltest::runAllTests"
set syndb(tcltest::runAllTests,runAllTests,arglist) [list ]

set syndb(tcltest::singleProcess,singleProcess,type) "TCLCMD"
set syndb(tcltest::singleProcess,singleProcess,hint) "tcltest::singleProcess ?boolean?"
set syndb(tcltest::singleProcess,singleProcess,arglist) [list ]

set syndb(tcltest::skip,skip,type) "TCLCMD"
set syndb(tcltest::skip,skip,hint) "tcltest::skip ?patternList?"
set syndb(tcltest::skip,skip,arglist) [list ]

set syndb(tcltest::skipDirectories,skipDirectories,type) "TCLCMD"
set syndb(tcltest::skipDirectories,skipDirectories,hint) "tcltest::skipDirectories ?patternList?"
set syndb(tcltest::skipDirectories,skipDirectories,arglist) [list ]

set syndb(tcltest::skipFiles,skipFiles,type) "TCLCMD"
set syndb(tcltest::skipFiles,skipFiles,hint) "tcltest::skipFiles ?patternList?"
set syndb(tcltest::skipFiles,skipFiles,arglist) [list ]

set syndb(tcltest::temporaryDirectory,temporaryDirectory,type) "TCLCMD"
set syndb(tcltest::temporaryDirectory,temporaryDirectory,hint) "tcltest::temporaryDirectory ?directory?"
set syndb(tcltest::temporaryDirectory,temporaryDirectory,arglist) [list ]

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

set syndb(tcltest::testConstraint,testConstraint,type) "TCLCMD"
set syndb(tcltest::testConstraint,testConstraint,hint) "tcltest::testConstraint constraint ?value?"
set syndb(tcltest::testConstraint,testConstraint,arglist) [list ]

set syndb(tcltest::testsDirectory,testsDirectory,type) "TCLCMD"
set syndb(tcltest::testsDirectory,testsDirectory,hint) "tcltest::testsDirectory ?directory?"
set syndb(tcltest::testsDirectory,testsDirectory,arglist) [list ]

set syndb(tcltest::verbose,verbose,type) "TCLCMD"
set syndb(tcltest::verbose,verbose,hint) "tcltest::verbose ?level?"
set syndb(tcltest::verbose,verbose,arglist) [list ]

set syndb(tcltest::viewFile,viewFile,type) "TCLCMD"
set syndb(tcltest::viewFile,viewFile,hint) "tcltest::viewFile name ?directory?"
set syndb(tcltest::viewFile,viewFile,arglist) [list ]

set syndb(tcltest::workingDirectory,workingDirectory,type) "TCLCMD"
set syndb(tcltest::workingDirectory,workingDirectory,hint) "tcltest::workingDirectory ?dir?"
set syndb(tcltest::workingDirectory,workingDirectory,arglist) [list ]

set syndb(tcl_endOfWord,tcl_endOfWord,type) "TCLCMD"
set syndb(tcl_endOfWord,tcl_endOfWord,hint) "tcl_endOfWord str start"
set syndb(tcl_endOfWord,tcl_endOfWord,arglist) [list ]

set syndb(tcl_findLibrary,tcl_findLibrary,type) "TCLCMD"
set syndb(tcl_findLibrary,tcl_findLibrary,hint) "tcl_findLibrary basename version patch initScript enVarName varName"
set syndb(tcl_findLibrary,tcl_findLibrary,arglist) [list ]

set syndb(lassign,lassign,type) "TCLCMD"
set syndb(lassign,lassign,hint) "lassign list varName ?varName ...?"
set syndb(lassign,lassign,arglist) [list ]

set syndb(lindex,lindex,type) "TCLCMD"
set syndb(lindex,lindex,hint) "lindex list ?index...?"
set syndb(lindex,lindex,arglist) [list ]

set syndb(linsert,linsert,type) "TCLCMD"
set syndb(linsert,linsert,hint) "linsert list index element ?element element ...?"
set syndb(linsert,linsert,arglist) [list ]

set syndb(list,list,type) "TCLCMD"
set syndb(list,list,hint) "list ?arg arg ...?"
set syndb(list,list,arglist) [list ]

set syndb(llength,llength,type) "TCLCMD"
set syndb(llength,llength,hint) "llength list"
set syndb(llength,llength,arglist) [list ]

set syndb(load,load,type) "TCLCMD"
set syndb(load,load,hint) "load ( fileName | fileName packageName | fileName packageName interp)"
set syndb(load,load,arglist) [list ]

set syndb(log,log,type) "TCLCMD"
set syndb(log,log,hint) ""
set syndb(log,log,arglist) [list ]

set syndb(log10,log10,type) "TCLCMD"
set syndb(log10,log10,hint) ""
set syndb(log10,log10,arglist) [list ]

set syndb(lrange,lrange,type) "TCLCMD"
set syndb(lrange,lrange,hint) "lrange list first last"
set syndb(lrange,lrange,arglist) [list ]

set syndb(lrepeat,lrepeat,type) "TCLCMD"
set syndb(lrepeat,lrepeat,hint) "lrepeat number element1 ?element2 element3 ...?"
set syndb(lrepeat,lrepeat,arglist) [list ]

set syndb(lreplace,lreplace,type) "TCLCMD"
set syndb(lreplace,lreplace,hint) "lreplace list first last ?element element ...?"
set syndb(lreplace,lreplace,arglist) [list ]

set syndb(lreverse,lreverse,type) "TCLCMD"
set syndb(lreverse,lreverse,hint) "lreverse list"
set syndb(lreverse,lreverse,arglist) [list ]

set syndb(lsearch,lsearch,type) "TCLCMD"
set syndb(lsearch,lsearch,hint) "lsearch ?options? list pattern "
set syndb(lsearch,lsearch,arglist) [list -all -ascii -decreasing -dictionary -exact -glob -increasing -inline -integer -not -real -regexp -sorted -start]
set syndb(lsearch,-all,type) "TCLARG"
set syndb(lsearch,-all,hint)  ""
set syndb(lsearch,-all,arglist)  [list] 
set syndb(lsearch,-ascii,type) "TCLARG"
set syndb(lsearch,-ascii,hint)  ""
set syndb(lsearch,-ascii,arglist)  [list] 
set syndb(lsearch,-decreasing,type) "TCLARG"
set syndb(lsearch,-decreasing,hint)  ""
set syndb(lsearch,-decreasing,arglist)  [list] 
set syndb(lsearch,-dictionary,type) "TCLARG"
set syndb(lsearch,-dictionary,hint)  ""
set syndb(lsearch,-dictionary,arglist)  [list] 
set syndb(lsearch,-exact,type) "TCLARG"
set syndb(lsearch,-exact,hint)  ""
set syndb(lsearch,-exact,arglist)  [list] 
set syndb(lsearch,-glob,type) "TCLARG"
set syndb(lsearch,-glob,hint)  ""
set syndb(lsearch,-glob,arglist)  [list] 
set syndb(lsearch,-increasing,type) "TCLARG"
set syndb(lsearch,-increasing,hint)  ""
set syndb(lsearch,-increasing,arglist)  [list] 
set syndb(lsearch,-inline,type) "TCLARG"
set syndb(lsearch,-inline,hint)  ""
set syndb(lsearch,-inline,arglist)  [list] 
set syndb(lsearch,-integer,type) "TCLARG"
set syndb(lsearch,-integer,hint)  ""
set syndb(lsearch,-integer,arglist)  [list] 
set syndb(lsearch,-not,type) "TCLARG"
set syndb(lsearch,-not,hint)  ""
set syndb(lsearch,-not,arglist)  [list] 
set syndb(lsearch,-real,type) "TCLARG"
set syndb(lsearch,-real,hint)  ""
set syndb(lsearch,-real,arglist)  [list] 
set syndb(lsearch,-regexp,type) "TCLARG"
set syndb(lsearch,-regexp,hint)  ""
set syndb(lsearch,-regexp,arglist)  [list] 
set syndb(lsearch,-sorted,type) "TCLARG"
set syndb(lsearch,-sorted,hint)  ""
set syndb(lsearch,-sorted,arglist)  [list] 
set syndb(lsearch,-start,type) "TCLARG"
set syndb(lsearch,-start,hint)  ""
set syndb(lsearch,-start,arglist)  [list] 

set syndb(lset,lset,type) "TCLCMD"
set syndb(lset,lset,hint) "lset varName ?index...? newValue"
set syndb(lset,lset,arglist) [list ]

set syndb(lsort,lsort,type) "TCLCMD"
set syndb(lsort,lsort,hint) "lsort ?options? list "
set syndb(lsort,lsort,arglist) [list -ascii -command -decreasing -dictionary -increasing -index -integer -real -unique]
set syndb(lsort,-ascii,type) "TCLARG"
set syndb(lsort,-ascii,hint)  ""
set syndb(lsort,-ascii,arglist)  [list] 
set syndb(lsort,-command,type) "TCLARG"
set syndb(lsort,-command,hint)  ""
set syndb(lsort,-command,arglist)  [list] 
set syndb(lsort,-decreasing,type) "TCLARG"
set syndb(lsort,-decreasing,hint)  ""
set syndb(lsort,-decreasing,arglist)  [list] 
set syndb(lsort,-dictionary,type) "TCLARG"
set syndb(lsort,-dictionary,hint)  ""
set syndb(lsort,-dictionary,arglist)  [list] 
set syndb(lsort,-increasing,type) "TCLARG"
set syndb(lsort,-increasing,hint)  ""
set syndb(lsort,-increasing,arglist)  [list] 
set syndb(lsort,-index,type) "TCLARG"
set syndb(lsort,-index,hint)  ""
set syndb(lsort,-index,arglist)  [list] 
set syndb(lsort,-integer,type) "TCLARG"
set syndb(lsort,-integer,hint)  ""
set syndb(lsort,-integer,arglist)  [list] 
set syndb(lsort,-real,type) "TCLARG"
set syndb(lsort,-real,hint)  ""
set syndb(lsort,-real,arglist)  [list] 
set syndb(lsort,-unique,type) "TCLARG"
set syndb(lsort,-unique,hint)  ""
set syndb(lsort,-unique,arglist)  [list] 

set syndb(max,max,type) "TCLCMD"
set syndb(max,max,hint) ""
set syndb(max,max,arglist) [list ]

set syndb(memory,memory,type) "TCLCMD"
set syndb(memory,memory,hint) "memory option ?arg arg ...?"
set syndb(memory,memory,arglist) [list active break_on_malloc info init onexit tag trace trace_on_at_malloc validate]
set syndb(memory,active,type) "TCLARG"
set syndb(memory,active,hint)  "memory active file"
set syndb(memory,active,arglist)  [list] 
set syndb(memory,break_on_malloc,type) "TCLARG"
set syndb(memory,break_on_malloc,hint)  "memory break_on_malloc count"
set syndb(memory,break_on_malloc,arglist)  [list] 
set syndb(memory,info,type) "TCLARG"
set syndb(memory,info,hint)  "memory info"
set syndb(memory,info,arglist)  [list] 
set syndb(memory,init,type) "TCLARG"
set syndb(memory,init,hint)  "memory init (on|off)"
set syndb(memory,init,arglist)  [list] 
set syndb(memory,onexit,type) "TCLARG"
set syndb(memory,onexit,hint)  "memory onexit file"
set syndb(memory,onexit,arglist)  [list] 
set syndb(memory,tag,type) "TCLARG"
set syndb(memory,tag,hint)  "memory tag string"
set syndb(memory,tag,arglist)  [list] 
set syndb(memory,trace,type) "TCLARG"
set syndb(memory,trace,hint)  "memory trace (on|off)"
set syndb(memory,trace,arglist)  [list] 
set syndb(memory,trace_on_at_malloc,type) "TCLARG"
set syndb(memory,trace_on_at_malloc,hint)  "memory trace_on_at_malloc count"
set syndb(memory,trace_on_at_malloc,arglist)  [list] 
set syndb(memory,validate,type) "TCLARG"
set syndb(memory,validate,hint)  "memory validate (on|off)"
set syndb(memory,validate,arglist)  [list] 

set syndb(method,method,type) "TCLCMD"
set syndb(method,method,hint) "method name argList bodyScript"
set syndb(method,method,arglist) [list ]

set syndb(mixin,mixin,type) "TCLCMD"
set syndb(mixin,mixin,hint) "mixin ?className ...?"
set syndb(mixin,mixin,arglist) [list ]

set syndb(msgcat::mc,mc,type) "TCLCMD"
set syndb(msgcat::mc,mc,hint) "msgcat::mc src-string ?arg arg ...?"
set syndb(msgcat::mc,mc,arglist) [list ]

set syndb(msgcat::mcload,mcload,type) "TCLCMD"
set syndb(msgcat::mcload,mcload,hint) "msgcat::mcload dirname"
set syndb(msgcat::mcload,mcload,arglist) [list ]

set syndb(msgcat::mclocale,mclocale,type) "TCLCMD"
set syndb(msgcat::mclocale,mclocale,hint) "msgcat::mclocale ?newLocale?"
set syndb(msgcat::mclocale,mclocale,arglist) [list ]

set syndb(msgcat::mcmax,mcmax,type) "TCLCMD"
set syndb(msgcat::mcmax,mcmax,hint) "msgcat::mcmax ?src-string src-string ...?"
set syndb(msgcat::mcmax,mcmax,arglist) [list ]

set syndb(msgcat::mcmset,mcmset,type) "TCLCMD"
set syndb(msgcat::mcmset,mcmset,hint) "msgcat::mcmset locale src-trans-list"
set syndb(msgcat::mcmset,mcmset,arglist) [list ]

set syndb(msgcat::mcreferences,mcreferences,type) "TCLCMD"
set syndb(msgcat::mcreferences,mcreferences,hint) ""
set syndb(msgcat::mcreferences,mcreferences,arglist) [list ]

set syndb(msgcat::mcset,mcset,type) "TCLCMD"
set syndb(msgcat::mcset,mcset,hint) "msgcat::mcset locale src-string ?translate-string?"
set syndb(msgcat::mcset,mcset,arglist) [list ]

set syndb(msgcat::mcunknown,mcunknown,type) "TCLCMD"
set syndb(msgcat::mcunknown,mcunknown,hint) "msgcat::mcunknown locale src-string"
set syndb(msgcat::mcunknown,mcunknown,arglist) [list ]

set syndb(my,my,type) "TCLCMD"
set syndb(my,my,hint) "my methodName ?arg ...?"
set syndb(my,my,arglist) [list ]

set syndb(namespace,namespace,type) "TCLCMD"
set syndb(namespace,namespace,hint) "namespace ?subcommand? ?arg ...?"
set syndb(namespace,namespace,arglist) [list children code current delete eval exists export forget import inscope origin parent qualifiers tail which]
set syndb(namespace,children,type) "TCLARG"
set syndb(namespace,children,hint)  "namespace children ?namespace? ?pattern?"
set syndb(namespace,children,arglist)  [list] 
set syndb(namespace,code,type) "TCLARG"
set syndb(namespace,code,hint)  "namespace code script"
set syndb(namespace,code,arglist)  [list] 
set syndb(namespace,current,type) "TCLARG"
set syndb(namespace,current,hint)  "namespace current"
set syndb(namespace,current,arglist)  [list] 
set syndb(namespace,delete,type) "TCLARG"
set syndb(namespace,delete,hint)  "namespace delete ?namespace namespace ...?"
set syndb(namespace,delete,arglist)  [list] 
set syndb(namespace,eval,type) "TCLARG"
set syndb(namespace,eval,hint)  "namespace eval namespace arg ?arg ...?"
set syndb(namespace,eval,arglist)  [list] 
set syndb(namespace,exists,type) "TCLARG"
set syndb(namespace,exists,hint)  "namespace exists namespace"
set syndb(namespace,exists,arglist)  [list] 
set syndb(namespace,export,type) "TCLARG"
set syndb(namespace,export,hint)  "namespace export ?-clear? ?pattern pattern ...?"
set syndb(namespace,export,arglist)  [list] 
set syndb(namespace,forget,type) "TCLARG"
set syndb(namespace,forget,hint)  "namespace forget ?pattern pattern ...?"
set syndb(namespace,forget,arglist)  [list] 
set syndb(namespace,import,type) "TCLARG"
set syndb(namespace,import,hint)  "namespace import ?-force? ?pattern pattern ...?"
set syndb(namespace,import,arglist)  [list] 
set syndb(namespace,inscope,type) "TCLARG"
set syndb(namespace,inscope,hint)  "namespace inscope namespace script ?arg ...?"
set syndb(namespace,inscope,arglist)  [list] 
set syndb(namespace,origin,type) "TCLARG"
set syndb(namespace,origin,hint)  "namespace origin command"
set syndb(namespace,origin,arglist)  [list] 
set syndb(namespace,parent,type) "TCLARG"
set syndb(namespace,parent,hint)  "namespace parent ?namespace?"
set syndb(namespace,parent,arglist)  [list] 
set syndb(namespace,qualifiers,type) "TCLARG"
set syndb(namespace,qualifiers,hint)  "namespace qualifiers string"
set syndb(namespace,qualifiers,arglist)  [list] 
set syndb(namespace,tail,type) "TCLARG"
set syndb(namespace,tail,hint)  "namespace tail string"
set syndb(namespace,tail,arglist)  [list] 
set syndb(namespace,which,type) "TCLARG"
set syndb(namespace,which,hint)  "namespace which ?-command? ?-variable? name"
set syndb(namespace,which,arglist)  [list] 

set syndb(next,next,type) "TCLCMD"
set syndb(next,next,hint) ""
set syndb(next,next,arglist) [list ]

set syndb(oo::class,class,type) "TCLCMD"
set syndb(oo::class,class,hint) "oo::class method ?arg ...?"
set syndb(oo::class,class,arglist) [list create]
set syndb(oo::class,create,type) "TCLARG"
set syndb(oo::class,create,hint)  ""
set syndb(oo::class,create,arglist)  [list] 

set syndb(oo::copy,copy,type) "TCLCMD"
set syndb(oo::copy,copy,hint) "oo::copy sourceObject ?targetObject?"
set syndb(oo::copy,copy,arglist) [list ]

set syndb(oo::define,define,type) "TCLCMD"
set syndb(oo::define,define,hint) "oo::define (class defScript | class subcommand arg ?arg ...?)"
set syndb(oo::define,define,arglist) [list constructor deletemethod destructor export filter forward method mixin renamemethod self superclass unexport variable]
set syndb(oo::define,constructor,type) "TCLARG"
set syndb(oo::define,constructor,hint)  "constructor argList bodyScript"
set syndb(oo::define,constructor,arglist)  [list] 
set syndb(oo::define,deletemethod,type) "TCLARG"
set syndb(oo::define,deletemethod,hint)  "deletemethod name ?name ..."
set syndb(oo::define,deletemethod,arglist)  [list] 
set syndb(oo::define,destructor,type) "TCLARG"
set syndb(oo::define,destructor,hint)  "destructor bodyScript"
set syndb(oo::define,destructor,arglist)  [list] 
set syndb(oo::define,export,type) "TCLARG"
set syndb(oo::define,export,hint)  "export name ?name ...?"
set syndb(oo::define,export,arglist)  [list] 
set syndb(oo::define,filter,type) "TCLARG"
set syndb(oo::define,filter,hint)  "filter ?methodName ...?"
set syndb(oo::define,filter,arglist)  [list] 
set syndb(oo::define,forward,type) "TCLARG"
set syndb(oo::define,forward,hint)  "forward name cmdName ?arg ...?"
set syndb(oo::define,forward,arglist)  [list] 
set syndb(oo::define,method,type) "TCLARG"
set syndb(oo::define,method,hint)  "method name argList bodyScript"
set syndb(oo::define,method,arglist)  [list] 
set syndb(oo::define,mixin,type) "TCLARG"
set syndb(oo::define,mixin,hint)  "mixin ?className ...?"
set syndb(oo::define,mixin,arglist)  [list] 
set syndb(oo::define,renamemethod,type) "TCLARG"
set syndb(oo::define,renamemethod,hint)  "renamemethod fromName toName"
set syndb(oo::define,renamemethod,arglist)  [list] 
set syndb(oo::define,self,type) "TCLARG"
set syndb(oo::define,self,hint)  "self (subcommand arg ... | script)"
set syndb(oo::define,self,arglist)  [list] 
set syndb(oo::define,superclass,type) "TCLARG"
set syndb(oo::define,superclass,hint)  "superclass className ?className ...?"
set syndb(oo::define,superclass,arglist)  [list] 
set syndb(oo::define,unexport,type) "TCLARG"
set syndb(oo::define,unexport,hint)  "unexport name ?name ...?"
set syndb(oo::define,unexport,arglist)  [list] 
set syndb(oo::define,variable,type) "TCLARG"
set syndb(oo::define,variable,hint)  "variable ?name ...?"
set syndb(oo::define,variable,arglist)  [list] 

set syndb(oo::objdefine,objdefine,type) "TCLCMD"
set syndb(oo::objdefine,objdefine,hint) "oo::define (class defScript | class subcommand arg ?arg ...?)"
set syndb(oo::objdefine,objdefine,arglist) [list class deletemethod export filter forward method mixin renamemethod unexport variable]
set syndb(oo::objdefine,class,type) "TCLARG"
set syndb(oo::objdefine,class,hint)  "class className"
set syndb(oo::objdefine,class,arglist)  [list] 
set syndb(oo::objdefine,deletemethod,type) "TCLARG"
set syndb(oo::objdefine,deletemethod,hint)  "deletemethod name ?name ..."
set syndb(oo::objdefine,deletemethod,arglist)  [list] 
set syndb(oo::objdefine,export,type) "TCLARG"
set syndb(oo::objdefine,export,hint)  "export name ?name ...?"
set syndb(oo::objdefine,export,arglist)  [list] 
set syndb(oo::objdefine,filter,type) "TCLARG"
set syndb(oo::objdefine,filter,hint)  "filter ?methodName ...?"
set syndb(oo::objdefine,filter,arglist)  [list] 
set syndb(oo::objdefine,forward,type) "TCLARG"
set syndb(oo::objdefine,forward,hint)  "forward name cmdName ?arg ...?"
set syndb(oo::objdefine,forward,arglist)  [list] 
set syndb(oo::objdefine,method,type) "TCLARG"
set syndb(oo::objdefine,method,hint)  "method name argList bodyScript"
set syndb(oo::objdefine,method,arglist)  [list] 
set syndb(oo::objdefine,mixin,type) "TCLARG"
set syndb(oo::objdefine,mixin,hint)  "mixin ?className ...?"
set syndb(oo::objdefine,mixin,arglist)  [list] 
set syndb(oo::objdefine,renamemethod,type) "TCLARG"
set syndb(oo::objdefine,renamemethod,hint)  "renamemethod fromName toName"
set syndb(oo::objdefine,renamemethod,arglist)  [list] 
set syndb(oo::objdefine,unexport,type) "TCLARG"
set syndb(oo::objdefine,unexport,hint)  "unexport name ?name ...?"
set syndb(oo::objdefine,unexport,arglist)  [list] 
set syndb(oo::objdefine,variable,type) "TCLARG"
set syndb(oo::objdefine,variable,hint)  "variable ?name ...?"
set syndb(oo::objdefine,variable,arglist)  [list] 

set syndb(oo::object,object,type) "TCLCMD"
set syndb(oo::object,object,hint) "oo::object method ?arg ...?"
set syndb(oo::object,object,arglist) [list new]
set syndb(oo::object,new,type) "TCLARG"
set syndb(oo::object,new,hint)  ""
set syndb(oo::object,new,arglist)  [list] 

set syndb(open,open,type) "TCLCMD"
set syndb(open,open,hint) "open (fileName | fileName access | fileName access permissions)"
set syndb(open,open,arglist) [list ]

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

set syndb(parray,parray,type) "TCLCMD"
set syndb(parray,parray,hint) "parray arrayName"
set syndb(parray,parray,arglist) [list ]

set syndb(pid,pid,type) "TCLCMD"
set syndb(pid,pid,hint) "pid ?fileId?"
set syndb(pid,pid,arglist) [list ]

set syndb(pkg,pkg,type) "TCLCMD"
set syndb(pkg,pkg,hint) ""
set syndb(pkg,pkg,arglist) [list -load -name -source -version]
set syndb(pkg,-load,type) "TCLARG"
set syndb(pkg,-load,hint)  ""
set syndb(pkg,-load,arglist)  [list] 
set syndb(pkg,-name,type) "TCLARG"
set syndb(pkg,-name,hint)  ""
set syndb(pkg,-name,arglist)  [list] 
set syndb(pkg,-source,type) "TCLARG"
set syndb(pkg,-source,hint)  ""
set syndb(pkg,-source,arglist)  [list] 
set syndb(pkg,-version,type) "TCLARG"
set syndb(pkg,-version,hint)  ""
set syndb(pkg,-version,arglist)  [list] 

set syndb(pkg_mkIndex,pkg_mkIndex,type) "TCLCMD"
set syndb(pkg_mkIndex,pkg_mkIndex,hint) "pkg_mkIndex ?-direct? ?-lazy? ?-load pkgPat? ?-verbose? dir ?pattern pattern ...?"
set syndb(pkg_mkIndex,pkg_mkIndex,arglist) [list -direct -lazy -load -verbose]
set syndb(pkg_mkIndex,-direct,type) "TCLARG"
set syndb(pkg_mkIndex,-direct,hint)  ""
set syndb(pkg_mkIndex,-direct,arglist)  [list] 
set syndb(pkg_mkIndex,-lazy,type) "TCLARG"
set syndb(pkg_mkIndex,-lazy,hint)  ""
set syndb(pkg_mkIndex,-lazy,arglist)  [list] 
set syndb(pkg_mkIndex,-load,type) "TCLARG"
set syndb(pkg_mkIndex,-load,hint)  ""
set syndb(pkg_mkIndex,-load,arglist)  [list] 
set syndb(pkg_mkIndex,-verbose,type) "TCLARG"
set syndb(pkg_mkIndex,-verbose,hint)  ""
set syndb(pkg_mkIndex,-verbose,arglist)  [list] 

set syndb(platform::generic,generic,type) "TCLCMD"
set syndb(platform::generic,generic,hint) "platform::generic"
set syndb(platform::generic,generic,arglist) [list ]

set syndb(platform::identify,identify,type) "TCLCMD"
set syndb(platform::identify,identify,hint) "platform::identify"
set syndb(platform::identify,identify,arglist) [list ]

set syndb(platform::patterns,patterns,type) "TCLCMD"
set syndb(platform::patterns,patterns,hint) "platform::patterns identifier"
set syndb(platform::patterns,patterns,arglist) [list ]

set syndb(eof,eof,type) "TCLCMD"
set syndb(eof,eof,hint) "eof channelId"
set syndb(eof,eof,arglist) [list ]

set syndb(error,error,type) "TCLCMD"
set syndb(error,error,hint) "error message ?info? ?code?"
set syndb(error,error,arglist) [list ]

set syndb(eval,eval,type) "TCLCMD"
set syndb(eval,eval,hint) "eval arg ?arg ...?"
set syndb(eval,eval,arglist) [list ]

set syndb(exec,exec,type) "TCLCMD"
set syndb(exec,exec,hint) "exec ?switches? arg ?arg ...?"
set syndb(exec,exec,arglist) [list ]

set syndb(exit,exit,type) "TCLCMD"
set syndb(exit,exit,hint) "exit ?returnCode?"
set syndb(exit,exit,arglist) [list ]

set syndb(exp,exp,type) "TCLCMD"
set syndb(exp,exp,hint) ""
set syndb(exp,exp,arglist) [list ]

set syndb(export,export,type) "TCLCMD"
set syndb(export,export,hint) "export name ?name ...?"
set syndb(export,export,arglist) [list ]

set syndb(expr,expr,type) "TCLCMD"
set syndb(expr,expr,hint) "expr arg ?arg arg ...?"
set syndb(expr,expr,arglist) [list ]

set syndb(fblocked,fblocked,type) "TCLCMD"
set syndb(fblocked,fblocked,hint) "fblocked channelId"
set syndb(fblocked,fblocked,arglist) [list ]

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

set syndb(fcopy,fcopy,type) "TCLCMD"
set syndb(fcopy,fcopy,hint) "fcopy inchan outchan ?-size size? ?-command callback?"
set syndb(fcopy,fcopy,arglist) [list -command -size]
set syndb(fcopy,-command,type) "TCLARG"
set syndb(fcopy,-command,hint)  ""
set syndb(fcopy,-command,arglist)  [list] 
set syndb(fcopy,-size,type) "TCLARG"
set syndb(fcopy,-size,hint)  ""
set syndb(fcopy,-size,arglist)  [list] 

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

set syndb(fileevent,fileevent,type) "TCLCMD"
set syndb(fileevent,fileevent,hint) "fileevent channelId (readable ?script? | writable ?script?)"
set syndb(fileevent,fileevent,arglist) [list ]
set syndb(fileevent,fileevent,colorlist) [list readable writable]
set syndb(fileevent,fileevent,colortype) "TCLOPT"


set syndb(filename,filename,type) "TCLCMD"
set syndb(filename,filename,hint) ""
set syndb(filename,filename,arglist) [list ]

set syndb(filter,filter,type) "TCLCMD"
set syndb(filter,filter,hint) "filter ?methodName ...?"
set syndb(filter,filter,arglist) [list ]

set syndb(floor,floor,type) "TCLCMD"
set syndb(floor,floor,hint) ""
set syndb(floor,floor,arglist) [list ]

set syndb(flush,flush,type) "TCLCMD"
set syndb(flush,flush,hint) "flush channelId"
set syndb(flush,flush,arglist) [list ]

set syndb(fmod,fmod,type) "TCLCMD"
set syndb(fmod,fmod,hint) ""
set syndb(fmod,fmod,arglist) [list ]

set syndb(for,for,type) "TCLCMD"
set syndb(for,for,hint) "for start test next body"
set syndb(for,for,arglist) [list ]

set syndb(foreach,foreach,type) "TCLCMD"
set syndb(foreach,foreach,hint) "foreach varlist1 list1 ?varlist2 list2 ...? body"
set syndb(foreach,foreach,arglist) [list ]

set syndb(format,format,type) "TCLCMD"
set syndb(format,format,hint) "format formatString ?arg arg ...?"
set syndb(format,format,arglist) [list ]

set syndb(forward,forward,type) "TCLCMD"
set syndb(forward,forward,hint) "forward name cmdName ?arg ...?"
set syndb(forward,forward,arglist) [list ]

set syndb(gets,gets,type) "TCLCMD"
set syndb(gets,gets,hint) "gets channelId ?varName?"
set syndb(gets,gets,arglist) [list ]

set syndb(glob,glob,type) "TCLCMD"
set syndb(glob,glob,hint) "glob ?switches? pattern ?pattern ...?"
set syndb(glob,glob,arglist) [list -directory -join -nocomplain -path -tails -types]
set syndb(glob,-directory,type) "TCLOPT"
set syndb(glob,-directory,hint)  ""
set syndb(glob,-directory,arglist)  [list] 
set syndb(glob,-join,type) "TCLOPT"
set syndb(glob,-join,hint)  ""
set syndb(glob,-join,arglist)  [list] 
set syndb(glob,-nocomplain,type) "TCLOPT"
set syndb(glob,-nocomplain,hint)  ""
set syndb(glob,-nocomplain,arglist)  [list] 
set syndb(glob,-path,type) "TCLOPT"
set syndb(glob,-path,hint)  ""
set syndb(glob,-path,arglist)  [list] 
set syndb(glob,-tails,type) "TCLOPT"
set syndb(glob,-tails,hint)  ""
set syndb(glob,-tails,arglist)  [list] 
set syndb(glob,-types,type) "TCLOPT"
set syndb(glob,-types,hint)  ""
set syndb(glob,-types,arglist)  [list] 

set syndb(global,global,type) "TCLCMD"
set syndb(global,global,hint) "global varname ?varname ...?"
set syndb(global,global,arglist) [list ]

set syndb(history,history,type) "TCLCMD"
set syndb(history,history,hint) "history ?option? ?arg arg ...?"
set syndb(history,history,arglist) [list add change clear event info keep nextid redo]
set syndb(history,add,type) "TCLARG"
set syndb(history,add,hint)  "history add command ?exec?"
set syndb(history,add,arglist)  [list] 
set syndb(history,change,type) "TCLARG"
set syndb(history,change,hint)  "history change newValue ?event?"
set syndb(history,change,arglist)  [list] 
set syndb(history,clear,type) "TCLARG"
set syndb(history,clear,hint)  "history clear"
set syndb(history,clear,arglist)  [list] 
set syndb(history,event,type) "TCLARG"
set syndb(history,event,hint)  "history event ?event?"
set syndb(history,event,arglist)  [list] 
set syndb(history,info,type) "TCLARG"
set syndb(history,info,hint)  "history info ?count?"
set syndb(history,info,arglist)  [list] 
set syndb(history,keep,type) "TCLARG"
set syndb(history,keep,hint)  "history keep ?count?"
set syndb(history,keep,arglist)  [list] 
set syndb(history,nextid,type) "TCLARG"
set syndb(history,nextid,hint)  "history nextid"
set syndb(history,nextid,arglist)  [list] 
set syndb(history,redo,type) "TCLARG"
set syndb(history,redo,hint)  "history redo ?event?"
set syndb(history,redo,arglist)  [list] 

set syndb(http::cleanup,cleanup,type) "TCLCMD"
set syndb(http::cleanup,cleanup,hint) "http::cleanup token"
set syndb(http::cleanup,cleanup,arglist) [list ]

set syndb(http::code,code,type) "TCLCMD"
set syndb(http::code,code,hint) "http::code token"
set syndb(http::code,code,arglist) [list ]

set syndb(http::config,config,type) "TCLCMD"
set syndb(http::config,config,hint) "http::config ?options?"
set syndb(http::config,config,arglist) [list -accept -proxyhost -proxyport -proxyfilter -urlencoding -useragent]



set syndb(http::data,data,type) "TCLCMD"
set syndb(http::data,data,hint) "http::data token"
set syndb(http::data,data,arglist) [list ]

set syndb(tcl_startOfPreviousWord,tcl_startOfPreviousWord,type) "TCLCMD"
set syndb(tcl_startOfPreviousWord,tcl_startOfPreviousWord,hint) "tcl_startOfPreviousWord str start"
set syndb(tcl_startOfPreviousWord,tcl_startOfPreviousWord,arglist) [list ]

set syndb(tcl_wordBreakAfter,tcl_wordBreakAfter,type) "TCLCMD"
set syndb(tcl_wordBreakAfter,tcl_wordBreakAfter,hint) "tcl_wordBreakAfter str start"
set syndb(tcl_wordBreakAfter,tcl_wordBreakAfter,arglist) [list ]

set syndb(tcl_wordBreakBefore,tcl_wordBreakBefore,type) "TCLCMD"
set syndb(tcl_wordBreakBefore,tcl_wordBreakBefore,hint) "tcl_wordBreakBefore str start "
set syndb(tcl_wordBreakBefore,tcl_wordBreakBefore,arglist) [list ]

set syndb(tell,tell,type) "TCLCMD"
set syndb(tell,tell,hint) "tell channelId"
set syndb(tell,tell,arglist) [list ]

set syndb(throw,throw,type) "TCLCMD"
set syndb(throw,throw,hint) "throw type message"
set syndb(throw,throw,arglist) [list ]

set syndb(time,time,type) "TCLCMD"
set syndb(time,time,hint) "time script ?count?"
set syndb(time,time,arglist) [list ]

set syndb(trace,trace,type) "TCLCMD"
set syndb(trace,trace,hint) "trace option ?arg arg ...?"
set syndb(trace,trace,arglist) [list add info remove variable vdelete vinfo]
set syndb(trace,add,type) "TCLARG"
set syndb(trace,add,hint)  "trace add type name ops ?args?"
set syndb(trace,add,arglist)  [list] 
set syndb(trace,info,type) "TCLARG"
set syndb(trace,info,hint)  "trace info type name"
set syndb(trace,info,arglist)  [list] 
set syndb(trace,remove,type) "TCLARG"
set syndb(trace,remove,hint)  "trace remove type name opList commandPrefix"
set syndb(trace,remove,arglist)  [list] 
set syndb(trace,variable,type) "TCLARG"
set syndb(trace,variable,hint)  "trace variable name ops command"
set syndb(trace,variable,arglist)  [list] 
set syndb(trace,vdelete,type) "TCLARG"
set syndb(trace,vdelete,hint)  "trace vdelete name ops command"
set syndb(trace,vdelete,arglist)  [list] 
set syndb(trace,vinfo,type) "TCLARG"
set syndb(trace,vinfo,hint)  "trace vinfo name"
set syndb(trace,vinfo,arglist)  [list] 

set syndb(try,try,type) "TCLCMD"
set syndb(try,try,hint) "try body ?handler...? ?finally script?"
set syndb(try,try,arglist) [list finally on trap]
set syndb(try,finally,type) "TCLARG"
set syndb(try,finally,hint)  ""
set syndb(try,finally,arglist)  [list] 
set syndb(try,on,type) "TCLARG"
set syndb(try,on,hint)  ""
set syndb(try,on,arglist)  [list] 
set syndb(try,trap,type) "TCLARG"
set syndb(try,trap,hint)  ""
set syndb(try,trap,arglist)  [list] 

set syndb(unexport,unexport,type) "TCLCMD"
set syndb(unexport,unexport,hint) "unexport name ?name ...?"
set syndb(unexport,unexport,arglist) [list ]

set syndb(unknown,unknown,type) "TCLCMD"
set syndb(unknown,unknown,hint) "unknown cmdName ?arg arg ...?"
set syndb(unknown,unknown,arglist) [list ]

set syndb(unset,unset,type) "TCLCMD"
set syndb(unset,unset,hint) "unset ?-nocomplain? ?--? ?name name name ...?"
set syndb(unset,unset,arglist) [list ]

set syndb(update,update,type) "TCLCMD"
set syndb(update,update,hint) "update ?idletasks?"
set syndb(update,update,arglist) [list idletasks]
set syndb(update,idletasks,type) "TCLARG"
set syndb(update,idletasks,hint)  ""
set syndb(update,idletasks,arglist)  [list] 

set syndb(uplevel,uplevel,type) "TCLCMD"
set syndb(uplevel,uplevel,hint) "uplevel ?level? arg ?arg ...?"
set syndb(uplevel,uplevel,arglist) [list ]

set syndb(upvar,upvar,type) "TCLCMD"
set syndb(upvar,upvar,hint) "upvar ?level? otherVar myVar ?otherVar myVar ...?"
set syndb(upvar,upvar,arglist) [list ]

set syndb(variable,variable,type) "TCLCMD"
set syndb(variable,variable,hint) "variable ?name ...?"
set syndb(variable,variable,arglist) [list ]

set syndb(vwait,vwait,type) "TCLCMD"
set syndb(vwait,vwait,hint) "vwait varName"
set syndb(vwait,vwait,arglist) [list ]

set syndb(while,while,type) "TCLCMD"
set syndb(while,while,hint) "while test body"
set syndb(while,while,arglist) [list ]

set syndb(wide,wide,type) "TCLCMD"
set syndb(wide,wide,hint) ""
set syndb(wide,wide,arglist) [list ]

set syndb(zlib,zlib,type) "TCLCMD"
set syndb(zlib,zlib,hint) "zlib subcommand arg ..."
set syndb(zlib,zlib,arglist) [list adler32 compress crc32 decompress deflate gunzip gzip inflate push stream]
set syndb(zlib,adler32,type) "TCLARG"
set syndb(zlib,adler32,hint)  "zlib adler32 string ?initValue?"
set syndb(zlib,adler32,arglist)  [list] 
set syndb(zlib,compress,type) "TCLARG"
set syndb(zlib,compress,hint)  "zlib compress string ?level?"
set syndb(zlib,compress,arglist)  [list] 
set syndb(zlib,crc32,type) "TCLARG"
set syndb(zlib,crc32,hint)  "zlib crc32 string ?initValue?"
set syndb(zlib,crc32,arglist)  [list] 
set syndb(zlib,decompress,type) "TCLARG"
set syndb(zlib,decompress,hint)  "zlib decompress string ?bufferSize?"
set syndb(zlib,decompress,arglist)  [list] 
set syndb(zlib,deflate,type) "TCLARG"
set syndb(zlib,deflate,hint)  "zlib deflate string ?level?"
set syndb(zlib,deflate,arglist)  [list] 
set syndb(zlib,gunzip,type) "TCLARG"
set syndb(zlib,gunzip,hint)  "zlib gunzip string ?-headerVar varName?"
set syndb(zlib,gunzip,arglist)  [list] 
set syndb(zlib,gzip,type) "TCLARG"
set syndb(zlib,gzip,hint)  "zlib gzip string ?-level level? ?-header dict?"
set syndb(zlib,gzip,arglist)  [list] 
set syndb(zlib,inflate,type) "TCLARG"
set syndb(zlib,inflate,hint)  "zlib inflate string ?bufferSize?"
set syndb(zlib,inflate,arglist)  [list] 
set syndb(zlib,push,type) "TCLARG"
set syndb(zlib,push,hint)  "zlib push mode channel ?options ..."
set syndb(zlib,push,arglist)  [list] 
set syndb(zlib,stream,type) "TCLARG"
set syndb(zlib,stream,hint)  "zlib stream mode ?level?"
set syndb(zlib,stream,arglist)  [list] 

set syndb(srand,srand,type) "TCLCMD"
set syndb(srand,srand,hint) ""
set syndb(srand,srand,arglist) [list ]

set syndb(string,string,type) "TCLCMD"
set syndb(string,string,hint) "string option arg ?arg ...? "
set syndb(string,string,arglist) [list bytelength compare first index is last length map match range repeat replace tolower totitle toupper trim trimleft trimright wordend wordstart]
set syndb(string,bytelength,type) "TCLARG"
set syndb(string,bytelength,hint)  "string bytelength string"
set syndb(string,bytelength,arglist)  [list] 
set syndb(string,compare,type) "TCLARG"
set syndb(string,compare,hint)  "string compare ?-nocase? ?-length int? string1 string2"
set syndb(string,compare,arglist)  [list] 
set syndb(string,first,type) "TCLARG"
set syndb(string,first,hint)  "string first needleString haystackString ?startIndex?"
set syndb(string,first,arglist)  [list] 
set syndb(string,index,type) "TCLARG"
set syndb(string,index,hint)  "string index string charIndex"
set syndb(string,index,arglist)  [list] 
set syndb(string,is,type) "TCLARG"
set syndb(string,is,hint)  "string is class ?-strict? ?-failindex varname? string"
set syndb(string,is,arglist)  [list alnum alpha ascii boolean control digit double false graph integer list lower print punct space true upper wideinteger wordchar xdigit]
set syndb(string,last,type) "TCLARG"
set syndb(string,last,hint)  "string last needleString haystackString ?lastIndex?"
set syndb(string,last,arglist)  [list] 
set syndb(string,length,type) "TCLARG"
set syndb(string,length,hint)  "string length string"
set syndb(string,length,arglist)  [list] 
set syndb(string,map,type) "TCLARG"
set syndb(string,map,hint)  "string map ?-nocase? mapping string"
set syndb(string,map,arglist)  [list] 
set syndb(string,match,type) "TCLARG"
set syndb(string,match,hint)  "string match ?-nocase? pattern string"
set syndb(string,match,arglist)  [list] 
set syndb(string,range,type) "TCLARG"
set syndb(string,range,hint)  "string range string first last"
set syndb(string,range,arglist)  [list] 
set syndb(string,repeat,type) "TCLARG"
set syndb(string,repeat,hint)  "string repeat string count"
set syndb(string,repeat,arglist)  [list] 
set syndb(string,replace,type) "TCLARG"
set syndb(string,replace,hint)  "string replace string first last ?newstring?"
set syndb(string,replace,arglist)  [list] 
set syndb(string,tolower,type) "TCLARG"
set syndb(string,tolower,hint)  "string tolower string ?first? ?last?"
set syndb(string,tolower,arglist)  [list] 
set syndb(string,totitle,type) "TCLARG"
set syndb(string,totitle,hint)  "string totitle string ?first? ?last?"
set syndb(string,totitle,arglist)  [list] 
set syndb(string,toupper,type) "TCLARG"
set syndb(string,toupper,hint)  "string toupper string ?first? ?last?"
set syndb(string,toupper,arglist)  [list] 
set syndb(string,trim,type) "TCLARG"
set syndb(string,trim,hint)  "string trim string ?chars?"
set syndb(string,trim,arglist)  [list] 
set syndb(string,trimleft,type) "TCLARG"
set syndb(string,trimleft,hint)  "string trimleft string ?chars?"
set syndb(string,trimleft,arglist)  [list] 
set syndb(string,trimright,type) "TCLARG"
set syndb(string,trimright,hint)  "string trimright string ?chars?"
set syndb(string,trimright,arglist)  [list] 
set syndb(string,wordend,type) "TCLARG"
set syndb(string,wordend,hint)  "string wordend string charIndex"
set syndb(string,wordend,arglist)  [list] 
set syndb(string,wordstart,type) "TCLARG"
set syndb(string,wordstart,hint)  "string wordstart string charIndex"
set syndb(string,wordstart,arglist)  [list] 

set syndb(subst,subst,type) "TCLCMD"
set syndb(subst,subst,hint) "subst ?-nobackslashes? ?-nocommands? ?-novariables? string"
set syndb(subst,subst,arglist) [list -nobackslashes -nocommands -novariables]
set syndb(subst,-nobackslashes,type) "TCLARG"
set syndb(subst,-nobackslashes,hint)  ""
set syndb(subst,-nobackslashes,arglist)  [list] 
set syndb(subst,-nocommands,type) "TCLARG"
set syndb(subst,-nocommands,hint)  ""
set syndb(subst,-nocommands,arglist)  [list] 
set syndb(subst,-novariables,type) "TCLARG"
set syndb(subst,-novariables,hint)  ""
set syndb(subst,-novariables,arglist)  [list] 

set syndb(superclass,superclass,type) "TCLCMD"
set syndb(superclass,superclass,hint) "superclass className ?className ...?"
set syndb(superclass,superclass,arglist) [list ]

set syndb(switch,switch,type) "TCLCMD"
set syndb(switch,switch,hint) "switch ?options? string {pattern body ?pattern body ...?}"
set syndb(switch,switch,arglist) [list -exact -glob -regexp]
set syndb(switch,-exact,type) "TCLARG"
set syndb(switch,-exact,hint)  ""
set syndb(switch,-exact,arglist)  [list] 
set syndb(switch,-glob,type) "TCLARG"
set syndb(switch,-glob,hint)  ""
set syndb(switch,-glob,arglist)  [list] 
set syndb(switch,-regexp,type) "TCLARG"
set syndb(switch,-regexp,hint)  ""
set syndb(switch,-regexp,arglist)  [list] 

set syndb(tan,tan,type) "TCLCMD"
set syndb(tan,tan,hint) ""
set syndb(tan,tan,arglist) [list ]

set syndb(tanh,tanh,type) "TCLCMD"
set syndb(tanh,tanh,hint) ""
set syndb(tanh,tanh,arglist) [list ]

set syndb(tcl::prefix,prefix,type) "TCLCMD"
set syndb(tcl::prefix,prefix,hint) ""
set syndb(tcl::prefix,prefix,arglist) [list all longest match]
set syndb(tcl::prefix,all,type) "TCLARG"
set syndb(tcl::prefix,all,hint)  "tcl::prefix all table string"
set syndb(tcl::prefix,all,arglist)  [list] 
set syndb(tcl::prefix,longest,type) "TCLARG"
set syndb(tcl::prefix,longest,hint)  "tcl::prefix longest table string"
set syndb(tcl::prefix,longest,arglist)  [list] 
set syndb(tcl::prefix,match,type) "TCLARG"
set syndb(tcl::prefix,match,hint)  "tcl::prefix match ?option ...? table string"
set syndb(tcl::prefix,match,arglist)  [list] 

set syndb(tcltest::bytestring,bytestring,type) "TCLCMD"
set syndb(tcltest::bytestring,bytestring,hint) "tcltest::bytestring string"
set syndb(tcltest::bytestring,bytestring,arglist) [list ]

set syndb(tcltest::cleanupTests,cleanupTests,type) "TCLCMD"
set syndb(tcltest::cleanupTests,cleanupTests,hint) "tcltest::cleanupTests ?runningMultipleTests?"
set syndb(tcltest::cleanupTests,cleanupTests,arglist) [list ]

set syndb(tcltest::configure,configure,type) "TCLCMD"
set syndb(tcltest::configure,configure,hint) "tcltest::configure option value ?option value ...?"
set syndb(tcltest::configure,configure,arglist) [list ]

set syndb(tcltest::customMatch,customMatch,type) "TCLCMD"
set syndb(tcltest::customMatch,customMatch,hint) "tcltest::customMatch mode command"
set syndb(tcltest::customMatch,customMatch,arglist) [list ]

set syndb(tcltest::debug,debug,type) "TCLCMD"
set syndb(tcltest::debug,debug,hint) "tcltest::debug ?level?"
set syndb(tcltest::debug,debug,arglist) [list ]

set syndb(tcltest::errorChannel,errorChannel,type) "TCLCMD"
set syndb(tcltest::errorChannel,errorChannel,hint) "tcltest::errorChannel ?channelID?"
set syndb(tcltest::errorChannel,errorChannel,arglist) [list ]

set syndb(tcltest::errorFile,errorFile,type) "TCLCMD"
set syndb(tcltest::errorFile,errorFile,hint) "tcltest::errorFile ?filename?"
set syndb(tcltest::errorFile,errorFile,arglist) [list ]

set syndb(tcltest::interpreter,interpreter,type) "TCLCMD"
set syndb(tcltest::interpreter,interpreter,hint) "tcltest::interpreter ?interp?"
set syndb(tcltest::interpreter,interpreter,arglist) [list ]

set syndb(tcltest::limitConstraints,limitConstraints,type) "TCLCMD"
set syndb(tcltest::limitConstraints,limitConstraints,hint) "tcltest::limitConstraints ?boolean?"
set syndb(tcltest::limitConstraints,limitConstraints,arglist) [list ]

set syndb(tcltest::loadFile,loadFile,type) "TCLCMD"
set syndb(tcltest::loadFile,loadFile,hint) "tcltest::loadFile ?filename?"
set syndb(tcltest::loadFile,loadFile,arglist) [list ]

set syndb(tcltest::loadScript,loadScript,type) "TCLCMD"
set syndb(tcltest::loadScript,loadScript,hint) "tcltest::loadScript ?script?"
set syndb(tcltest::loadScript,loadScript,arglist) [list ]

set syndb(tcltest::loadTestedCommands,loadTestedCommands,type) "TCLCMD"
set syndb(tcltest::loadTestedCommands,loadTestedCommands,hint) "tcltest::loadTestedCommands"
set syndb(tcltest::loadTestedCommands,loadTestedCommands,arglist) [list ]

set syndb(tcltest::makeDirectory,makeDirectory,type) "TCLCMD"
set syndb(tcltest::makeDirectory,makeDirectory,hint) "tcltest::makeDirectory name ?directory?"
set syndb(tcltest::makeDirectory,makeDirectory,arglist) [list ]

set syndb(tcltest::makeFile,makeFile,type) "TCLCMD"
set syndb(tcltest::makeFile,makeFile,hint) "tcltest::makeFile contents name ?directory?"
set syndb(tcltest::makeFile,makeFile,arglist) [list ]

set syndb(tcltest::match,match,type) "TCLCMD"
set syndb(tcltest::match,match,hint) "tcltest::match ?patternList?"
set syndb(tcltest::match,match,arglist) [list ]

set syndb(tcltest::matchDirectories,matchDirectories,type) "TCLCMD"
set syndb(tcltest::matchDirectories,matchDirectories,hint) "tcltest::matchDirectories ?patternList?"
set syndb(tcltest::matchDirectories,matchDirectories,arglist) [list ]

set syndb(tcltest::matchFiles,matchFiles,type) "TCLCMD"
set syndb(tcltest::matchFiles,matchFiles,hint) "tcltest::matchFiles ?patternList?"
set syndb(tcltest::matchFiles,matchFiles,arglist) [list ]

set syndb(tcltest::normalizeMsg,normalizeMsg,type) "TCLCMD"
set syndb(tcltest::normalizeMsg,normalizeMsg,hint) "tcltest::normalizeMsg msg"
set syndb(tcltest::normalizeMsg,normalizeMsg,arglist) [list ]

set syndb(tcltest::normalizePath,normalizePath,type) "TCLCMD"
set syndb(tcltest::normalizePath,normalizePath,hint) "tcltest::normalizePath pathVar"
set syndb(tcltest::normalizePath,normalizePath,arglist) [list ]

set syndb(tcltest::outputChannel,outputChannel,type) "TCLCMD"
set syndb(tcltest::outputChannel,outputChannel,hint) "tcltest::outputChannel ?channelID?"
set syndb(tcltest::outputChannel,outputChannel,arglist) [list ]

set syndb(tcltest::outputFile,outputFile,type) "TCLCMD"
set syndb(tcltest::outputFile,outputFile,hint) "tcltest::outputFile ?filename?"
set syndb(tcltest::outputFile,outputFile,arglist) [list ]

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

set syndb(selection,selection,type) "TKCMD"
set syndb(selection,selection,hint) "selection option ?arg arg ...?"
set syndb(selection,selection,arglist) [list -command -displayof -format -selection -type clear get handle own]
set syndb(selection,-command,type) "TKOPT"
set syndb(selection,-command,hint)  ""
set syndb(selection,-command,arglist)  [list ]
set syndb(selection,-displayof,type) "TKOPT"
set syndb(selection,-displayof,hint)  ""
set syndb(selection,-displayof,arglist)  [list ]
set syndb(selection,-format,type) "TKOPT"
set syndb(selection,-format,hint)  ""
set syndb(selection,-format,arglist)  [list ]
set syndb(selection,-selection,type) "TKOPT"
set syndb(selection,-selection,hint)  ""
set syndb(selection,-selection,arglist)  [list ]
set syndb(selection,-type,type) "TKOPT"
set syndb(selection,-type,hint)  ""
set syndb(selection,-type,arglist)  [list ]
set syndb(selection,clear,type) "TKARG"
set syndb(selection,clear,hint)  "selection clear ?-displayof window? ?-selection selection?"
set syndb(selection,clear,arglist)  [list ]
set syndb(selection,get,type) "TKARG"
set syndb(selection,get,hint)  "selection get ?-displayof window? ?-selection selection? ?-type type?"
set syndb(selection,get,arglist)  [list ]
set syndb(selection,handle,type) "TKARG"
set syndb(selection,handle,hint)  "selection handle ?-selection s? ?-type t? ?-format f? window command "
set syndb(selection,handle,arglist)  [list ]
set syndb(selection,own,type) "TKARG"
set syndb(selection,own,hint)  ""
set syndb(selection,own,arglist)  [list ]

set syndb(tk_popup,tk_popup,type) "TKCMD"
set syndb(tk_popup,tk_popup,hint) "tk_popup menu x y ?entry?"
set syndb(tk_popup,tk_popup,arglist) [list ]

set syndb(bell,bell,type) "TKCMD"
set syndb(bell,bell,hint) "bell ?-displayof window? ?-nice?"
set syndb(bell,bell,arglist) [list -displayof -nice]
set syndb(bell,-displayof,type) "TKOPT"
set syndb(bell,-displayof,hint)  ""
set syndb(bell,-displayof,arglist)  [list ]
set syndb(bell,-nice,type) "TKOPT"
set syndb(bell,-nice,hint)  ""
set syndb(bell,-nice,arglist)  [list ]

set syndb(bind,bind,type) "TKCMD"
set syndb(bind,bind,hint) "bind tag ?sequence? ?+??script?"
set syndb(bind,bind,arglist) [list ]

set syndb(bindtags,bindtags,type) "TKCMD"
set syndb(bindtags,bindtags,hint) "bindtags window ?tagList?"
set syndb(bindtags,bindtags,arglist) [list ]

set syndb(bitmap,bitmap,type) "TKCMD"
set syndb(bitmap,bitmap,hint) ""
set syndb(bitmap,bitmap,arglist) [list -background -data -file -foreground -maskdata -maskfile]
set syndb(bitmap,-background,type) "TKOPT"
set syndb(bitmap,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(bitmap,-background,hint)  ""
set syndb(bitmap,-data,type) "TKOPT"
set syndb(bitmap,-data,hint)  ""
set syndb(bitmap,-data,arglist)  [list ]
set syndb(bitmap,-file,type) "TKOPT"
set syndb(bitmap,-file,hint)  ""
set syndb(bitmap,-file,arglist)  [list ]
set syndb(bitmap,-foreground,type) "TKOPT"
set syndb(bitmap,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(bitmap,-foreground,hint)  ""
set syndb(bitmap,-maskdata,type) "TKOPT"
set syndb(bitmap,-maskdata,hint)  ""
set syndb(bitmap,-maskdata,arglist)  [list ]
set syndb(bitmap,-maskfile,type) "TKOPT"
set syndb(bitmap,-maskfile,hint)  ""
set syndb(bitmap,-maskfile,arglist)  [list ]



set syndb(button,button,type) "TKCMD"
set syndb(button,button,hint) "button pathName ?options?"
set syndb(button,button,arglist) [list -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -command -compound -cursor -default -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -justify -overrelief -padx -pady -relief -repeatdelay -repeatinterval -state -takefocus -text -textvariable -underline -width -wraplength]
set syndb(button,-activebackground,type) "TKOPT"
set syndb(button,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(button,-activebackground,hint)  ""
set syndb(button,-activeforeground,type) "TKOPT"
set syndb(button,-activeforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(button,-activeforeground,hint)  ""
set syndb(button,-anchor,type) "TKOPT"
set syndb(button,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(button,-anchor,hint)  ""
set syndb(button,-background,type) "TKOPT"
set syndb(button,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(button,-background,hint)  ""
set syndb(button,-bd,type) "TKOPT"
set syndb(button,-bd,hint)  ""
set syndb(button,-bd,arglist)  [list ]
set syndb(button,-bg,type) "TKOPT"
set syndb(button,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(button,-bg,hint)  ""
set syndb(button,-bitmap,type) "TKOPT"
set syndb(button,-bitmap,arglist)  [list {[ez_chooseBitmap]}]
set syndb(button,-bitmap,hint)  ""
set syndb(button,-borderwidth,type) "TKOPT"
set syndb(button,-borderwidth,hint)  ""
set syndb(button,-borderwidth,arglist)  [list ]
set syndb(button,-command,type) "TKOPT"
set syndb(button,-command,hint)  ""
set syndb(button,-command,arglist)  [list ]
set syndb(button,-compound,type) "TKOPT"
set syndb(button,-compound,arglist)  [list none bottom top left right center]
set syndb(button,-compound,hint)  ""
set syndb(button,-cursor,type) "TKOPT"
set syndb(button,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(button,-cursor,hint)  ""
set syndb(button,-default,type) "TKOPT"
set syndb(button,-default,hint)  ""
set syndb(button,-default,arglist)  [list ]
set syndb(button,-disabledforeground,type) "TKOPT"
set syndb(button,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(button,-disabledforeground,hint)  ""
set syndb(button,-fg,type) "TKOPT"
set syndb(button,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(button,-fg,hint)  ""
set syndb(button,-font,type) "TKOPT"
set syndb(button,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(button,-font,hint)  ""
set syndb(button,-foreground,type) "TKOPT"
set syndb(button,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(button,-foreground,hint)  ""
set syndb(button,-height,type) "TKOPT"
set syndb(button,-height,hint)  ""
set syndb(button,-height,arglist)  [list ]
set syndb(button,-highlightbackground,type) "TKOPT"
set syndb(button,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(button,-highlightbackground,hint)  ""
set syndb(button,-highlightcolor,type) "TKOPT"
set syndb(button,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(button,-highlightcolor,hint)  ""
set syndb(button,-highlightthickness,type) "TKOPT"
set syndb(button,-highlightthickness,hint)  ""
set syndb(button,-highlightthickness,arglist)  [list ]
set syndb(button,-image,type) "TKOPT"
set syndb(button,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(button,-image,hint)  ""
set syndb(button,-justify,type) "TKOPT"
set syndb(button,-justify,arglist)  [list center left right]
set syndb(button,-justify,hint)  ""
set syndb(button,-overrelief,type) "TKOPT"
set syndb(button,-overrelief,hint)  ""
set syndb(button,-overrelief,arglist)  [list ]
set syndb(button,-padx,type) "TKOPT"
set syndb(button,-padx,hint)  ""
set syndb(button,-padx,arglist)  [list ]
set syndb(button,-pady,type) "TKOPT"
set syndb(button,-pady,hint)  ""
set syndb(button,-pady,arglist)  [list ]
set syndb(button,-relief,type) "TKOPT"
set syndb(button,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(button,-relief,hint)  ""
set syndb(button,-repeatdelay,type) "TKOPT"
set syndb(button,-repeatdelay,hint)  ""
set syndb(button,-repeatdelay,arglist)  [list ]
set syndb(button,-repeatinterval,type) "TKOPT"
set syndb(button,-repeatinterval,hint)  ""
set syndb(button,-repeatinterval,arglist)  [list ]
set syndb(button,-state,type) "TKOPT"
set syndb(button,-state,arglist)  [list normal disabled]
set syndb(button,-state,hint)  ""
set syndb(button,-takefocus,type) "TKOPT"
set syndb(button,-takefocus,hint)  ""
set syndb(button,-takefocus,arglist)  [list ]
set syndb(button,-text,type) "TKOPT"
set syndb(button,-text,hint)  ""
set syndb(button,-text,arglist)  [list ]
set syndb(button,-textvariable,type) "TKOPT"
set syndb(button,-textvariable,hint)  ""
set syndb(button,-textvariable,arglist)  [list ]
set syndb(button,-underline,type) "TKOPT"
set syndb(button,-underline,hint)  ""
set syndb(button,-underline,arglist)  [list ]
set syndb(button,-width,type) "TKOPT"
set syndb(button,-width,hint)  ""
set syndb(button,-width,arglist)  [list ]
set syndb(button,-wraplength,type) "TKOPT"
set syndb(button,-wraplength,hint)  ""
set syndb(button,-wraplength,arglist)  [list ]

set syndb(canvas,canvas,type) "TKCMD"
set syndb(canvas,canvas,hint) "canvas pathName ?options?"
set syndb(canvas,canvas,arglist) [list -background -bd -bg -borderwidth -closeenough -confine -cursor -height -highlightbackground -highlightcolor -highlightthickness -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -relief -scrollregion -selectbackground -selectborderwidth -selectforeground -state -takefocus -width -xscrollcommand -xscrollincrement -yscrollcommand -yscrollincrement]
set syndb(canvas,-background,type) "TKOPT"
set syndb(canvas,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(canvas,-background,hint)  ""
set syndb(canvas,-bd,type) "TKOPT"
set syndb(canvas,-bd,hint)  ""
set syndb(canvas,-bd,arglist)  [list ]
set syndb(canvas,-bg,type) "TKOPT"
set syndb(canvas,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(canvas,-bg,hint)  ""
set syndb(canvas,-borderwidth,type) "TKOPT"
set syndb(canvas,-borderwidth,hint)  ""
set syndb(canvas,-borderwidth,arglist)  [list ]
set syndb(canvas,-closeenough,type) "TKOPT"
set syndb(canvas,-closeenough,hint)  ""
set syndb(canvas,-closeenough,arglist)  [list ]
set syndb(canvas,-confine,type) "TKOPT"
set syndb(canvas,-confine,hint)  ""
set syndb(canvas,-confine,arglist)  [list ]
set syndb(canvas,-cursor,type) "TKOPT"
set syndb(canvas,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(canvas,-cursor,hint)  ""
set syndb(canvas,-height,type) "TKOPT"
set syndb(canvas,-height,hint)  ""
set syndb(canvas,-height,arglist)  [list ]
set syndb(canvas,-highlightbackground,type) "TKOPT"
set syndb(canvas,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(canvas,-highlightbackground,hint)  ""
set syndb(canvas,-highlightcolor,type) "TKOPT"
set syndb(canvas,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(canvas,-highlightcolor,hint)  ""
set syndb(canvas,-highlightthickness,type) "TKOPT"
set syndb(canvas,-highlightthickness,hint)  ""
set syndb(canvas,-highlightthickness,arglist)  [list ]
set syndb(canvas,-insertbackground,type) "TKOPT"
set syndb(canvas,-insertbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(canvas,-insertbackground,hint)  ""
set syndb(canvas,-insertborderwidth,type) "TKOPT"
set syndb(canvas,-insertborderwidth,hint)  ""
set syndb(canvas,-insertborderwidth,arglist)  [list ]
set syndb(canvas,-insertofftime,type) "TKOPT"
set syndb(canvas,-insertofftime,hint)  ""
set syndb(canvas,-insertofftime,arglist)  [list ]
set syndb(canvas,-insertontime,type) "TKOPT"
set syndb(canvas,-insertontime,hint)  ""
set syndb(canvas,-insertontime,arglist)  [list ]
set syndb(canvas,-insertwidth,type) "TKOPT"
set syndb(canvas,-insertwidth,hint)  ""
set syndb(canvas,-insertwidth,arglist)  [list ]
set syndb(canvas,-relief,type) "TKOPT"
set syndb(canvas,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(canvas,-relief,hint)  ""
set syndb(canvas,-scrollregion,type) "TKOPT"
set syndb(canvas,-scrollregion,hint)  ""
set syndb(canvas,-scrollregion,arglist)  [list ]
set syndb(canvas,-selectbackground,type) "TKOPT"
set syndb(canvas,-selectbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(canvas,-selectbackground,hint)  ""
set syndb(canvas,-selectborderwidth,type) "TKOPT"
set syndb(canvas,-selectborderwidth,hint)  ""
set syndb(canvas,-selectborderwidth,arglist)  [list ]
set syndb(canvas,-selectforeground,type) "TKOPT"
set syndb(canvas,-selectforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(canvas,-selectforeground,hint)  ""
set syndb(canvas,-state,type) "TKOPT"
set syndb(canvas,-state,arglist)  [list normal disabled]
set syndb(canvas,-state,hint)  ""
set syndb(canvas,-takefocus,type) "TKOPT"
set syndb(canvas,-takefocus,hint)  ""
set syndb(canvas,-takefocus,arglist)  [list ]
set syndb(canvas,-width,type) "TKOPT"
set syndb(canvas,-width,hint)  ""
set syndb(canvas,-width,arglist)  [list ]
set syndb(canvas,-xscrollcommand,type) "TKOPT"
set syndb(canvas,-xscrollcommand,hint)  ""
set syndb(canvas,-xscrollcommand,arglist)  [list ]
set syndb(canvas,-xscrollincrement,type) "TKOPT"
set syndb(canvas,-xscrollincrement,hint)  ""
set syndb(canvas,-xscrollincrement,arglist)  [list ]
set syndb(canvas,-yscrollcommand,type) "TKOPT"
set syndb(canvas,-yscrollcommand,hint)  ""
set syndb(canvas,-yscrollcommand,arglist)  [list ]
set syndb(canvas,-yscrollincrement,type) "TKOPT"
set syndb(canvas,-yscrollincrement,hint)  ""
set syndb(canvas,-yscrollincrement,arglist)  [list ]

set syndb(checkbutton,checkbutton,type) "TKCMD"
set syndb(checkbutton,checkbutton,hint) "checkbutton pathName ?options?"
set syndb(checkbutton,checkbutton,arglist) [list -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -command -compound -cursor -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -indicatoron -justify -offrelief -offvalue -onvalue -overrelief -padx -pady -relief -selectcolor -selectimage -state -takefocus -text -textvariable -underline -variable -width -wraplength]
set syndb(checkbutton,-activebackground,type) "TKOPT"
set syndb(checkbutton,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(checkbutton,-activebackground,hint)  ""
set syndb(checkbutton,-activeforeground,type) "TKOPT"
set syndb(checkbutton,-activeforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(checkbutton,-activeforeground,hint)  ""
set syndb(checkbutton,-anchor,type) "TKOPT"
set syndb(checkbutton,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(checkbutton,-anchor,hint)  ""
set syndb(checkbutton,-background,type) "TKOPT"
set syndb(checkbutton,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(checkbutton,-background,hint)  ""
set syndb(checkbutton,-bd,type) "TKOPT"
set syndb(checkbutton,-bd,hint)  ""
set syndb(checkbutton,-bd,arglist)  [list ]
set syndb(checkbutton,-bg,type) "TKOPT"
set syndb(checkbutton,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(checkbutton,-bg,hint)  ""
set syndb(checkbutton,-bitmap,type) "TKOPT"
set syndb(checkbutton,-bitmap,arglist)  [list {[ez_chooseBitmap]}]
set syndb(checkbutton,-bitmap,hint)  ""
set syndb(checkbutton,-borderwidth,type) "TKOPT"
set syndb(checkbutton,-borderwidth,hint)  ""
set syndb(checkbutton,-borderwidth,arglist)  [list ]
set syndb(checkbutton,-command,type) "TKOPT"
set syndb(checkbutton,-command,hint)  ""
set syndb(checkbutton,-command,arglist)  [list ]
set syndb(checkbutton,-compound,type) "TKOPT"
set syndb(checkbutton,-compound,arglist)  [list none bottom top left right center]
set syndb(checkbutton,-compound,hint)  ""
set syndb(checkbutton,-cursor,type) "TKOPT"
set syndb(checkbutton,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(checkbutton,-cursor,hint)  ""
set syndb(checkbutton,-disabledforeground,type) "TKOPT"
set syndb(checkbutton,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(checkbutton,-disabledforeground,hint)  ""
set syndb(checkbutton,-fg,type) "TKOPT"
set syndb(checkbutton,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(checkbutton,-fg,hint)  ""
set syndb(checkbutton,-font,type) "TKOPT"
set syndb(checkbutton,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(checkbutton,-font,hint)  ""
set syndb(checkbutton,-foreground,type) "TKOPT"
set syndb(checkbutton,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(checkbutton,-foreground,hint)  ""
set syndb(checkbutton,-height,type) "TKOPT"
set syndb(checkbutton,-height,hint)  ""
set syndb(checkbutton,-height,arglist)  [list ]
set syndb(checkbutton,-highlightbackground,type) "TKOPT"
set syndb(checkbutton,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(checkbutton,-highlightbackground,hint)  ""
set syndb(checkbutton,-highlightcolor,type) "TKOPT"
set syndb(checkbutton,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(checkbutton,-highlightcolor,hint)  ""
set syndb(checkbutton,-highlightthickness,type) "TKOPT"
set syndb(checkbutton,-highlightthickness,hint)  ""
set syndb(checkbutton,-highlightthickness,arglist)  [list ]
set syndb(checkbutton,-image,type) "TKOPT"
set syndb(checkbutton,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(checkbutton,-image,hint)  ""
set syndb(checkbutton,-indicatoron,type) "TKOPT"
set syndb(checkbutton,-indicatoron,hint)  ""
set syndb(checkbutton,-indicatoron,arglist)  [list ]
set syndb(checkbutton,-justify,type) "TKOPT"
set syndb(checkbutton,-justify,arglist)  [list center left right]
set syndb(checkbutton,-justify,hint)  ""
set syndb(checkbutton,-offrelief,type) "TKOPT"
set syndb(checkbutton,-offrelief,hint)  ""
set syndb(checkbutton,-offrelief,arglist)  [list ]
set syndb(checkbutton,-offvalue,type) "TKOPT"
set syndb(checkbutton,-offvalue,hint)  ""
set syndb(checkbutton,-offvalue,arglist)  [list ]
set syndb(checkbutton,-onvalue,type) "TKOPT"
set syndb(checkbutton,-onvalue,hint)  ""
set syndb(checkbutton,-onvalue,arglist)  [list ]
set syndb(checkbutton,-overrelief,type) "TKOPT"
set syndb(checkbutton,-overrelief,hint)  ""
set syndb(checkbutton,-overrelief,arglist)  [list ]
set syndb(checkbutton,-padx,type) "TKOPT"
set syndb(checkbutton,-padx,hint)  ""
set syndb(checkbutton,-padx,arglist)  [list ]
set syndb(checkbutton,-pady,type) "TKOPT"
set syndb(checkbutton,-pady,hint)  ""
set syndb(checkbutton,-pady,arglist)  [list ]
set syndb(checkbutton,-relief,type) "TKOPT"
set syndb(checkbutton,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(checkbutton,-relief,hint)  ""
set syndb(checkbutton,-selectcolor,type) "TKOPT"
set syndb(checkbutton,-selectcolor,hint)  ""
set syndb(checkbutton,-selectcolor,arglist)  [list ]
set syndb(checkbutton,-selectimage,type) "TKOPT"
set syndb(checkbutton,-selectimage,hint)  ""
set syndb(checkbutton,-selectimage,arglist)  [list ]
set syndb(checkbutton,-state,type) "TKOPT"
set syndb(checkbutton,-state,arglist)  [list normal disabled]
set syndb(checkbutton,-state,hint)  ""
set syndb(checkbutton,-takefocus,type) "TKOPT"
set syndb(checkbutton,-takefocus,hint)  ""
set syndb(checkbutton,-takefocus,arglist)  [list ]
set syndb(checkbutton,-text,type) "TKOPT"
set syndb(checkbutton,-text,hint)  ""
set syndb(checkbutton,-text,arglist)  [list ]
set syndb(checkbutton,-textvariable,type) "TKOPT"
set syndb(checkbutton,-textvariable,hint)  ""
set syndb(checkbutton,-textvariable,arglist)  [list ]
set syndb(checkbutton,-underline,type) "TKOPT"
set syndb(checkbutton,-underline,hint)  ""
set syndb(checkbutton,-underline,arglist)  [list ]
set syndb(checkbutton,-variable,type) "TKOPT"
set syndb(checkbutton,-variable,hint)  ""
set syndb(checkbutton,-variable,arglist)  [list ]
set syndb(checkbutton,-width,type) "TKOPT"
set syndb(checkbutton,-width,hint)  ""
set syndb(checkbutton,-width,arglist)  [list ]
set syndb(checkbutton,-wraplength,type) "TKOPT"
set syndb(checkbutton,-wraplength,hint)  ""
set syndb(checkbutton,-wraplength,arglist)  [list ]

set syndb(clipboard,clipboard,type) "TKCMD"
set syndb(clipboard,clipboard,hint) "clipboard option ?arg arg ...?"
set syndb(clipboard,clipboard,arglist) [list append clear get]
set syndb(clipboard,append,type) "TKARG"
set syndb(clipboard,append,hint)  "clipboard append ?-displayof window? ?-format format? ?-type type? ?--? data"
set syndb(clipboard,append,arglist)  [list ]
set syndb(clipboard,clear,type) "TKARG"
set syndb(clipboard,clear,hint)  "clipboard clear ?-displayof window?"
set syndb(clipboard,clear,arglist)  [list ]
set syndb(clipboard,get,type) "TKARG"
set syndb(clipboard,get,hint)  "clipboard get ?-displayof window? ?-type type?"
set syndb(clipboard,get,arglist)  [list ]

set syndb(console,console,type) "TKCMD"
set syndb(console,console,hint) "console subcommand ?arg ...?"
set syndb(console,console,arglist) [list eval hidden show title]
set syndb(console,eval,type) "TKARG"
set syndb(console,eval,hint)  ""
set syndb(console,eval,arglist)  [list ]
set syndb(console,hidden,type) "TKARG"
set syndb(console,hidden,hint)  ""
set syndb(console,hidden,arglist)  [list ]
set syndb(console,show,type) "TKARG"
set syndb(console,show,hint)  ""
set syndb(console,show,arglist)  [list ]
set syndb(console,title,type) "TKARG"
set syndb(console,title,hint)  "console title ?string?"
set syndb(console,title,arglist)  [list ]

set syndb(destroy,destroy,type) "TKCMD"
set syndb(destroy,destroy,hint) ""
set syndb(destroy,destroy,arglist) [list ]

set syndb(entry,entry,type) "TKCMD"
set syndb(entry,entry,hint) "entry pathName ?options?"
set syndb(entry,entry,arglist) [list -background -bd -bg -borderwidth -cursor -disabledbackground -disabledforeground -exportselection -fg -font -foreground -highlightbackground -highlightcolor -highlightthickness -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -invalidcommand -invcmd -justify -readonlybackground -relief -selectbackground -selectborderwidth -selectforeground -show -state -takefocus -textvariable -validate -validatecommand -vcmd -width -xscrollcommand]
set syndb(entry,-background,type) "TKOPT"
set syndb(entry,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-background,hint)  ""
set syndb(entry,-bd,type) "TKOPT"
set syndb(entry,-bd,hint)  ""
set syndb(entry,-bd,arglist)  [list ]
set syndb(entry,-bg,type) "TKOPT"
set syndb(entry,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-bg,hint)  ""
set syndb(entry,-borderwidth,type) "TKOPT"
set syndb(entry,-borderwidth,hint)  ""
set syndb(entry,-borderwidth,arglist)  [list ]
set syndb(entry,-cursor,type) "TKOPT"
set syndb(entry,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(entry,-cursor,hint)  ""
set syndb(entry,-disabledbackground,type) "TKOPT"
set syndb(entry,-disabledbackground,hint)  ""
set syndb(entry,-disabledbackground,arglist)  [list ]
set syndb(entry,-disabledforeground,type) "TKOPT"
set syndb(entry,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-disabledforeground,hint)  ""
set syndb(entry,-exportselection,type) "TKOPT"
set syndb(entry,-exportselection,hint)  ""
set syndb(entry,-exportselection,arglist)  [list ]
set syndb(entry,-fg,type) "TKOPT"
set syndb(entry,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-fg,hint)  ""
set syndb(entry,-font,type) "TKOPT"
set syndb(entry,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(entry,-font,hint)  ""
set syndb(entry,-foreground,type) "TKOPT"
set syndb(entry,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-foreground,hint)  ""
set syndb(entry,-highlightbackground,type) "TKOPT"
set syndb(entry,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-highlightbackground,hint)  ""
set syndb(entry,-highlightcolor,type) "TKOPT"
set syndb(entry,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-highlightcolor,hint)  ""
set syndb(entry,-highlightthickness,type) "TKOPT"
set syndb(entry,-highlightthickness,hint)  ""
set syndb(entry,-highlightthickness,arglist)  [list ]
set syndb(entry,-insertbackground,type) "TKOPT"
set syndb(entry,-insertbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-insertbackground,hint)  ""
set syndb(entry,-insertborderwidth,type) "TKOPT"
set syndb(entry,-insertborderwidth,hint)  ""
set syndb(entry,-insertborderwidth,arglist)  [list ]
set syndb(entry,-insertofftime,type) "TKOPT"
set syndb(entry,-insertofftime,hint)  ""
set syndb(entry,-insertofftime,arglist)  [list ]
set syndb(entry,-insertontime,type) "TKOPT"
set syndb(entry,-insertontime,hint)  ""
set syndb(entry,-insertontime,arglist)  [list ]
set syndb(entry,-insertwidth,type) "TKOPT"
set syndb(entry,-insertwidth,hint)  ""
set syndb(entry,-insertwidth,arglist)  [list ]
set syndb(entry,-invalidcommand,type) "TKOPT"
set syndb(entry,-invalidcommand,hint)  ""
set syndb(entry,-invalidcommand,arglist)  [list ]
set syndb(entry,-invcmd,type) "TKOPT"
set syndb(entry,-invcmd,hint)  ""
set syndb(entry,-invcmd,arglist)  [list ]
set syndb(entry,-justify,type) "TKOPT"
set syndb(entry,-justify,arglist)  [list center left right]
set syndb(entry,-justify,hint)  ""
set syndb(entry,-readonlybackground,type) "TKOPT"
set syndb(entry,-readonlybackground,hint)  ""
set syndb(entry,-readonlybackground,arglist)  [list ]
set syndb(entry,-relief,type) "TKOPT"
set syndb(entry,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(entry,-relief,hint)  ""
set syndb(entry,-selectbackground,type) "TKOPT"
set syndb(entry,-selectbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-selectbackground,hint)  ""
set syndb(entry,-selectborderwidth,type) "TKOPT"
set syndb(entry,-selectborderwidth,hint)  ""
set syndb(entry,-selectborderwidth,arglist)  [list ]
set syndb(entry,-selectforeground,type) "TKOPT"
set syndb(entry,-selectforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(entry,-selectforeground,hint)  ""
set syndb(entry,-show,type) "TKOPT"
set syndb(entry,-show,hint)  ""
set syndb(entry,-show,arglist)  [list ]
set syndb(entry,-state,type) "TKOPT"
set syndb(entry,-state,arglist)  [list normal disabled]
set syndb(entry,-state,hint)  ""
set syndb(entry,-takefocus,type) "TKOPT"
set syndb(entry,-takefocus,hint)  ""
set syndb(entry,-takefocus,arglist)  [list ]
set syndb(entry,-textvariable,type) "TKOPT"
set syndb(entry,-textvariable,hint)  ""
set syndb(entry,-textvariable,arglist)  [list ]
set syndb(entry,-validate,type) "TKOPT"
set syndb(entry,-validate,hint)  ""
set syndb(entry,-validate,arglist)  [list ]
set syndb(entry,-validatecommand,type) "TKOPT"
set syndb(entry,-validatecommand,hint)  ""
set syndb(entry,-validatecommand,arglist)  [list ]
set syndb(entry,-vcmd,type) "TKOPT"
set syndb(entry,-vcmd,hint)  ""
set syndb(entry,-vcmd,arglist)  [list ]
set syndb(entry,-width,type) "TKOPT"
set syndb(entry,-width,hint)  ""
set syndb(entry,-width,arglist)  [list ]
set syndb(entry,-xscrollcommand,type) "TKOPT"
set syndb(entry,-xscrollcommand,hint)  ""
set syndb(entry,-xscrollcommand,arglist)  [list ]

set syndb(event,event,type) "TKCMD"
set syndb(event,event,hint) "event option ?arg arg ...?"
set syndb(event,event,arglist) [list -above -borderwidth -button -count -delta -detail -focus -height -keycode -keysym -mode -override -place -root -rootx -rooty -sendevent -serial -state -subwindow -time -warp -when -width -x -y add delete generate info]
set syndb(event,-above,type) "TKOPT"
set syndb(event,-above,hint)  ""
set syndb(event,-above,arglist)  [list ]
set syndb(event,-borderwidth,type) "TKOPT"
set syndb(event,-borderwidth,hint)  ""
set syndb(event,-borderwidth,arglist)  [list ]
set syndb(event,-button,type) "TKOPT"
set syndb(event,-button,hint)  ""
set syndb(event,-button,arglist)  [list ]
set syndb(event,-count,type) "TKOPT"
set syndb(event,-count,hint)  ""
set syndb(event,-count,arglist)  [list ]
set syndb(event,-delta,type) "TKOPT"
set syndb(event,-delta,hint)  ""
set syndb(event,-delta,arglist)  [list ]
set syndb(event,-detail,type) "TKOPT"
set syndb(event,-detail,hint)  ""
set syndb(event,-detail,arglist)  [list ]
set syndb(event,-focus,type) "TKOPT"
set syndb(event,-focus,hint)  ""
set syndb(event,-focus,arglist)  [list ]
set syndb(event,-height,type) "TKOPT"
set syndb(event,-height,hint)  ""
set syndb(event,-height,arglist)  [list ]
set syndb(event,-keycode,type) "TKOPT"
set syndb(event,-keycode,hint)  ""
set syndb(event,-keycode,arglist)  [list ]
set syndb(event,-keysym,type) "TKOPT"
set syndb(event,-keysym,hint)  ""
set syndb(event,-keysym,arglist)  [list ]
set syndb(event,-mode,type) "TKOPT"
set syndb(event,-mode,hint)  ""
set syndb(event,-mode,arglist)  [list ]
set syndb(event,-override,type) "TKOPT"
set syndb(event,-override,hint)  ""
set syndb(event,-override,arglist)  [list ]
set syndb(event,-place,type) "TKOPT"
set syndb(event,-place,hint)  ""
set syndb(event,-place,arglist)  [list ]
set syndb(event,-root,type) "TKOPT"
set syndb(event,-root,hint)  ""
set syndb(event,-root,arglist)  [list ]
set syndb(event,-rootx,type) "TKOPT"
set syndb(event,-rootx,hint)  ""
set syndb(event,-rootx,arglist)  [list ]
set syndb(event,-rooty,type) "TKOPT"
set syndb(event,-rooty,hint)  ""
set syndb(event,-rooty,arglist)  [list ]
set syndb(event,-sendevent,type) "TKOPT"
set syndb(event,-sendevent,hint)  ""
set syndb(event,-sendevent,arglist)  [list ]
set syndb(event,-serial,type) "TKOPT"
set syndb(event,-serial,hint)  ""
set syndb(event,-serial,arglist)  [list ]
set syndb(event,-state,type) "TKOPT"
set syndb(event,-state,arglist)  [list normal disabled]
set syndb(event,-state,hint)  ""
set syndb(event,-subwindow,type) "TKOPT"
set syndb(event,-subwindow,hint)  ""
set syndb(event,-subwindow,arglist)  [list ]
set syndb(event,-time,type) "TKOPT"
set syndb(event,-time,hint)  ""
set syndb(event,-time,arglist)  [list ]
set syndb(event,-warp,type) "TKOPT"
set syndb(event,-warp,hint)  ""
set syndb(event,-warp,arglist)  [list ]
set syndb(event,-when,type) "TKOPT"
set syndb(event,-when,hint)  ""
set syndb(event,-when,arglist)  [list ]
set syndb(event,-width,type) "TKOPT"
set syndb(event,-width,hint)  ""
set syndb(event,-width,arglist)  [list ]
set syndb(event,-x,type) "TKOPT"
set syndb(event,-x,hint)  ""
set syndb(event,-x,arglist)  [list ]
set syndb(event,-y,type) "TKOPT"
set syndb(event,-y,hint)  ""
set syndb(event,-y,arglist)  [list ]
set syndb(event,add,type) "TKARG"
set syndb(event,add,hint)  "event add <<virtual>> sequence ?sequence ...?"
set syndb(event,add,arglist)  [list ]
set syndb(event,delete,type) "TKARG"
set syndb(event,delete,hint)  "event delete <<virtual>> ?sequence sequence ...?"
set syndb(event,delete,arglist)  [list ]
set syndb(event,generate,type) "TKARG"
set syndb(event,generate,hint)  "event generate window event ?option value option value ...?"
set syndb(event,generate,arglist)  [list -above -borderwidth -button -count -delta -detail -focus -height -keycode -keysym -mode -override -place -root -rootx -rooty -sendevent -serial -state -subwindow -time -warp -when -width -x -y add delete generate info]
set syndb(event,info,type) "TKARG"
set syndb(event,info,hint)  "event info ?<<virtual>>?"
set syndb(event,info,arglist)  [list ]

set syndb(focus,focus,type) "TKCMD"
set syndb(focus,focus,hint) "focus | focus window | focus option ?arg arg ...?"
set syndb(focus,focus,arglist) [list -displayof -force -lastfor]
set syndb(focus,-displayof,type) "TKOPT"
set syndb(focus,-displayof,hint)  ""
set syndb(focus,-displayof,arglist)  [list ]
set syndb(focus,-force,type) "TKOPT"
set syndb(focus,-force,hint)  ""
set syndb(focus,-force,arglist)  [list ]
set syndb(focus,-lastfor,type) "TKOPT"
set syndb(focus,-lastfor,hint)  ""
set syndb(focus,-lastfor,arglist)  [list ]

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

set syndb(frame,frame,type) "TKCMD"
set syndb(frame,frame,hint) "frame pathName ?options?"
set syndb(frame,frame,arglist) [list -background -bd -borderwidth -class -colormap -container -cursor -height -highlightbackground -highlightcolor -highlightthickness -padx -pady -relief -takefocus -visual -width]
set syndb(frame,-background,type) "TKOPT"
set syndb(frame,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(frame,-background,hint)  ""
set syndb(frame,-bd,type) "TKOPT"
set syndb(frame,-bd,hint)  ""
set syndb(frame,-bd,arglist)  [list ]
set syndb(frame,-borderwidth,type) "TKOPT"
set syndb(frame,-borderwidth,hint)  ""
set syndb(frame,-borderwidth,arglist)  [list ]
set syndb(frame,-class,type) "TKOPT"
set syndb(frame,-class,hint)  ""
set syndb(frame,-class,arglist)  [list ]
set syndb(frame,-colormap,type) "TKOPT"
set syndb(frame,-colormap,hint)  ""
set syndb(frame,-colormap,arglist)  [list ]
set syndb(frame,-container,type) "TKOPT"
set syndb(frame,-container,hint)  ""
set syndb(frame,-container,arglist)  [list ]
set syndb(frame,-cursor,type) "TKOPT"
set syndb(frame,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(frame,-cursor,hint)  ""
set syndb(frame,-height,type) "TKOPT"
set syndb(frame,-height,hint)  ""
set syndb(frame,-height,arglist)  [list ]
set syndb(frame,-highlightbackground,type) "TKOPT"
set syndb(frame,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(frame,-highlightbackground,hint)  ""
set syndb(frame,-highlightcolor,type) "TKOPT"
set syndb(frame,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(frame,-highlightcolor,hint)  ""
set syndb(frame,-highlightthickness,type) "TKOPT"
set syndb(frame,-highlightthickness,hint)  ""
set syndb(frame,-highlightthickness,arglist)  [list ]
set syndb(frame,-padx,type) "TKOPT"
set syndb(frame,-padx,hint)  ""
set syndb(frame,-padx,arglist)  [list ]
set syndb(frame,-pady,type) "TKOPT"
set syndb(frame,-pady,hint)  ""
set syndb(frame,-pady,arglist)  [list ]
set syndb(frame,-relief,type) "TKOPT"
set syndb(frame,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(frame,-relief,hint)  ""
set syndb(frame,-takefocus,type) "TKOPT"
set syndb(frame,-takefocus,hint)  ""
set syndb(frame,-takefocus,arglist)  [list ]
set syndb(frame,-visual,type) "TKOPT"
set syndb(frame,-visual,hint)  ""
set syndb(frame,-visual,arglist)  [list ]
set syndb(frame,-width,type) "TKOPT"
set syndb(frame,-width,hint)  ""
set syndb(frame,-width,arglist)  [list ]

set syndb(grab,grab,type) "TKCMD"
set syndb(grab,grab,hint) "grab ?-global? window"
set syndb(grab,grab,arglist) [list -global current release set status]
set syndb(grab,-global,type) "TKOPT"
set syndb(grab,-global,hint)  ""
set syndb(grab,-global,arglist)  [list ]
set syndb(grab,current,type) "TKARG"
set syndb(grab,current,hint)  "grab current window"
set syndb(grab,current,arglist)  [list ]
set syndb(grab,release,type) "TKARG"
set syndb(grab,release,hint)  "grab release window"
set syndb(grab,release,arglist)  [list ]
set syndb(grab,set,type) "TKARG"
set syndb(grab,set,hint)  "grab set ?-global? window"
set syndb(grab,set,arglist)  [list ]
set syndb(grab,status,type) "TKARG"
set syndb(grab,status,hint)  "grab status window"
set syndb(grab,status,arglist)  [list ]

set syndb(grid,grid,type) "TKCMD"
set syndb(grid,grid,hint) "grid slave ?slave ...? ?options?"
set syndb(grid,grid,arglist) [list -column -columnspan -in -ipadx -ipady -padx -pady -row -rowspan -sticky bbox columnconfigure configure forget info location propagate remove rowconfigure size slaves]
set syndb(grid,grid,colorlist) [list -minsize -pad -uniform -weight ]
set syndb(grid,grid,colortype) "TKOPT"
set syndb(grid,-column,type) "TKOPT"
set syndb(grid,-column,hint)  ""
set syndb(grid,-column,arglist)  [list ]
set syndb(grid,-columnspan,type) "TKOPT"
set syndb(grid,-columnspan,hint)  ""
set syndb(grid,-columnspan,arglist)  [list ]
set syndb(grid,-in,type) "TKOPT"
set syndb(grid,-in,hint)  ""
set syndb(grid,-in,arglist)  [list ]
set syndb(grid,-ipadx,type) "TKOPT"
set syndb(grid,-ipadx,hint)  ""
set syndb(grid,-ipadx,arglist)  [list ]
set syndb(grid,-ipady,type) "TKOPT"
set syndb(grid,-ipady,hint)  ""
set syndb(grid,-ipady,arglist)  [list ]
set syndb(grid,-padx,type) "TKOPT"
set syndb(grid,-padx,hint)  ""
set syndb(grid,-padx,arglist)  [list ]
set syndb(grid,-pady,type) "TKOPT"
set syndb(grid,-pady,hint)  ""
set syndb(grid,-pady,arglist)  [list ]
set syndb(grid,-row,type) "TKOPT"
set syndb(grid,-row,hint)  ""
set syndb(grid,-row,arglist)  [list ]
set syndb(grid,-rowspan,type) "TKOPT"
set syndb(grid,-rowspan,hint)  ""
set syndb(grid,-rowspan,arglist)  [list ]
set syndb(grid,-sticky,type) "TKOPT"
set syndb(grid,-sticky,hint)  ""
set syndb(grid,-sticky,arglist)  [list ]
set syndb(grid,bbox,type) "TKARG"
set syndb(grid,bbox,hint)  "grid bbox master ?column row? ?column2 row2?"
set syndb(grid,bbox,arglist)  [list ]
set syndb(grid,columnconfigure,type) "TKARG"
set syndb(grid,columnconfigure,hint)  "grid columnconfigure master index ?-option value...?"
set syndb(grid,columnconfigure,arglist)  [list -minsize -pad -uniform -weight ]
set syndb(grid,configure,type) "TKARG"
set syndb(grid,configure,hint)  "grid configure slave ?slave ...? ?options?"
set syndb(grid,configure,arglist)  [list ]
set syndb(grid,forget,type) "TKARG"
set syndb(grid,forget,hint)  "grid forget slave ?slave ...?"
set syndb(grid,forget,arglist)  [list ]
set syndb(grid,info,type) "TKARG"
set syndb(grid,info,hint)  "grid info slave"
set syndb(grid,info,arglist)  [list ]
set syndb(grid,location,type) "TKARG"
set syndb(grid,location,hint)  "grid location master x y"
set syndb(grid,location,arglist)  [list ]
set syndb(grid,propagate,type) "TKARG"
set syndb(grid,propagate,hint)  "grid propagate master ?boolean?"
set syndb(grid,propagate,arglist)  [list ]
set syndb(grid,remove,type) "TKARG"
set syndb(grid,remove,hint)  "grid remove slave ?slave ...?"
set syndb(grid,remove,arglist)  [list ]
set syndb(grid,rowconfigure,type) "TKARG"
set syndb(grid,rowconfigure,hint)  "grid rowconfigure master index ?-option value...?"
set syndb(grid,rowconfigure,arglist)  [list -minsize -pad -uniform -weight ]
set syndb(grid,size,type) "TKARG"
set syndb(grid,size,hint)  "grid size master"
set syndb(grid,size,arglist)  [list ]
set syndb(grid,slaves,type) "TKARG"
set syndb(grid,slaves,hint)  "grid slaves master ?-option value?"
set syndb(grid,slaves,arglist)  [list ]

set syndb(label,label,type) "TKCMD"
set syndb(label,label,hint) "label pathName ?options?"
set syndb(label,label,arglist) [list -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -compound -cursor -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -justify -padx -pady -relief -state -takefocus -text -textvariable -underline -width -wraplength]
set syndb(label,-activebackground,type) "TKOPT"
set syndb(label,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(label,-activebackground,hint)  ""
set syndb(label,-activeforeground,type) "TKOPT"
set syndb(label,-activeforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(label,-activeforeground,hint)  ""
set syndb(label,-anchor,type) "TKOPT"
set syndb(label,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(label,-anchor,hint)  ""
set syndb(label,-background,type) "TKOPT"
set syndb(label,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(label,-background,hint)  ""
set syndb(label,-bd,type) "TKOPT"
set syndb(label,-bd,hint)  ""
set syndb(label,-bd,arglist)  [list ]
set syndb(label,-bg,type) "TKOPT"
set syndb(label,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(label,-bg,hint)  ""
set syndb(label,-bitmap,type) "TKOPT"
set syndb(label,-bitmap,arglist)  [list {[ez_chooseBitmap]}]
set syndb(label,-bitmap,hint)  ""
set syndb(label,-borderwidth,type) "TKOPT"
set syndb(label,-borderwidth,hint)  ""
set syndb(label,-borderwidth,arglist)  [list ]
set syndb(label,-compound,type) "TKOPT"
set syndb(label,-compound,arglist)  [list none bottom top left right center]
set syndb(label,-compound,hint)  ""
set syndb(label,-cursor,type) "TKOPT"
set syndb(label,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(label,-cursor,hint)  ""
set syndb(label,-disabledforeground,type) "TKOPT"
set syndb(label,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(label,-disabledforeground,hint)  ""
set syndb(label,-fg,type) "TKOPT"
set syndb(label,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(label,-fg,hint)  ""
set syndb(label,-font,type) "TKOPT"
set syndb(label,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(label,-font,hint)  ""
set syndb(label,-foreground,type) "TKOPT"
set syndb(label,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(label,-foreground,hint)  ""
set syndb(label,-height,type) "TKOPT"
set syndb(label,-height,hint)  ""
set syndb(label,-height,arglist)  [list ]
set syndb(label,-highlightbackground,type) "TKOPT"
set syndb(label,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(label,-highlightbackground,hint)  ""
set syndb(label,-highlightcolor,type) "TKOPT"
set syndb(label,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(label,-highlightcolor,hint)  ""
set syndb(label,-highlightthickness,type) "TKOPT"
set syndb(label,-highlightthickness,hint)  ""
set syndb(label,-highlightthickness,arglist)  [list ]
set syndb(label,-image,type) "TKOPT"
set syndb(label,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(label,-image,hint)  ""
set syndb(label,-justify,type) "TKOPT"
set syndb(label,-justify,arglist)  [list center left right]
set syndb(label,-justify,hint)  ""
set syndb(label,-padx,type) "TKOPT"
set syndb(label,-padx,hint)  ""
set syndb(label,-padx,arglist)  [list ]
set syndb(label,-pady,type) "TKOPT"
set syndb(label,-pady,hint)  ""
set syndb(label,-pady,arglist)  [list ]
set syndb(label,-relief,type) "TKOPT"
set syndb(label,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(label,-relief,hint)  ""
set syndb(label,-state,type) "TKOPT"
set syndb(label,-state,arglist)  [list normal disabled]
set syndb(label,-state,hint)  ""
set syndb(label,-takefocus,type) "TKOPT"
set syndb(label,-takefocus,hint)  ""
set syndb(label,-takefocus,arglist)  [list ]
set syndb(label,-text,type) "TKOPT"
set syndb(label,-text,hint)  ""
set syndb(label,-text,arglist)  [list ]
set syndb(label,-textvariable,type) "TKOPT"
set syndb(label,-textvariable,hint)  ""
set syndb(label,-textvariable,arglist)  [list ]
set syndb(label,-underline,type) "TKOPT"
set syndb(label,-underline,hint)  ""
set syndb(label,-underline,arglist)  [list ]
set syndb(label,-width,type) "TKOPT"
set syndb(label,-width,hint)  ""
set syndb(label,-width,arglist)  [list ]
set syndb(label,-wraplength,type) "TKOPT"
set syndb(label,-wraplength,hint)  ""
set syndb(label,-wraplength,arglist)  [list ]

set syndb(labelframe,labelframe,type) "TKCMD"
set syndb(labelframe,labelframe,hint) "labelframe pathName ?options?"
set syndb(labelframe,labelframe,arglist) [list -background -bd -borderwidth -class -colormap -container -cursor -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -labelanchor -labelwidget -padx -pady -relief -takefocus -text -visual -width]
set syndb(labelframe,-background,type) "TKOPT"
set syndb(labelframe,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(labelframe,-background,hint)  ""
set syndb(labelframe,-bd,type) "TKOPT"
set syndb(labelframe,-bd,hint)  ""
set syndb(labelframe,-bd,arglist)  [list ]
set syndb(labelframe,-borderwidth,type) "TKOPT"
set syndb(labelframe,-borderwidth,hint)  ""
set syndb(labelframe,-borderwidth,arglist)  [list ]
set syndb(labelframe,-class,type) "TKOPT"
set syndb(labelframe,-class,hint)  ""
set syndb(labelframe,-class,arglist)  [list ]
set syndb(labelframe,-colormap,type) "TKOPT"
set syndb(labelframe,-colormap,hint)  ""
set syndb(labelframe,-colormap,arglist)  [list ]
set syndb(labelframe,-container,type) "TKOPT"
set syndb(labelframe,-container,hint)  ""
set syndb(labelframe,-container,arglist)  [list ]
set syndb(labelframe,-cursor,type) "TKOPT"
set syndb(labelframe,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(labelframe,-cursor,hint)  ""
set syndb(labelframe,-fg,type) "TKOPT"
set syndb(labelframe,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(labelframe,-fg,hint)  ""
set syndb(labelframe,-font,type) "TKOPT"
set syndb(labelframe,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(labelframe,-font,hint)  ""
set syndb(labelframe,-foreground,type) "TKOPT"
set syndb(labelframe,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(labelframe,-foreground,hint)  ""
set syndb(labelframe,-height,type) "TKOPT"
set syndb(labelframe,-height,hint)  ""
set syndb(labelframe,-height,arglist)  [list ]
set syndb(labelframe,-highlightbackground,type) "TKOPT"
set syndb(labelframe,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(labelframe,-highlightbackground,hint)  ""
set syndb(labelframe,-highlightcolor,type) "TKOPT"
set syndb(labelframe,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(labelframe,-highlightcolor,hint)  ""
set syndb(labelframe,-highlightthickness,type) "TKOPT"
set syndb(labelframe,-highlightthickness,hint)  ""
set syndb(labelframe,-highlightthickness,arglist)  [list ]
set syndb(labelframe,-labelanchor,type) "TKOPT"
set syndb(labelframe,-labelanchor,hint)  ""
set syndb(labelframe,-labelanchor,arglist)  [list ]
set syndb(labelframe,-labelwidget,type) "TKOPT"
set syndb(labelframe,-labelwidget,hint)  ""
set syndb(labelframe,-labelwidget,arglist)  [list ]
set syndb(labelframe,-padx,type) "TKOPT"
set syndb(labelframe,-padx,hint)  ""
set syndb(labelframe,-padx,arglist)  [list ]
set syndb(labelframe,-pady,type) "TKOPT"
set syndb(labelframe,-pady,hint)  ""
set syndb(labelframe,-pady,arglist)  [list ]
set syndb(labelframe,-relief,type) "TKOPT"
set syndb(labelframe,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(labelframe,-relief,hint)  ""
set syndb(labelframe,-takefocus,type) "TKOPT"
set syndb(labelframe,-takefocus,hint)  ""
set syndb(labelframe,-takefocus,arglist)  [list ]
set syndb(labelframe,-text,type) "TKOPT"
set syndb(labelframe,-text,hint)  ""
set syndb(labelframe,-text,arglist)  [list ]
set syndb(labelframe,-visual,type) "TKOPT"
set syndb(labelframe,-visual,hint)  ""
set syndb(labelframe,-visual,arglist)  [list ]
set syndb(labelframe,-width,type) "TKOPT"
set syndb(labelframe,-width,hint)  ""
set syndb(labelframe,-width,arglist)  [list ]

set syndb(listbox,listbox,type) "TKCMD"
set syndb(listbox,listbox,hint) "listbox pathName ?options?"
set syndb(listbox,listbox,arglist) [list -activestyle -background -bd -bg -borderwidth -cursor -disabledforeground -exportselection -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -listvariable -relief -selectbackground -selectborderwidth -selectforeground -selectmode -setgrid -state -takefocus -width -xscrollcommand -yscrollcommand]
set syndb(listbox,-activestyle,type) "TKOPT"
set syndb(listbox,-activestyle,hint)  ""
set syndb(listbox,-activestyle,arglist)  [list ]
set syndb(listbox,-background,type) "TKOPT"
set syndb(listbox,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(listbox,-background,hint)  ""
set syndb(listbox,-bd,type) "TKOPT"
set syndb(listbox,-bd,hint)  ""
set syndb(listbox,-bd,arglist)  [list ]
set syndb(listbox,-bg,type) "TKOPT"
set syndb(listbox,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(listbox,-bg,hint)  ""
set syndb(listbox,-borderwidth,type) "TKOPT"
set syndb(listbox,-borderwidth,hint)  ""
set syndb(listbox,-borderwidth,arglist)  [list ]
set syndb(listbox,-cursor,type) "TKOPT"
set syndb(listbox,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(listbox,-cursor,hint)  ""
set syndb(listbox,-disabledforeground,type) "TKOPT"
set syndb(listbox,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(listbox,-disabledforeground,hint)  ""
set syndb(listbox,-exportselection,type) "TKOPT"
set syndb(listbox,-exportselection,hint)  ""
set syndb(listbox,-exportselection,arglist)  [list ]
set syndb(listbox,-font,type) "TKOPT"
set syndb(listbox,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(listbox,-font,hint)  ""
set syndb(listbox,-foreground,type) "TKOPT"
set syndb(listbox,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(listbox,-foreground,hint)  ""
set syndb(listbox,-height,type) "TKOPT"
set syndb(listbox,-height,hint)  ""
set syndb(listbox,-height,arglist)  [list ]
set syndb(listbox,-highlightbackground,type) "TKOPT"
set syndb(listbox,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(listbox,-highlightbackground,hint)  ""
set syndb(listbox,-highlightcolor,type) "TKOPT"
set syndb(listbox,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(listbox,-highlightcolor,hint)  ""
set syndb(listbox,-highlightthickness,type) "TKOPT"
set syndb(listbox,-highlightthickness,hint)  ""
set syndb(listbox,-highlightthickness,arglist)  [list ]
set syndb(listbox,-listvariable,type) "TKOPT"
set syndb(listbox,-listvariable,hint)  ""
set syndb(listbox,-listvariable,arglist)  [list ]
set syndb(listbox,-relief,type) "TKOPT"
set syndb(listbox,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(listbox,-relief,hint)  ""
set syndb(listbox,-selectbackground,type) "TKOPT"
set syndb(listbox,-selectbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(listbox,-selectbackground,hint)  ""
set syndb(listbox,-selectborderwidth,type) "TKOPT"
set syndb(listbox,-selectborderwidth,hint)  ""
set syndb(listbox,-selectborderwidth,arglist)  [list ]
set syndb(listbox,-selectforeground,type) "TKOPT"
set syndb(listbox,-selectforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(listbox,-selectforeground,hint)  ""
set syndb(listbox,-selectmode,type) "TKOPT"
set syndb(listbox,-selectmode,hint)  ""
set syndb(listbox,-selectmode,arglist)  [list ]
set syndb(listbox,-setgrid,type) "TKOPT"
set syndb(listbox,-setgrid,hint)  ""
set syndb(listbox,-setgrid,arglist)  [list ]
set syndb(listbox,-state,type) "TKOPT"
set syndb(listbox,-state,arglist)  [list normal disabled]
set syndb(listbox,-state,hint)  ""
set syndb(listbox,-takefocus,type) "TKOPT"
set syndb(listbox,-takefocus,hint)  ""
set syndb(listbox,-takefocus,arglist)  [list ]
set syndb(listbox,-width,type) "TKOPT"
set syndb(listbox,-width,hint)  ""
set syndb(listbox,-width,arglist)  [list ]
set syndb(listbox,-xscrollcommand,type) "TKOPT"
set syndb(listbox,-xscrollcommand,hint)  ""
set syndb(listbox,-xscrollcommand,arglist)  [list ]
set syndb(listbox,-yscrollcommand,type) "TKOPT"
set syndb(listbox,-yscrollcommand,hint)  ""
set syndb(listbox,-yscrollcommand,arglist)  [list ]

set syndb(loadTk,loadTk,type) "TKCMD"
set syndb(loadTk,loadTk,hint) "loadTk slave ?-use windowId? ?-display displayName? "
set syndb(loadTk,loadTk,arglist) [list -use -display]
set syndb(loadTk,-use,type) "TKOPT"
set syndb(loadTk,-use,hint)  ""
set syndb(loadTk,-use,arglist)  [list ]
set syndb(loadTk,-display,type) "TKOPT"
set syndb(loadTk,-display,hint)  ""
set syndb(loadTk,-display,arglist)  [list ]

set syndb(lower,lower,type) "TKCMD"
set syndb(lower,lower,hint) "lower window ?belowThis?"
set syndb(lower,lower,arglist) [list ]

set syndb(menu,menu,type) "TKCMD"
set syndb(menu,menu,hint) "menu pathName ?options?"
set syndb(menu,menu,arglist) [list -accelerator -activebackground -activeborderwidth -activeforeground -background -bd -bg -bitmap -borderwidth -columnbreak -command -compound -cursor -disabledforeground -font -foreground -hidemargin -image -indicatoron -label -menu -offvalue -onvalue -postcommand -relief -selectcolor -selectimage -state -takefocus -tearoff -tearoffcommand -title -type -underline -value -variable]
set syndb(menu,-accelerator,type) "TKOPT"
set syndb(menu,-accelerator,hint)  ""
set syndb(menu,-accelerator,arglist)  [list ]
set syndb(menu,-activebackground,type) "TKOPT"
set syndb(menu,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(menu,-activebackground,hint)  ""
set syndb(menu,-activeborderwidth,type) "TKOPT"
set syndb(menu,-activeborderwidth,hint)  ""
set syndb(menu,-activeborderwidth,arglist)  [list ]
set syndb(menu,-activeforeground,type) "TKOPT"
set syndb(menu,-activeforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(menu,-activeforeground,hint)  ""
set syndb(menu,-background,type) "TKOPT"
set syndb(menu,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(menu,-background,hint)  ""
set syndb(menu,-bd,type) "TKOPT"
set syndb(menu,-bd,hint)  ""
set syndb(menu,-bd,arglist)  [list ]
set syndb(menu,-bg,type) "TKOPT"
set syndb(menu,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(menu,-bg,hint)  ""
set syndb(menu,-bitmap,type) "TKOPT"
set syndb(menu,-bitmap,arglist)  [list {[ez_chooseBitmap]}]
set syndb(menu,-bitmap,hint)  ""
set syndb(menu,-borderwidth,type) "TKOPT"
set syndb(menu,-borderwidth,hint)  ""
set syndb(menu,-borderwidth,arglist)  [list ]
set syndb(menu,-columnbreak,type) "TKOPT"
set syndb(menu,-columnbreak,hint)  ""
set syndb(menu,-columnbreak,arglist)  [list ]
set syndb(menu,-command,type) "TKOPT"
set syndb(menu,-command,hint)  ""
set syndb(menu,-command,arglist)  [list ]
set syndb(menu,-compound,type) "TKOPT"
set syndb(menu,-compound,arglist)  [list none bottom top left right center]
set syndb(menu,-compound,hint)  ""
set syndb(menu,-cursor,type) "TKOPT"
set syndb(menu,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(menu,-cursor,hint)  ""
set syndb(menu,-disabledforeground,type) "TKOPT"
set syndb(menu,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(menu,-disabledforeground,hint)  ""
set syndb(menu,-font,type) "TKOPT"
set syndb(menu,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(menu,-font,hint)  ""
set syndb(menu,-foreground,type) "TKOPT"
set syndb(menu,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(menu,-foreground,hint)  ""
set syndb(menu,-hidemargin,type) "TKOPT"
set syndb(menu,-hidemargin,hint)  ""
set syndb(menu,-hidemargin,arglist)  [list ]
set syndb(menu,-image,type) "TKOPT"
set syndb(menu,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(menu,-image,hint)  ""
set syndb(menu,-indicatoron,type) "TKOPT"
set syndb(menu,-indicatoron,hint)  ""
set syndb(menu,-indicatoron,arglist)  [list ]
set syndb(menu,-label,type) "TKOPT"
set syndb(menu,-label,hint)  ""
set syndb(menu,-label,arglist)  [list ]
set syndb(menu,-menu,type) "TKOPT"
set syndb(menu,-menu,hint)  ""
set syndb(menu,-menu,arglist)  [list ]
set syndb(menu,-offvalue,type) "TKOPT"
set syndb(menu,-offvalue,hint)  ""
set syndb(menu,-offvalue,arglist)  [list ]
set syndb(menu,-onvalue,type) "TKOPT"
set syndb(menu,-onvalue,hint)  ""
set syndb(menu,-onvalue,arglist)  [list ]
set syndb(menu,-postcommand,type) "TKOPT"
set syndb(menu,-postcommand,hint)  ""
set syndb(menu,-postcommand,arglist)  [list ]
set syndb(menu,-relief,type) "TKOPT"
set syndb(menu,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(menu,-relief,hint)  ""
set syndb(menu,-selectcolor,type) "TKOPT"
set syndb(menu,-selectcolor,hint)  ""
set syndb(menu,-selectcolor,arglist)  [list ]
set syndb(menu,-selectimage,type) "TKOPT"
set syndb(menu,-selectimage,hint)  ""
set syndb(menu,-selectimage,arglist)  [list ]
set syndb(menu,-state,type) "TKOPT"
set syndb(menu,-state,arglist)  [list normal disabled]
set syndb(menu,-state,hint)  ""
set syndb(menu,-takefocus,type) "TKOPT"
set syndb(menu,-takefocus,hint)  ""
set syndb(menu,-takefocus,arglist)  [list ]
set syndb(menu,-tearoff,type) "TKOPT"
set syndb(menu,-tearoff,hint)  ""
set syndb(menu,-tearoff,arglist)  [list ]
set syndb(menu,-tearoffcommand,type) "TKOPT"
set syndb(menu,-tearoffcommand,hint)  ""
set syndb(menu,-tearoffcommand,arglist)  [list ]
set syndb(menu,-title,type) "TKOPT"
set syndb(menu,-title,hint)  ""
set syndb(menu,-title,arglist)  [list ]
set syndb(menu,-type,type) "TKOPT"
set syndb(menu,-type,hint)  ""
set syndb(menu,-type,arglist)  [list menubar tearoff normal]
set syndb(menu,-underline,type) "TKOPT"
set syndb(menu,-underline,hint)  ""
set syndb(menu,-underline,arglist)  [list ]
set syndb(menu,-value,type) "TKOPT"
set syndb(menu,-value,hint)  ""
set syndb(menu,-value,arglist)  [list ]
set syndb(menu,-variable,type) "TKOPT"
set syndb(menu,-variable,hint)  ""
set syndb(menu,-variable,arglist)  [list ]

set syndb(menubutton,menubutton,type) "TKCMD"
set syndb(menubutton,menubutton,hint) ""
set syndb(menubutton,menubutton,arglist) [list -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -compound -cursor -direction -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -indicatoron -justify -menu -padx -pady -relief -state -takefocus -text -textvariable -underline -width -wraplength]
set syndb(menubutton,-activebackground,type) "TKOPT"
set syndb(menubutton,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(menubutton,-activebackground,hint)  ""
set syndb(menubutton,-activeforeground,type) "TKOPT"
set syndb(menubutton,-activeforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(menubutton,-activeforeground,hint)  ""
set syndb(menubutton,-anchor,type) "TKOPT"
set syndb(menubutton,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(menubutton,-anchor,hint)  ""
set syndb(menubutton,-background,type) "TKOPT"
set syndb(menubutton,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(menubutton,-background,hint)  ""
set syndb(menubutton,-bd,type) "TKOPT"
set syndb(menubutton,-bd,hint)  ""
set syndb(menubutton,-bd,arglist)  [list ]
set syndb(menubutton,-bg,type) "TKOPT"
set syndb(menubutton,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(menubutton,-bg,hint)  ""
set syndb(menubutton,-bitmap,type) "TKOPT"
set syndb(menubutton,-bitmap,arglist)  [list {[ez_chooseBitmap]}]
set syndb(menubutton,-bitmap,hint)  ""
set syndb(menubutton,-borderwidth,type) "TKOPT"
set syndb(menubutton,-borderwidth,hint)  ""
set syndb(menubutton,-borderwidth,arglist)  [list ]
set syndb(menubutton,-compound,type) "TKOPT"
set syndb(menubutton,-compound,arglist)  [list none bottom top left right center]
set syndb(menubutton,-compound,hint)  ""
set syndb(menubutton,-cursor,type) "TKOPT"
set syndb(menubutton,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(menubutton,-cursor,hint)  ""
set syndb(menubutton,-direction,type) "TKOPT"
set syndb(menubutton,-direction,hint)  ""
set syndb(menubutton,-direction,arglist)  [list above below flush left right]
set syndb(menubutton,-disabledforeground,type) "TKOPT"
set syndb(menubutton,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(menubutton,-disabledforeground,hint)  ""
set syndb(menubutton,-fg,type) "TKOPT"
set syndb(menubutton,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(menubutton,-fg,hint)  ""
set syndb(menubutton,-font,type) "TKOPT"
set syndb(menubutton,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(menubutton,-font,hint)  ""
set syndb(menubutton,-foreground,type) "TKOPT"
set syndb(menubutton,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(menubutton,-foreground,hint)  ""
set syndb(menubutton,-height,type) "TKOPT"
set syndb(menubutton,-height,hint)  ""
set syndb(menubutton,-height,arglist)  [list ]
set syndb(menubutton,-highlightbackground,type) "TKOPT"
set syndb(menubutton,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(menubutton,-highlightbackground,hint)  ""
set syndb(menubutton,-highlightcolor,type) "TKOPT"
set syndb(menubutton,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(menubutton,-highlightcolor,hint)  ""
set syndb(menubutton,-highlightthickness,type) "TKOPT"
set syndb(menubutton,-highlightthickness,hint)  ""
set syndb(menubutton,-highlightthickness,arglist)  [list ]
set syndb(menubutton,-image,type) "TKOPT"
set syndb(menubutton,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(menubutton,-image,hint)  ""
set syndb(menubutton,-indicatoron,type) "TKOPT"
set syndb(menubutton,-indicatoron,hint)  ""
set syndb(menubutton,-indicatoron,arglist)  [list ]
set syndb(menubutton,-justify,type) "TKOPT"
set syndb(menubutton,-justify,arglist)  [list center left right]
set syndb(menubutton,-justify,hint)  ""
set syndb(menubutton,-menu,type) "TKOPT"
set syndb(menubutton,-menu,hint)  ""
set syndb(menubutton,-menu,arglist)  [list ]
set syndb(menubutton,-padx,type) "TKOPT"
set syndb(menubutton,-padx,hint)  ""
set syndb(menubutton,-padx,arglist)  [list ]
set syndb(menubutton,-pady,type) "TKOPT"
set syndb(menubutton,-pady,hint)  ""
set syndb(menubutton,-pady,arglist)  [list ]
set syndb(menubutton,-relief,type) "TKOPT"
set syndb(menubutton,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(menubutton,-relief,hint)  ""
set syndb(menubutton,-state,type) "TKOPT"
set syndb(menubutton,-state,arglist)  [list normal disabled]
set syndb(menubutton,-state,hint)  ""
set syndb(menubutton,-takefocus,type) "TKOPT"
set syndb(menubutton,-takefocus,hint)  ""
set syndb(menubutton,-takefocus,arglist)  [list ]
set syndb(menubutton,-text,type) "TKOPT"
set syndb(menubutton,-text,hint)  ""
set syndb(menubutton,-text,arglist)  [list ]
set syndb(menubutton,-textvariable,type) "TKOPT"
set syndb(menubutton,-textvariable,hint)  ""
set syndb(menubutton,-textvariable,arglist)  [list ]
set syndb(menubutton,-underline,type) "TKOPT"
set syndb(menubutton,-underline,hint)  ""
set syndb(menubutton,-underline,arglist)  [list ]
set syndb(menubutton,-width,type) "TKOPT"
set syndb(menubutton,-width,hint)  ""
set syndb(menubutton,-width,arglist)  [list ]
set syndb(menubutton,-wraplength,type) "TKOPT"
set syndb(menubutton,-wraplength,hint)  ""
set syndb(menubutton,-wraplength,arglist)  [list ]

set syndb(message,message,type) "TKCMD"
set syndb(message,message,hint) ""
set syndb(message,message,arglist) [list -anchor -aspect -background -bd -bg -borderwidth -cursor -fg -font -foreground -highlightbackground -highlightcolor -highlightthickness -justify -padx -pady -relief -takefocus -text -textvariable -width]
set syndb(message,-anchor,type) "TKOPT"
set syndb(message,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(message,-anchor,hint)  ""
set syndb(message,-aspect,type) "TKOPT"
set syndb(message,-aspect,hint)  ""
set syndb(message,-aspect,arglist)  [list ]
set syndb(message,-background,type) "TKOPT"
set syndb(message,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(message,-background,hint)  ""
set syndb(message,-bd,type) "TKOPT"
set syndb(message,-bd,hint)  ""
set syndb(message,-bd,arglist)  [list ]
set syndb(message,-bg,type) "TKOPT"
set syndb(message,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(message,-bg,hint)  ""
set syndb(message,-borderwidth,type) "TKOPT"
set syndb(message,-borderwidth,hint)  ""
set syndb(message,-borderwidth,arglist)  [list ]
set syndb(message,-cursor,type) "TKOPT"
set syndb(message,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(message,-cursor,hint)  ""
set syndb(message,-fg,type) "TKOPT"
set syndb(message,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(message,-fg,hint)  ""
set syndb(message,-font,type) "TKOPT"
set syndb(message,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(message,-font,hint)  ""
set syndb(message,-foreground,type) "TKOPT"
set syndb(message,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(message,-foreground,hint)  ""
set syndb(message,-highlightbackground,type) "TKOPT"
set syndb(message,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(message,-highlightbackground,hint)  ""
set syndb(message,-highlightcolor,type) "TKOPT"
set syndb(message,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(message,-highlightcolor,hint)  ""
set syndb(message,-highlightthickness,type) "TKOPT"
set syndb(message,-highlightthickness,hint)  ""
set syndb(message,-highlightthickness,arglist)  [list ]
set syndb(message,-justify,type) "TKOPT"
set syndb(message,-justify,arglist)  [list center left right]
set syndb(message,-justify,hint)  ""
set syndb(message,-padx,type) "TKOPT"
set syndb(message,-padx,hint)  ""
set syndb(message,-padx,arglist)  [list ]
set syndb(message,-pady,type) "TKOPT"
set syndb(message,-pady,hint)  ""
set syndb(message,-pady,arglist)  [list ]
set syndb(message,-relief,type) "TKOPT"
set syndb(message,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(message,-relief,hint)  ""
set syndb(message,-takefocus,type) "TKOPT"
set syndb(message,-takefocus,hint)  ""
set syndb(message,-takefocus,arglist)  [list ]
set syndb(message,-text,type) "TKOPT"
set syndb(message,-text,hint)  ""
set syndb(message,-text,arglist)  [list ]
set syndb(message,-textvariable,type) "TKOPT"
set syndb(message,-textvariable,hint)  ""
set syndb(message,-textvariable,arglist)  [list ]
set syndb(message,-width,type) "TKOPT"
set syndb(message,-width,hint)  ""
set syndb(message,-width,arglist)  [list ]

set syndb(option,option,type) "TKCMD"
set syndb(option,option,hint) ""
set syndb(option,option,arglist) [list add clear get readfile]
set syndb(option,add,type) "TKARG"
set syndb(option,add,hint)  ""
set syndb(option,add,arglist)  [list ]
set syndb(option,clear,type) "TKARG"
set syndb(option,clear,hint)  ""
set syndb(option,clear,arglist)  [list ]
set syndb(option,get,type) "TKARG"
set syndb(option,get,hint)  ""
set syndb(option,get,arglist)  [list ]
set syndb(option,readfile,type) "TKARG"
set syndb(option,readfile,hint)  ""
set syndb(option,readfile,arglist)  [list ]

set syndb(options,options,type) "TKCMD"
set syndb(options,options,hint) ""
set syndb(options,options,arglist) [list -activebackground -activeborderwidth -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -compound -cursor -disabledforeground -exportselection -fg -font -foreground -highlightbackground -highlightcolor -highlightthickness -image -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -jump -justify -orient -padx -pady -relief -repeatdelay -repeatinterval -selectbackground -selectborderwidth -selectforeground -setgrid -takefocus -text -textvariable -troughcolor -underline -wraplength -xscrollcommand -yscrollcommand]
set syndb(options,-activebackground,type) "TKOPT"
set syndb(options,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-activebackground,hint)  ""
set syndb(options,-activeborderwidth,type) "TKOPT"
set syndb(options,-activeborderwidth,hint)  ""
set syndb(options,-activeborderwidth,arglist)  [list ]
set syndb(options,-activeforeground,type) "TKOPT"
set syndb(options,-activeforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-activeforeground,hint)  ""
set syndb(options,-anchor,type) "TKOPT"
set syndb(options,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(options,-anchor,hint)  ""
set syndb(options,-background,type) "TKOPT"
set syndb(options,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-background,hint)  ""
set syndb(options,-bd,type) "TKOPT"
set syndb(options,-bd,hint)  ""
set syndb(options,-bd,arglist)  [list ]
set syndb(options,-bg,type) "TKOPT"
set syndb(options,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-bg,hint)  ""
set syndb(options,-bitmap,type) "TKOPT"
set syndb(options,-bitmap,arglist)  [list {[ez_chooseBitmap]}]
set syndb(options,-bitmap,hint)  ""
set syndb(options,-borderwidth,type) "TKOPT"
set syndb(options,-borderwidth,hint)  ""
set syndb(options,-borderwidth,arglist)  [list ]
set syndb(options,-compound,type) "TKOPT"
set syndb(options,-compound,arglist)  [list none bottom top left right center]
set syndb(options,-compound,hint)  ""
set syndb(options,-cursor,type) "TKOPT"
set syndb(options,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(options,-cursor,hint)  ""
set syndb(options,-disabledforeground,type) "TKOPT"
set syndb(options,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-disabledforeground,hint)  ""
set syndb(options,-exportselection,type) "TKOPT"
set syndb(options,-exportselection,hint)  ""
set syndb(options,-exportselection,arglist)  [list ]
set syndb(options,-fg,type) "TKOPT"
set syndb(options,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-fg,hint)  ""
set syndb(options,-font,type) "TKOPT"
set syndb(options,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(options,-font,hint)  ""
set syndb(options,-foreground,type) "TKOPT"
set syndb(options,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-foreground,hint)  ""
set syndb(options,-highlightbackground,type) "TKOPT"
set syndb(options,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-highlightbackground,hint)  ""
set syndb(options,-highlightcolor,type) "TKOPT"
set syndb(options,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-highlightcolor,hint)  ""
set syndb(options,-highlightthickness,type) "TKOPT"
set syndb(options,-highlightthickness,hint)  ""
set syndb(options,-highlightthickness,arglist)  [list ]
set syndb(options,-image,type) "TKOPT"
set syndb(options,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(options,-image,hint)  ""
set syndb(options,-insertbackground,type) "TKOPT"
set syndb(options,-insertbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-insertbackground,hint)  ""
set syndb(options,-insertborderwidth,type) "TKOPT"
set syndb(options,-insertborderwidth,hint)  ""
set syndb(options,-insertborderwidth,arglist)  [list ]
set syndb(options,-insertofftime,type) "TKOPT"
set syndb(options,-insertofftime,hint)  ""
set syndb(options,-insertofftime,arglist)  [list ]
set syndb(options,-insertontime,type) "TKOPT"
set syndb(options,-insertontime,hint)  ""
set syndb(options,-insertontime,arglist)  [list ]
set syndb(options,-insertwidth,type) "TKOPT"
set syndb(options,-insertwidth,hint)  ""
set syndb(options,-insertwidth,arglist)  [list ]
set syndb(options,-jump,type) "TKOPT"
set syndb(options,-jump,hint)  ""
set syndb(options,-jump,arglist)  [list ]
set syndb(options,-justify,type) "TKOPT"
set syndb(options,-justify,arglist)  [list center left right]
set syndb(options,-justify,hint)  ""
set syndb(options,-orient,type) "TKOPT"
set syndb(options,-orient,arglist)  [list horizontal vertical]
set syndb(options,-orient,hint)  ""
set syndb(options,-padx,type) "TKOPT"
set syndb(options,-padx,hint)  ""
set syndb(options,-padx,arglist)  [list ]
set syndb(options,-pady,type) "TKOPT"
set syndb(options,-pady,hint)  ""
set syndb(options,-pady,arglist)  [list ]
set syndb(options,-relief,type) "TKOPT"
set syndb(options,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(options,-relief,hint)  ""
set syndb(options,-repeatdelay,type) "TKOPT"
set syndb(options,-repeatdelay,hint)  ""
set syndb(options,-repeatdelay,arglist)  [list ]
set syndb(options,-repeatinterval,type) "TKOPT"
set syndb(options,-repeatinterval,hint)  ""
set syndb(options,-repeatinterval,arglist)  [list ]
set syndb(options,-selectbackground,type) "TKOPT"
set syndb(options,-selectbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-selectbackground,hint)  ""
set syndb(options,-selectborderwidth,type) "TKOPT"
set syndb(options,-selectborderwidth,hint)  ""
set syndb(options,-selectborderwidth,arglist)  [list ]
set syndb(options,-selectforeground,type) "TKOPT"
set syndb(options,-selectforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-selectforeground,hint)  ""
set syndb(options,-setgrid,type) "TKOPT"
set syndb(options,-setgrid,hint)  ""
set syndb(options,-setgrid,arglist)  [list ]
set syndb(options,-takefocus,type) "TKOPT"
set syndb(options,-takefocus,hint)  ""
set syndb(options,-takefocus,arglist)  [list ]
set syndb(options,-text,type) "TKOPT"
set syndb(options,-text,hint)  ""
set syndb(options,-text,arglist)  [list ]
set syndb(options,-textvariable,type) "TKOPT"
set syndb(options,-textvariable,hint)  ""
set syndb(options,-textvariable,arglist)  [list ]
set syndb(options,-troughcolor,type) "TKOPT"
set syndb(options,-troughcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(options,-troughcolor,hint)  ""
set syndb(options,-underline,type) "TKOPT"
set syndb(options,-underline,hint)  ""
set syndb(options,-underline,arglist)  [list ]
set syndb(options,-wraplength,type) "TKOPT"
set syndb(options,-wraplength,hint)  ""
set syndb(options,-wraplength,arglist)  [list ]
set syndb(options,-xscrollcommand,type) "TKOPT"
set syndb(options,-xscrollcommand,hint)  ""
set syndb(options,-xscrollcommand,arglist)  [list ]
set syndb(options,-yscrollcommand,type) "TKOPT"
set syndb(options,-yscrollcommand,hint)  ""
set syndb(options,-yscrollcommand,arglist)  [list ]

set syndb(pack,pack,type) "TKCMD"
set syndb(pack,pack,hint) "pack (option | slave) arg ?arg ...?"
set syndb(pack,pack,arglist) [list -after -anchor -before -expand -fill -in -ipadx -ipady -padx -pady -side configure forget info propagate slaves]
set syndb(pack,-after,type) "TKOPT"
set syndb(pack,-after,hint)  ""
set syndb(pack,-after,arglist)  [list ]
set syndb(pack,-anchor,type) "TKOPT"
set syndb(pack,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(pack,-anchor,hint)  ""
set syndb(pack,-before,type) "TKOPT"
set syndb(pack,-before,hint)  ""
set syndb(pack,-before,arglist)  [list ]
set syndb(pack,-expand,type) "TKOPT"
set syndb(pack,-expand,hint)  ""
set syndb(pack,-expand,arglist)  [list 0 1]
set syndb(pack,-fill,type) "TKOPT"
set syndb(pack,-fill,hint)  ""
set syndb(pack,-fill,arglist)  [list none both x y]
set syndb(pack,-in,type) "TKOPT"
set syndb(pack,-in,hint)  ""
set syndb(pack,-in,arglist)  [list ]
set syndb(pack,-ipadx,type) "TKOPT"
set syndb(pack,-ipadx,hint)  ""
set syndb(pack,-ipadx,arglist)  [list ]
set syndb(pack,-ipady,type) "TKOPT"
set syndb(pack,-ipady,hint)  ""
set syndb(pack,-ipady,arglist)  [list ]
set syndb(pack,-padx,type) "TKOPT"
set syndb(pack,-padx,hint)  ""
set syndb(pack,-padx,arglist)  [list ]
set syndb(pack,-pady,type) "TKOPT"
set syndb(pack,-pady,hint)  ""
set syndb(pack,-pady,arglist)  [list ]
set syndb(pack,-side,type) "TKOPT"
set syndb(pack,-side,hint)  ""
set syndb(pack,-side,arglist)  [list bottom left right top]
set syndb(pack,configure,type) "TKARG"
set syndb(pack,configure,hint)  "pack configure slave ?slave ...? ?options?"
set syndb(pack,configure,arglist)  [list -after -anchor -before -expand -fill -in -ipadx -ipady -padx -pady -side]
set syndb(pack,forget,type) "TKARG"
set syndb(pack,forget,hint)  "pack forget slave ?slave ...?"
set syndb(pack,forget,arglist)  [list ]
set syndb(pack,info,type) "TKARG"
set syndb(pack,info,hint)  "pack info slave"
set syndb(pack,info,arglist)  [list ]
set syndb(pack,propagate,type) "TKARG"
set syndb(pack,propagate,hint)  "pack propagate master ?boolean?"
set syndb(pack,propagate,arglist)  [list ]
set syndb(pack,slave,type) "TKARG"
set syndb(pack,slave,hint)  ""
set syndb(pack,slave,arglist)  [list ]
set syndb(pack,slaves,type) "TKARG"
set syndb(pack,slaves,hint)  "pack slaves master"
set syndb(pack,slaves,arglist)  [list ]

set syndb(panedwindow,panedwindow,type) "TKCMD"
set syndb(panedwindow,panedwindow,hint) "panedwindow pathName ?options?"
set syndb(panedwindow,panedwindow,arglist) [list -background -bd -bg -borderwidth -cursor -handlepad -handlesize -height -opaqueresize -orient -relief -sashcursor -sashpad -sashrelief -sashwidth -showhandle -width]
set syndb(panedwindow,-background,type) "TKOPT"
set syndb(panedwindow,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(panedwindow,-background,hint)  ""
set syndb(panedwindow,-bd,type) "TKOPT"
set syndb(panedwindow,-bd,hint)  ""
set syndb(panedwindow,-bd,arglist)  [list ]
set syndb(panedwindow,-bg,type) "TKOPT"
set syndb(panedwindow,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(panedwindow,-bg,hint)  ""
set syndb(panedwindow,-borderwidth,type) "TKOPT"
set syndb(panedwindow,-borderwidth,hint)  ""
set syndb(panedwindow,-borderwidth,arglist)  [list ]
set syndb(panedwindow,-cursor,type) "TKOPT"
set syndb(panedwindow,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(panedwindow,-cursor,hint)  ""
set syndb(panedwindow,-handlepad,type) "TKOPT"
set syndb(panedwindow,-handlepad,hint)  ""
set syndb(panedwindow,-handlepad,arglist)  [list ]
set syndb(panedwindow,-handlesize,type) "TKOPT"
set syndb(panedwindow,-handlesize,hint)  ""
set syndb(panedwindow,-handlesize,arglist)  [list ]
set syndb(panedwindow,-height,type) "TKOPT"
set syndb(panedwindow,-height,hint)  ""
set syndb(panedwindow,-height,arglist)  [list ]
set syndb(panedwindow,-opaqueresize,type) "TKOPT"
set syndb(panedwindow,-opaqueresize,hint)  ""
set syndb(panedwindow,-opaqueresize,arglist)  [list ]
set syndb(panedwindow,-orient,type) "TKOPT"
set syndb(panedwindow,-orient,arglist)  [list horizontal vertical]
set syndb(panedwindow,-orient,hint)  ""
set syndb(panedwindow,-relief,type) "TKOPT"
set syndb(panedwindow,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(panedwindow,-relief,hint)  ""
set syndb(panedwindow,-sashcursor,type) "TKOPT"
set syndb(panedwindow,-sashcursor,hint)  ""
set syndb(panedwindow,-sashcursor,arglist)  [list ]
set syndb(panedwindow,-sashpad,type) "TKOPT"
set syndb(panedwindow,-sashpad,hint)  ""
set syndb(panedwindow,-sashpad,arglist)  [list ]
set syndb(panedwindow,-sashrelief,type) "TKOPT"
set syndb(panedwindow,-sashrelief,hint)  ""
set syndb(panedwindow,-sashrelief,arglist)  [list ]
set syndb(panedwindow,-sashwidth,type) "TKOPT"
set syndb(panedwindow,-sashwidth,hint)  ""
set syndb(panedwindow,-sashwidth,arglist)  [list ]
set syndb(panedwindow,-showhandle,type) "TKOPT"
set syndb(panedwindow,-showhandle,hint)  ""
set syndb(panedwindow,-showhandle,arglist)  [list ]
set syndb(panedwindow,-width,type) "TKOPT"
set syndb(panedwindow,-width,hint)  ""
set syndb(panedwindow,-width,arglist)  [list ]

set syndb(photo,photo,type) "TKCMD"
set syndb(photo,photo,hint) ""
set syndb(photo,photo,arglist) [list -data -file -format -gamma -height -palette -width]
set syndb(photo,-data,type) "TKOPT"
set syndb(photo,-data,hint)  ""
set syndb(photo,-data,arglist)  [list ]
set syndb(photo,-file,type) "TKOPT"
set syndb(photo,-file,hint)  ""
set syndb(photo,-file,arglist)  [list ]
set syndb(photo,-format,type) "TKOPT"
set syndb(photo,-format,hint)  ""
set syndb(photo,-format,arglist)  [list ]
set syndb(photo,-gamma,type) "TKOPT"
set syndb(photo,-gamma,hint)  ""
set syndb(photo,-gamma,arglist)  [list ]
set syndb(photo,-height,type) "TKOPT"
set syndb(photo,-height,hint)  ""
set syndb(photo,-height,arglist)  [list ]
set syndb(photo,-palette,type) "TKOPT"
set syndb(photo,-palette,hint)  ""
set syndb(photo,-palette,arglist)  [list ]
set syndb(photo,-width,type) "TKOPT"
set syndb(photo,-width,hint)  ""
set syndb(photo,-width,arglist)  [list ]

set syndb(place,place,type) "TKCMD"
set syndb(place,place,hint) "place (option | window) arg ?arg ...?"
set syndb(place,place,arglist) [list -anchor -bordermode -height -in -relheight -relwidth -relx -rely -width -x -y configure forget info slaves]
set syndb(place,-anchor,type) "TKOPT"
set syndb(place,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(place,-anchor,hint)  ""
set syndb(place,-bordermode,type) "TKOPT"
set syndb(place,-bordermode,hint)  ""
set syndb(place,-bordermode,arglist)  [list ]
set syndb(place,-height,type) "TKOPT"
set syndb(place,-height,hint)  ""
set syndb(place,-height,arglist)  [list ]
set syndb(place,-in,type) "TKOPT"
set syndb(place,-in,hint)  ""
set syndb(place,-in,arglist)  [list ]
set syndb(place,-relheight,type) "TKOPT"
set syndb(place,-relheight,hint)  ""
set syndb(place,-relheight,arglist)  [list ]
set syndb(place,-relwidth,type) "TKOPT"
set syndb(place,-relwidth,hint)  ""
set syndb(place,-relwidth,arglist)  [list ]
set syndb(place,-relx,type) "TKOPT"
set syndb(place,-relx,hint)  ""
set syndb(place,-relx,arglist)  [list ]
set syndb(place,-rely,type) "TKOPT"
set syndb(place,-rely,hint)  ""
set syndb(place,-rely,arglist)  [list ]
set syndb(place,-width,type) "TKOPT"
set syndb(place,-width,hint)  ""
set syndb(place,-width,arglist)  [list ]
set syndb(place,-x,type) "TKOPT"
set syndb(place,-x,hint)  ""
set syndb(place,-x,arglist)  [list ]
set syndb(place,-y,type) "TKOPT"
set syndb(place,-y,hint)  ""
set syndb(place,-y,arglist)  [list ]
set syndb(place,configure,type) "TKARG"
set syndb(place,configure,hint)  "place configure window ?option? ?value option value ...?"
set syndb(place,configure,arglist)  [list ]
set syndb(place,forget,type) "TKARG"
set syndb(place,forget,hint)  "place forget window"
set syndb(place,forget,arglist)  [list ]
set syndb(place,info,type) "TKARG"
set syndb(place,info,hint)  "place info window"
set syndb(place,info,arglist)  [list ]
set syndb(place,slaves,type) "TKARG"
set syndb(place,slaves,hint)  "place slaves window"
set syndb(place,slaves,arglist)  [list ]

set syndb(radiobutton,radiobutton,type) "TKCMD"
set syndb(radiobutton,radiobutton,hint) "radiobutton pathName ?options?"
set syndb(radiobutton,radiobutton,arglist) [list -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -command -compound -cursor -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -indicatoron -justify -offrelief -overrelief -padx -pady -relief -selectcolor -selectimage -state -takefocus -text -textvariable -underline -value -variable -width -wraplength]
set syndb(radiobutton,-activebackground,type) "TKOPT"
set syndb(radiobutton,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(radiobutton,-activebackground,hint)  ""
set syndb(radiobutton,-activeforeground,type) "TKOPT"
set syndb(radiobutton,-activeforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(radiobutton,-activeforeground,hint)  ""
set syndb(radiobutton,-anchor,type) "TKOPT"
set syndb(radiobutton,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(radiobutton,-anchor,hint)  ""
set syndb(radiobutton,-background,type) "TKOPT"
set syndb(radiobutton,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(radiobutton,-background,hint)  ""
set syndb(radiobutton,-bd,type) "TKOPT"
set syndb(radiobutton,-bd,hint)  ""
set syndb(radiobutton,-bd,arglist)  [list ]
set syndb(radiobutton,-bg,type) "TKOPT"
set syndb(radiobutton,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(radiobutton,-bg,hint)  ""
set syndb(radiobutton,-bitmap,type) "TKOPT"
set syndb(radiobutton,-bitmap,arglist)  [list {[ez_chooseBitmap]}]
set syndb(radiobutton,-bitmap,hint)  ""
set syndb(radiobutton,-borderwidth,type) "TKOPT"
set syndb(radiobutton,-borderwidth,hint)  ""
set syndb(radiobutton,-borderwidth,arglist)  [list ]
set syndb(radiobutton,-command,type) "TKOPT"
set syndb(radiobutton,-command,hint)  ""
set syndb(radiobutton,-command,arglist)  [list ]
set syndb(radiobutton,-compound,type) "TKOPT"
set syndb(radiobutton,-compound,arglist)  [list none bottom top left right center]
set syndb(radiobutton,-compound,hint)  ""
set syndb(radiobutton,-cursor,type) "TKOPT"
set syndb(radiobutton,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(radiobutton,-cursor,hint)  ""
set syndb(radiobutton,-disabledforeground,type) "TKOPT"
set syndb(radiobutton,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(radiobutton,-disabledforeground,hint)  ""
set syndb(radiobutton,-fg,type) "TKOPT"
set syndb(radiobutton,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(radiobutton,-fg,hint)  ""
set syndb(radiobutton,-font,type) "TKOPT"
set syndb(radiobutton,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(radiobutton,-font,hint)  ""
set syndb(radiobutton,-foreground,type) "TKOPT"
set syndb(radiobutton,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(radiobutton,-foreground,hint)  ""
set syndb(radiobutton,-height,type) "TKOPT"
set syndb(radiobutton,-height,hint)  ""
set syndb(radiobutton,-height,arglist)  [list ]
set syndb(radiobutton,-highlightbackground,type) "TKOPT"
set syndb(radiobutton,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(radiobutton,-highlightbackground,hint)  ""
set syndb(radiobutton,-highlightcolor,type) "TKOPT"
set syndb(radiobutton,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(radiobutton,-highlightcolor,hint)  ""
set syndb(radiobutton,-highlightthickness,type) "TKOPT"
set syndb(radiobutton,-highlightthickness,hint)  ""
set syndb(radiobutton,-highlightthickness,arglist)  [list ]
set syndb(radiobutton,-image,type) "TKOPT"
set syndb(radiobutton,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(radiobutton,-image,hint)  ""
set syndb(radiobutton,-indicatoron,type) "TKOPT"
set syndb(radiobutton,-indicatoron,hint)  ""
set syndb(radiobutton,-indicatoron,arglist)  [list ]
set syndb(radiobutton,-justify,type) "TKOPT"
set syndb(radiobutton,-justify,arglist)  [list center left right]
set syndb(radiobutton,-justify,hint)  ""
set syndb(radiobutton,-offrelief,type) "TKOPT"
set syndb(radiobutton,-offrelief,hint)  ""
set syndb(radiobutton,-offrelief,arglist)  [list ]
set syndb(radiobutton,-overrelief,type) "TKOPT"
set syndb(radiobutton,-overrelief,hint)  ""
set syndb(radiobutton,-overrelief,arglist)  [list ]
set syndb(radiobutton,-padx,type) "TKOPT"
set syndb(radiobutton,-padx,hint)  ""
set syndb(radiobutton,-padx,arglist)  [list ]
set syndb(radiobutton,-pady,type) "TKOPT"
set syndb(radiobutton,-pady,hint)  ""
set syndb(radiobutton,-pady,arglist)  [list ]
set syndb(radiobutton,-relief,type) "TKOPT"
set syndb(radiobutton,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(radiobutton,-relief,hint)  ""
set syndb(radiobutton,-selectcolor,type) "TKOPT"
set syndb(radiobutton,-selectcolor,hint)  ""
set syndb(radiobutton,-selectcolor,arglist)  [list ]
set syndb(radiobutton,-selectimage,type) "TKOPT"
set syndb(radiobutton,-selectimage,hint)  ""
set syndb(radiobutton,-selectimage,arglist)  [list ]
set syndb(radiobutton,-state,type) "TKOPT"
set syndb(radiobutton,-state,arglist)  [list normal disabled]
set syndb(radiobutton,-state,hint)  ""
set syndb(radiobutton,-takefocus,type) "TKOPT"
set syndb(radiobutton,-takefocus,hint)  ""
set syndb(radiobutton,-takefocus,arglist)  [list ]
set syndb(radiobutton,-text,type) "TKOPT"
set syndb(radiobutton,-text,hint)  ""
set syndb(radiobutton,-text,arglist)  [list ]
set syndb(radiobutton,-textvariable,type) "TKOPT"
set syndb(radiobutton,-textvariable,hint)  ""
set syndb(radiobutton,-textvariable,arglist)  [list ]
set syndb(radiobutton,-underline,type) "TKOPT"
set syndb(radiobutton,-underline,hint)  ""
set syndb(radiobutton,-underline,arglist)  [list ]
set syndb(radiobutton,-value,type) "TKOPT"
set syndb(radiobutton,-value,hint)  ""
set syndb(radiobutton,-value,arglist)  [list ]
set syndb(radiobutton,-variable,type) "TKOPT"
set syndb(radiobutton,-variable,hint)  ""
set syndb(radiobutton,-variable,arglist)  [list ]
set syndb(radiobutton,-width,type) "TKOPT"
set syndb(radiobutton,-width,hint)  ""
set syndb(radiobutton,-width,arglist)  [list ]
set syndb(radiobutton,-wraplength,type) "TKOPT"
set syndb(radiobutton,-wraplength,hint)  ""
set syndb(radiobutton,-wraplength,arglist)  [list ]

set syndb(raise,raise,type) "TKCMD"
set syndb(raise,raise,hint) "raise window ?aboveThis?"
set syndb(raise,raise,arglist) [list ]

set syndb(scale,scale,type) "TKCMD"
set syndb(scale,scale,hint) "scale pathName ?options?"
set syndb(scale,scale,arglist) [list -activebackground -background -bd -bg -bigincrement -borderwidth -command -cursor -digits -fg -font -foreground -from -highlightbackground -highlightcolor -highlightthickness -label -length -orient -relief -repeatdelay -repeatinterval -resolution -showvalue -sliderlength -sliderrelief -state -takefocus -tickinterval -to -troughcolor -variable -widt]
set syndb(scale,-activebackground,type) "TKOPT"
set syndb(scale,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(scale,-activebackground,hint)  ""
set syndb(scale,-background,type) "TKOPT"
set syndb(scale,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(scale,-background,hint)  ""
set syndb(scale,-bd,type) "TKOPT"
set syndb(scale,-bd,hint)  ""
set syndb(scale,-bd,arglist)  [list ]
set syndb(scale,-bg,type) "TKOPT"
set syndb(scale,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(scale,-bg,hint)  ""
set syndb(scale,-bigincrement,type) "TKOPT"
set syndb(scale,-bigincrement,hint)  ""
set syndb(scale,-bigincrement,arglist)  [list ]
set syndb(scale,-borderwidth,type) "TKOPT"
set syndb(scale,-borderwidth,hint)  ""
set syndb(scale,-borderwidth,arglist)  [list ]
set syndb(scale,-command,type) "TKOPT"
set syndb(scale,-command,hint)  ""
set syndb(scale,-command,arglist)  [list ]
set syndb(scale,-cursor,type) "TKOPT"
set syndb(scale,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(scale,-cursor,hint)  ""
set syndb(scale,-digits,type) "TKOPT"
set syndb(scale,-digits,hint)  ""
set syndb(scale,-digits,arglist)  [list ]
set syndb(scale,-fg,type) "TKOPT"
set syndb(scale,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(scale,-fg,hint)  ""
set syndb(scale,-font,type) "TKOPT"
set syndb(scale,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(scale,-font,hint)  ""
set syndb(scale,-foreground,type) "TKOPT"
set syndb(scale,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(scale,-foreground,hint)  ""
set syndb(scale,-from,type) "TKOPT"
set syndb(scale,-from,hint)  ""
set syndb(scale,-from,arglist)  [list ]
set syndb(scale,-highlightbackground,type) "TKOPT"
set syndb(scale,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(scale,-highlightbackground,hint)  ""
set syndb(scale,-highlightcolor,type) "TKOPT"
set syndb(scale,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(scale,-highlightcolor,hint)  ""
set syndb(scale,-highlightthickness,type) "TKOPT"
set syndb(scale,-highlightthickness,hint)  ""
set syndb(scale,-highlightthickness,arglist)  [list ]
set syndb(scale,-label,type) "TKOPT"
set syndb(scale,-label,hint)  ""
set syndb(scale,-label,arglist)  [list ]
set syndb(scale,-length,type) "TKOPT"
set syndb(scale,-length,hint)  ""
set syndb(scale,-length,arglist)  [list ]
set syndb(scale,-orient,type) "TKOPT"
set syndb(scale,-orient,arglist)  [list horizontal vertical]
set syndb(scale,-orient,hint)  ""
set syndb(scale,-relief,type) "TKOPT"
set syndb(scale,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(scale,-relief,hint)  ""
set syndb(scale,-repeatdelay,type) "TKOPT"
set syndb(scale,-repeatdelay,hint)  ""
set syndb(scale,-repeatdelay,arglist)  [list ]
set syndb(scale,-repeatinterval,type) "TKOPT"
set syndb(scale,-repeatinterval,hint)  ""
set syndb(scale,-repeatinterval,arglist)  [list ]
set syndb(scale,-resolution,type) "TKOPT"
set syndb(scale,-resolution,hint)  ""
set syndb(scale,-resolution,arglist)  [list ]
set syndb(scale,-showvalue,type) "TKOPT"
set syndb(scale,-showvalue,hint)  ""
set syndb(scale,-showvalue,arglist)  [list ]
set syndb(scale,-sliderlength,type) "TKOPT"
set syndb(scale,-sliderlength,hint)  ""
set syndb(scale,-sliderlength,arglist)  [list ]
set syndb(scale,-sliderrelief,type) "TKOPT"
set syndb(scale,-sliderrelief,hint)  ""
set syndb(scale,-sliderrelief,arglist)  [list ]
set syndb(scale,-state,type) "TKOPT"
set syndb(scale,-state,arglist)  [list normal disabled]
set syndb(scale,-state,hint)  ""
set syndb(scale,-takefocus,type) "TKOPT"
set syndb(scale,-takefocus,hint)  ""
set syndb(scale,-takefocus,arglist)  [list ]
set syndb(scale,-tickinterval,type) "TKOPT"
set syndb(scale,-tickinterval,hint)  ""
set syndb(scale,-tickinterval,arglist)  [list ]
set syndb(scale,-to,type) "TKOPT"
set syndb(scale,-to,hint)  ""
set syndb(scale,-to,arglist)  [list ]
set syndb(scale,-troughcolor,type) "TKOPT"
set syndb(scale,-troughcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(scale,-troughcolor,hint)  ""
set syndb(scale,-variable,type) "TKOPT"
set syndb(scale,-variable,hint)  ""
set syndb(scale,-variable,arglist)  [list ]
set syndb(scale,-widt,type) "TKOPT"
set syndb(scale,-widt,hint)  ""
set syndb(scale,-widt,arglist)  [list ]

set syndb(scrollbar,scrollbar,type) "TKCMD"
set syndb(scrollbar,scrollbar,hint) "scrollbar pathName ?options?"
set syndb(scrollbar,scrollbar,arglist) [list -activebackground -activerelief -background -bd -bg -borderwidth -command -cursor -elementborderwidth -highlightbackground -highlightcolor -highlightthickness -jump -orient -relief -repeatdelay -repeatinterval -takefocus -troughcolor -width]
set syndb(scrollbar,-activebackground,type) "TKOPT"
set syndb(scrollbar,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(scrollbar,-activebackground,hint)  ""
set syndb(scrollbar,-activerelief,type) "TKOPT"
set syndb(scrollbar,-activerelief,hint)  ""
set syndb(scrollbar,-activerelief,arglist)  [list ]
set syndb(scrollbar,-background,type) "TKOPT"
set syndb(scrollbar,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(scrollbar,-background,hint)  ""
set syndb(scrollbar,-bd,type) "TKOPT"
set syndb(scrollbar,-bd,hint)  ""
set syndb(scrollbar,-bd,arglist)  [list ]
set syndb(scrollbar,-bg,type) "TKOPT"
set syndb(scrollbar,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(scrollbar,-bg,hint)  ""
set syndb(scrollbar,-borderwidth,type) "TKOPT"
set syndb(scrollbar,-borderwidth,hint)  ""
set syndb(scrollbar,-borderwidth,arglist)  [list ]
set syndb(scrollbar,-command,type) "TKOPT"
set syndb(scrollbar,-command,hint)  ""
set syndb(scrollbar,-command,arglist)  [list ]
set syndb(scrollbar,-cursor,type) "TKOPT"
set syndb(scrollbar,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(scrollbar,-cursor,hint)  ""
set syndb(scrollbar,-elementborderwidth,type) "TKOPT"
set syndb(scrollbar,-elementborderwidth,hint)  ""
set syndb(scrollbar,-elementborderwidth,arglist)  [list ]
set syndb(scrollbar,-highlightbackground,type) "TKOPT"
set syndb(scrollbar,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(scrollbar,-highlightbackground,hint)  ""
set syndb(scrollbar,-highlightcolor,type) "TKOPT"
set syndb(scrollbar,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(scrollbar,-highlightcolor,hint)  ""
set syndb(scrollbar,-highlightthickness,type) "TKOPT"
set syndb(scrollbar,-highlightthickness,hint)  ""
set syndb(scrollbar,-highlightthickness,arglist)  [list ]
set syndb(scrollbar,-jump,type) "TKOPT"
set syndb(scrollbar,-jump,hint)  ""
set syndb(scrollbar,-jump,arglist)  [list ]
set syndb(scrollbar,-orient,type) "TKOPT"
set syndb(scrollbar,-orient,arglist)  [list horizontal vertical]
set syndb(scrollbar,-orient,hint)  ""
set syndb(scrollbar,-relief,type) "TKOPT"
set syndb(scrollbar,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(scrollbar,-relief,hint)  ""
set syndb(scrollbar,-repeatdelay,type) "TKOPT"
set syndb(scrollbar,-repeatdelay,hint)  ""
set syndb(scrollbar,-repeatdelay,arglist)  [list ]
set syndb(scrollbar,-repeatinterval,type) "TKOPT"
set syndb(scrollbar,-repeatinterval,hint)  ""
set syndb(scrollbar,-repeatinterval,arglist)  [list ]
set syndb(scrollbar,-takefocus,type) "TKOPT"
set syndb(scrollbar,-takefocus,hint)  ""
set syndb(scrollbar,-takefocus,arglist)  [list ]
set syndb(scrollbar,-troughcolor,type) "TKOPT"
set syndb(scrollbar,-troughcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(scrollbar,-troughcolor,hint)  ""
set syndb(scrollbar,-width,type) "TKOPT"
set syndb(scrollbar,-width,hint)  ""
set syndb(scrollbar,-width,arglist)  [list ]

set syndb(tk_setPalette,tk_setPalette,type) "TKCMD"
set syndb(tk_setPalette,tk_setPalette,hint) "tk_setPalette (background | name value ?name value ...?)"
set syndb(tk_setPalette,tk_setPalette,arglist) [list name]
set syndb(tk_setPalette,name,type) "TKARG"
set syndb(tk_setPalette,name,hint)  ""
set syndb(tk_setPalette,name,arglist)  [list ]

set syndb(tk_textCopy,tk_textCopy,type) "TKCMD"
set syndb(tk_textCopy,tk_textCopy,hint) "tk_textCopy pathName"
set syndb(tk_textCopy,tk_textCopy,arglist) [list ]

set syndb(tk_textCut,tk_textCut,type) "TKCMD"
set syndb(tk_textCut,tk_textCut,hint) "tk_textCut pathName"
set syndb(tk_textCut,tk_textCut,arglist) [list ]

set syndb(tk_textPaste,tk_textPaste,type) "TKCMD"
set syndb(tk_textPaste,tk_textPaste,hint) "tk_textPaste pathName"
set syndb(tk_textPaste,tk_textPaste,arglist) [list ]

set syndb(toplevel,toplevel,type) "TKCMD"
set syndb(toplevel,toplevel,hint) "toplevel pathName ?options?"
set syndb(toplevel,toplevel,arglist) [list -background -bd -borderwidth -class -colormap -container -cursor -height -highlightbackground -highlightcolor -highlightthickness -menu -padx -pady -relief -screen -takefocus -use -visual -width]
set syndb(toplevel,-background,type) "TKOPT"
set syndb(toplevel,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(toplevel,-background,hint)  ""
set syndb(toplevel,-bd,type) "TKOPT"
set syndb(toplevel,-bd,hint)  ""
set syndb(toplevel,-bd,arglist)  [list ]
set syndb(toplevel,-borderwidth,type) "TKOPT"
set syndb(toplevel,-borderwidth,hint)  ""
set syndb(toplevel,-borderwidth,arglist)  [list ]
set syndb(toplevel,-class,type) "TKOPT"
set syndb(toplevel,-class,hint)  ""
set syndb(toplevel,-class,arglist)  [list ]
set syndb(toplevel,-colormap,type) "TKOPT"
set syndb(toplevel,-colormap,hint)  ""
set syndb(toplevel,-colormap,arglist)  [list ]
set syndb(toplevel,-container,type) "TKOPT"
set syndb(toplevel,-container,hint)  ""
set syndb(toplevel,-container,arglist)  [list ]
set syndb(toplevel,-cursor,type) "TKOPT"
set syndb(toplevel,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(toplevel,-cursor,hint)  ""
set syndb(toplevel,-height,type) "TKOPT"
set syndb(toplevel,-height,hint)  ""
set syndb(toplevel,-height,arglist)  [list ]
set syndb(toplevel,-highlightbackground,type) "TKOPT"
set syndb(toplevel,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(toplevel,-highlightbackground,hint)  ""
set syndb(toplevel,-highlightcolor,type) "TKOPT"
set syndb(toplevel,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(toplevel,-highlightcolor,hint)  ""
set syndb(toplevel,-highlightthickness,type) "TKOPT"
set syndb(toplevel,-highlightthickness,hint)  ""
set syndb(toplevel,-highlightthickness,arglist)  [list ]
set syndb(toplevel,-menu,type) "TKOPT"
set syndb(toplevel,-menu,hint)  ""
set syndb(toplevel,-menu,arglist)  [list ]
set syndb(toplevel,-padx,type) "TKOPT"
set syndb(toplevel,-padx,hint)  ""
set syndb(toplevel,-padx,arglist)  [list ]
set syndb(toplevel,-pady,type) "TKOPT"
set syndb(toplevel,-pady,hint)  ""
set syndb(toplevel,-pady,arglist)  [list ]
set syndb(toplevel,-relief,type) "TKOPT"
set syndb(toplevel,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(toplevel,-relief,hint)  ""
set syndb(toplevel,-screen,type) "TKOPT"
set syndb(toplevel,-screen,hint)  ""
set syndb(toplevel,-screen,arglist)  [list ]
set syndb(toplevel,-takefocus,type) "TKOPT"
set syndb(toplevel,-takefocus,hint)  ""
set syndb(toplevel,-takefocus,arglist)  [list ]
set syndb(toplevel,-use,type) "TKOPT"
set syndb(toplevel,-use,hint)  ""
set syndb(toplevel,-use,arglist)  [list ]
set syndb(toplevel,-visual,type) "TKOPT"
set syndb(toplevel,-visual,hint)  ""
set syndb(toplevel,-visual,arglist)  [list ]
set syndb(toplevel,-width,type) "TKOPT"
set syndb(toplevel,-width,hint)  ""
set syndb(toplevel,-width,arglist)  [list ]

set syndb(ttk::button,button,type) "TKCMD"
set syndb(ttk::button,button,hint) "ttk::button pathName ?options?"
set syndb(ttk::button,button,arglist) [list -class -command -compound -cursor -default -image -state -style -takefocus -text -textvariable -underline -width]
set syndb(ttk::button,-class,type) "TKOPT"
set syndb(ttk::button,-class,hint)  ""
set syndb(ttk::button,-class,arglist)  [list ]
set syndb(ttk::button,-command,type) "TKOPT"
set syndb(ttk::button,-command,hint)  ""
set syndb(ttk::button,-command,arglist)  [list ]
set syndb(ttk::button,-compound,type) "TKOPT"
set syndb(ttk::button,-compound,arglist)  [list none bottom top left right center]
set syndb(ttk::button,-compound,hint)  ""
set syndb(ttk::button,-cursor,type) "TKOPT"
set syndb(ttk::button,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::button,-cursor,hint)  ""
set syndb(ttk::button,-default,type) "TKOPT"
set syndb(ttk::button,-default,hint)  ""
set syndb(ttk::button,-default,arglist)  [list ]
set syndb(ttk::button,-image,type) "TKOPT"
set syndb(ttk::button,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(ttk::button,-image,hint)  ""
set syndb(ttk::button,-state,type) "TKOPT"
set syndb(ttk::button,-state,arglist)  [list normal disabled]
set syndb(ttk::button,-state,hint)  ""
set syndb(ttk::button,-style,type) "TKOPT"
set syndb(ttk::button,-style,hint)  ""
set syndb(ttk::button,-style,arglist)  [list ]
set syndb(ttk::button,-takefocus,type) "TKOPT"
set syndb(ttk::button,-takefocus,hint)  ""
set syndb(ttk::button,-takefocus,arglist)  [list ]
set syndb(ttk::button,-text,type) "TKOPT"
set syndb(ttk::button,-text,hint)  ""
set syndb(ttk::button,-text,arglist)  [list ]
set syndb(ttk::button,-textvariable,type) "TKOPT"
set syndb(ttk::button,-textvariable,hint)  ""
set syndb(ttk::button,-textvariable,arglist)  [list ]
set syndb(ttk::button,-underline,type) "TKOPT"
set syndb(ttk::button,-underline,hint)  ""
set syndb(ttk::button,-underline,arglist)  [list ]
set syndb(ttk::button,-width,type) "TKOPT"
set syndb(ttk::button,-width,hint)  ""
set syndb(ttk::button,-width,arglist)  [list ]

set syndb(ttk::checkbutton,checkbutton,type) "TKCMD"
set syndb(ttk::checkbutton,checkbutton,hint) "ttk::checkbutton pathName ?options?"
set syndb(ttk::checkbutton,checkbutton,arglist) [list -class -command -compound -cursor -image -offvalue -onvalue -state -style -takefocus -text -textvariable -underline -variable -width]
set syndb(ttk::checkbutton,-class,type) "TKOPT"
set syndb(ttk::checkbutton,-class,hint)  ""
set syndb(ttk::checkbutton,-class,arglist)  [list ]
set syndb(ttk::checkbutton,-command,type) "TKOPT"
set syndb(ttk::checkbutton,-command,hint)  ""
set syndb(ttk::checkbutton,-command,arglist)  [list ]
set syndb(ttk::checkbutton,-compound,type) "TKOPT"
set syndb(ttk::checkbutton,-compound,arglist)  [list none bottom top left right center]
set syndb(ttk::checkbutton,-compound,hint)  ""
set syndb(ttk::checkbutton,-cursor,type) "TKOPT"
set syndb(ttk::checkbutton,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::checkbutton,-cursor,hint)  ""
set syndb(ttk::checkbutton,-image,type) "TKOPT"
set syndb(ttk::checkbutton,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(ttk::checkbutton,-image,hint)  ""
set syndb(ttk::checkbutton,-offvalue,type) "TKOPT"
set syndb(ttk::checkbutton,-offvalue,hint)  ""
set syndb(ttk::checkbutton,-offvalue,arglist)  [list ]
set syndb(ttk::checkbutton,-onvalue,type) "TKOPT"
set syndb(ttk::checkbutton,-onvalue,hint)  ""
set syndb(ttk::checkbutton,-onvalue,arglist)  [list ]
set syndb(ttk::checkbutton,-state,type) "TKOPT"
set syndb(ttk::checkbutton,-state,arglist)  [list normal disabled]
set syndb(ttk::checkbutton,-state,hint)  ""
set syndb(ttk::checkbutton,-style,type) "TKOPT"
set syndb(ttk::checkbutton,-style,hint)  ""
set syndb(ttk::checkbutton,-style,arglist)  [list ]
set syndb(ttk::checkbutton,-takefocus,type) "TKOPT"
set syndb(ttk::checkbutton,-takefocus,hint)  ""
set syndb(ttk::checkbutton,-takefocus,arglist)  [list ]
set syndb(ttk::checkbutton,-text,type) "TKOPT"
set syndb(ttk::checkbutton,-text,hint)  ""
set syndb(ttk::checkbutton,-text,arglist)  [list ]
set syndb(ttk::checkbutton,-textvariable,type) "TKOPT"
set syndb(ttk::checkbutton,-textvariable,hint)  ""
set syndb(ttk::checkbutton,-textvariable,arglist)  [list ]
set syndb(ttk::checkbutton,-underline,type) "TKOPT"
set syndb(ttk::checkbutton,-underline,hint)  ""
set syndb(ttk::checkbutton,-underline,arglist)  [list ]
set syndb(ttk::checkbutton,-variable,type) "TKOPT"
set syndb(ttk::checkbutton,-variable,hint)  ""
set syndb(ttk::checkbutton,-variable,arglist)  [list ]
set syndb(ttk::checkbutton,-width,type) "TKOPT"
set syndb(ttk::checkbutton,-width,hint)  ""
set syndb(ttk::checkbutton,-width,arglist)  [list ]

set syndb(ttk::combobox,combobox,type) "TKCMD"
set syndb(ttk::combobox,combobox,hint) "ttk::combobox pathName ?options?"
set syndb(ttk::combobox,combobox,arglist) [list -class -cursor -exportselection -height -justify -postcommand -state -style -takefocus -textvariable -values -width]
set syndb(ttk::combobox,-class,type) "TKOPT"
set syndb(ttk::combobox,-class,hint)  ""
set syndb(ttk::combobox,-class,arglist)  [list ]
set syndb(ttk::combobox,-cursor,type) "TKOPT"
set syndb(ttk::combobox,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::combobox,-cursor,hint)  ""
set syndb(ttk::combobox,-exportselection,type) "TKOPT"
set syndb(ttk::combobox,-exportselection,hint)  ""
set syndb(ttk::combobox,-exportselection,arglist)  [list ]
set syndb(ttk::combobox,-height,type) "TKOPT"
set syndb(ttk::combobox,-height,hint)  ""
set syndb(ttk::combobox,-height,arglist)  [list ]
set syndb(ttk::combobox,-justify,type) "TKOPT"
set syndb(ttk::combobox,-justify,arglist)  [list center left right]
set syndb(ttk::combobox,-justify,hint)  ""
set syndb(ttk::combobox,-postcommand,type) "TKOPT"
set syndb(ttk::combobox,-postcommand,hint)  ""
set syndb(ttk::combobox,-postcommand,arglist)  [list ]
set syndb(ttk::combobox,-state,type) "TKOPT"
set syndb(ttk::combobox,-state,arglist)  [list normal disabled]
set syndb(ttk::combobox,-state,hint)  ""
set syndb(ttk::combobox,-style,type) "TKOPT"
set syndb(ttk::combobox,-style,hint)  ""
set syndb(ttk::combobox,-style,arglist)  [list ]
set syndb(ttk::combobox,-takefocus,type) "TKOPT"
set syndb(ttk::combobox,-takefocus,hint)  ""
set syndb(ttk::combobox,-takefocus,arglist)  [list ]
set syndb(ttk::combobox,-textvariable,type) "TKOPT"
set syndb(ttk::combobox,-textvariable,hint)  ""
set syndb(ttk::combobox,-textvariable,arglist)  [list ]
set syndb(ttk::combobox,-values,type) "TKOPT"
set syndb(ttk::combobox,-values,hint)  ""
set syndb(ttk::combobox,-values,arglist)  [list ]
set syndb(ttk::combobox,-width,type) "TKOPT"
set syndb(ttk::combobox,-width,hint)  ""
set syndb(ttk::combobox,-width,arglist)  [list ]

set syndb(ttk::entry,entry,type) "TKCMD"
set syndb(ttk::entry,entry,hint) "ttk::entry pathName ?options?"
set syndb(ttk::entry,entry,arglist) [list -class -cursor -exportselection -invalidcommand -justify -show -state -style -takefocus -textvariable -validate -validatecommand -width -xscrollcommand]
set syndb(ttk::entry,-class,type) "TKOPT"
set syndb(ttk::entry,-class,hint)  ""
set syndb(ttk::entry,-class,arglist)  [list ]
set syndb(ttk::entry,-cursor,type) "TKOPT"
set syndb(ttk::entry,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::entry,-cursor,hint)  ""
set syndb(ttk::entry,-exportselection,type) "TKOPT"
set syndb(ttk::entry,-exportselection,hint)  ""
set syndb(ttk::entry,-exportselection,arglist)  [list ]
set syndb(ttk::entry,-invalidcommand,type) "TKOPT"
set syndb(ttk::entry,-invalidcommand,hint)  ""
set syndb(ttk::entry,-invalidcommand,arglist)  [list ]
set syndb(ttk::entry,-justify,type) "TKOPT"
set syndb(ttk::entry,-justify,arglist)  [list center left right]
set syndb(ttk::entry,-justify,hint)  ""
set syndb(ttk::entry,-show,type) "TKOPT"
set syndb(ttk::entry,-show,hint)  ""
set syndb(ttk::entry,-show,arglist)  [list ]
set syndb(ttk::entry,-state,type) "TKOPT"
set syndb(ttk::entry,-state,arglist)  [list normal disabled]
set syndb(ttk::entry,-state,hint)  ""
set syndb(ttk::entry,-style,type) "TKOPT"
set syndb(ttk::entry,-style,hint)  ""
set syndb(ttk::entry,-style,arglist)  [list ]
set syndb(ttk::entry,-takefocus,type) "TKOPT"
set syndb(ttk::entry,-takefocus,hint)  ""
set syndb(ttk::entry,-takefocus,arglist)  [list ]
set syndb(ttk::entry,-textvariable,type) "TKOPT"
set syndb(ttk::entry,-textvariable,hint)  ""
set syndb(ttk::entry,-textvariable,arglist)  [list ]
set syndb(ttk::entry,-validate,type) "TKOPT"
set syndb(ttk::entry,-validate,hint)  ""
set syndb(ttk::entry,-validate,arglist)  [list ]
set syndb(ttk::entry,-validatecommand,type) "TKOPT"
set syndb(ttk::entry,-validatecommand,hint)  ""
set syndb(ttk::entry,-validatecommand,arglist)  [list ]
set syndb(ttk::entry,-width,type) "TKOPT"
set syndb(ttk::entry,-width,hint)  ""
set syndb(ttk::entry,-width,arglist)  [list ]
set syndb(ttk::entry,-xscrollcommand,type) "TKOPT"
set syndb(ttk::entry,-xscrollcommand,hint)  ""
set syndb(ttk::entry,-xscrollcommand,arglist)  [list ]

set syndb(ttk::frame,frame,type) "TKCMD"
set syndb(ttk::frame,frame,hint) "ttk::frame pathName ?options?"
set syndb(ttk::frame,frame,arglist) [list -borderwidth -class -cursor -height -padding -relief -style -takefocus -width]
set syndb(ttk::frame,-borderwidth,type) "TKOPT"
set syndb(ttk::frame,-borderwidth,hint)  ""
set syndb(ttk::frame,-borderwidth,arglist)  [list ]
set syndb(ttk::frame,-class,type) "TKOPT"
set syndb(ttk::frame,-class,hint)  ""
set syndb(ttk::frame,-class,arglist)  [list ]
set syndb(ttk::frame,-cursor,type) "TKOPT"
set syndb(ttk::frame,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::frame,-cursor,hint)  ""
set syndb(ttk::frame,-height,type) "TKOPT"
set syndb(ttk::frame,-height,hint)  ""
set syndb(ttk::frame,-height,arglist)  [list ]
set syndb(ttk::frame,-padding,type) "TKOPT"
set syndb(ttk::frame,-padding,hint)  ""
set syndb(ttk::frame,-padding,arglist)  [list ]
set syndb(ttk::frame,-relief,type) "TKOPT"
set syndb(ttk::frame,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(ttk::frame,-relief,hint)  ""
set syndb(ttk::frame,-style,type) "TKOPT"
set syndb(ttk::frame,-style,hint)  ""
set syndb(ttk::frame,-style,arglist)  [list ]
set syndb(ttk::frame,-takefocus,type) "TKOPT"
set syndb(ttk::frame,-takefocus,hint)  ""
set syndb(ttk::frame,-takefocus,arglist)  [list ]
set syndb(ttk::frame,-width,type) "TKOPT"
set syndb(ttk::frame,-width,hint)  ""
set syndb(ttk::frame,-width,arglist)  [list ]

set syndb(ttk::image,image,type) "TKCMD"
set syndb(ttk::image,image,hint) ""
set syndb(ttk::image,image,arglist) [list ]

set syndb(ttk::intro,intro,type) "TKCMD"
set syndb(ttk::intro,intro,hint) ""
set syndb(ttk::intro,intro,arglist) [list ]

set syndb(ttk::label,label,type) "TKCMD"
set syndb(ttk::label,label,hint) ""
set syndb(ttk::label,label,arglist) [list -anchor -background -class -compound -cursor -font -foreground -image -justify -padding -relief -style -takefocus -text -text -textvariable -underline -width -wraplength]
set syndb(ttk::label,-anchor,type) "TKOPT"
set syndb(ttk::label,-anchor,arglist)  [list n ne e se s sw w nw center]
set syndb(ttk::label,-anchor,hint)  ""
set syndb(ttk::label,-background,type) "TKOPT"
set syndb(ttk::label,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(ttk::label,-background,hint)  ""
set syndb(ttk::label,-class,type) "TKOPT"
set syndb(ttk::label,-class,hint)  ""
set syndb(ttk::label,-class,arglist)  [list ]
set syndb(ttk::label,-compound,type) "TKOPT"
set syndb(ttk::label,-compound,arglist)  [list none bottom top left right center]
set syndb(ttk::label,-compound,hint)  ""
set syndb(ttk::label,-cursor,type) "TKOPT"
set syndb(ttk::label,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::label,-cursor,hint)  ""
set syndb(ttk::label,-font,type) "TKOPT"
set syndb(ttk::label,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(ttk::label,-font,hint)  ""
set syndb(ttk::label,-foreground,type) "TKOPT"
set syndb(ttk::label,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(ttk::label,-foreground,hint)  ""
set syndb(ttk::label,-image,type) "TKOPT"
set syndb(ttk::label,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(ttk::label,-image,hint)  ""
set syndb(ttk::label,-justify,type) "TKOPT"
set syndb(ttk::label,-justify,arglist)  [list center left right]
set syndb(ttk::label,-justify,hint)  ""
set syndb(ttk::label,-padding,type) "TKOPT"
set syndb(ttk::label,-padding,hint)  ""
set syndb(ttk::label,-padding,arglist)  [list ]
set syndb(ttk::label,-relief,type) "TKOPT"
set syndb(ttk::label,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(ttk::label,-relief,hint)  ""
set syndb(ttk::label,-style,type) "TKOPT"
set syndb(ttk::label,-style,hint)  ""
set syndb(ttk::label,-style,arglist)  [list ]
set syndb(ttk::label,-takefocus,type) "TKOPT"
set syndb(ttk::label,-takefocus,hint)  ""
set syndb(ttk::label,-takefocus,arglist)  [list ]
set syndb(ttk::label,-text,type) "TKOPT"
set syndb(ttk::label,-text,hint)  ""
set syndb(ttk::label,-text,arglist)  [list ]
set syndb(ttk::label,-text,type) "TKOPT"
set syndb(ttk::label,-text,hint)  ""
set syndb(ttk::label,-text,arglist)  [list ]
set syndb(ttk::label,-textvariable,type) "TKOPT"
set syndb(ttk::label,-textvariable,hint)  ""
set syndb(ttk::label,-textvariable,arglist)  [list ]
set syndb(ttk::label,-underline,type) "TKOPT"
set syndb(ttk::label,-underline,hint)  ""
set syndb(ttk::label,-underline,arglist)  [list ]
set syndb(ttk::label,-width,type) "TKOPT"
set syndb(ttk::label,-width,hint)  ""
set syndb(ttk::label,-width,arglist)  [list ]
set syndb(ttk::label,-wraplength,type) "TKOPT"
set syndb(ttk::label,-wraplength,hint)  ""
set syndb(ttk::label,-wraplength,arglist)  [list ]

set syndb(ttk::labelframe,labelframe,type) "TKCMD"
set syndb(ttk::labelframe,labelframe,hint) "ttk::labelframe pathName ?options?"
set syndb(ttk::labelframe,labelframe,arglist) [list -class -cursor -height -labelanchor -labelwidget -padding -style -takefocus -text -underline -width]
set syndb(ttk::labelframe,-class,type) "TKOPT"
set syndb(ttk::labelframe,-class,hint)  ""
set syndb(ttk::labelframe,-class,arglist)  [list ]
set syndb(ttk::labelframe,-cursor,type) "TKOPT"
set syndb(ttk::labelframe,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::labelframe,-cursor,hint)  ""
set syndb(ttk::labelframe,-height,type) "TKOPT"
set syndb(ttk::labelframe,-height,hint)  ""
set syndb(ttk::labelframe,-height,arglist)  [list ]
set syndb(ttk::labelframe,-labelanchor,type) "TKOPT"
set syndb(ttk::labelframe,-labelanchor,hint)  ""
set syndb(ttk::labelframe,-labelanchor,arglist)  [list ]
set syndb(ttk::labelframe,-labelwidget,type) "TKOPT"
set syndb(ttk::labelframe,-labelwidget,hint)  ""
set syndb(ttk::labelframe,-labelwidget,arglist)  [list ]
set syndb(ttk::labelframe,-padding,type) "TKOPT"
set syndb(ttk::labelframe,-padding,hint)  ""
set syndb(ttk::labelframe,-padding,arglist)  [list ]
set syndb(ttk::labelframe,-style,type) "TKOPT"
set syndb(ttk::labelframe,-style,hint)  ""
set syndb(ttk::labelframe,-style,arglist)  [list ]
set syndb(ttk::labelframe,-takefocus,type) "TKOPT"
set syndb(ttk::labelframe,-takefocus,hint)  ""
set syndb(ttk::labelframe,-takefocus,arglist)  [list ]
set syndb(ttk::labelframe,-text,type) "TKOPT"
set syndb(ttk::labelframe,-text,hint)  ""
set syndb(ttk::labelframe,-text,arglist)  [list ]
set syndb(ttk::labelframe,-underline,type) "TKOPT"
set syndb(ttk::labelframe,-underline,hint)  ""
set syndb(ttk::labelframe,-underline,arglist)  [list ]
set syndb(ttk::labelframe,-width,type) "TKOPT"
set syndb(ttk::labelframe,-width,hint)  ""
set syndb(ttk::labelframe,-width,arglist)  [list ]

set syndb(ttk::menubutton,menubutton,type) "TKCMD"
set syndb(ttk::menubutton,menubutton,hint) "ttk::menubutton pathName ?options?"
set syndb(ttk::menubutton,menubutton,arglist) [list -class -compound -cursor -direction -image -menu -state -style -takefocus -text -textvariable -underline -width]
set syndb(ttk::menubutton,-class,type) "TKOPT"
set syndb(ttk::menubutton,-class,hint)  ""
set syndb(ttk::menubutton,-class,arglist)  [list ]
set syndb(ttk::menubutton,-compound,type) "TKOPT"
set syndb(ttk::menubutton,-compound,arglist)  [list none bottom top left right center]
set syndb(ttk::menubutton,-compound,hint)  ""
set syndb(ttk::menubutton,-cursor,type) "TKOPT"
set syndb(ttk::menubutton,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::menubutton,-cursor,hint)  ""
set syndb(ttk::menubutton,-direction,type) "TKOPT"
set syndb(ttk::menubutton,-direction,hint)  ""
set syndb(ttk::menubutton,-direction,arglist)  [list above below flush left right]
set syndb(ttk::menubutton,-image,type) "TKOPT"
set syndb(ttk::menubutton,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(ttk::menubutton,-image,hint)  ""
set syndb(ttk::menubutton,-menu,type) "TKOPT"
set syndb(ttk::menubutton,-menu,hint)  ""
set syndb(ttk::menubutton,-menu,arglist)  [list ]
set syndb(ttk::menubutton,-state,type) "TKOPT"
set syndb(ttk::menubutton,-state,arglist)  [list normal disabled]
set syndb(ttk::menubutton,-state,hint)  ""
set syndb(ttk::menubutton,-style,type) "TKOPT"
set syndb(ttk::menubutton,-style,hint)  ""
set syndb(ttk::menubutton,-style,arglist)  [list ]
set syndb(ttk::menubutton,-takefocus,type) "TKOPT"
set syndb(ttk::menubutton,-takefocus,hint)  ""
set syndb(ttk::menubutton,-takefocus,arglist)  [list ]
set syndb(ttk::menubutton,-text,type) "TKOPT"
set syndb(ttk::menubutton,-text,hint)  ""
set syndb(ttk::menubutton,-text,arglist)  [list ]
set syndb(ttk::menubutton,-textvariable,type) "TKOPT"
set syndb(ttk::menubutton,-textvariable,hint)  ""
set syndb(ttk::menubutton,-textvariable,arglist)  [list ]
set syndb(ttk::menubutton,-underline,type) "TKOPT"
set syndb(ttk::menubutton,-underline,hint)  ""
set syndb(ttk::menubutton,-underline,arglist)  [list ]
set syndb(ttk::menubutton,-width,type) "TKOPT"
set syndb(ttk::menubutton,-width,hint)  ""
set syndb(ttk::menubutton,-width,arglist)  [list ]

set syndb(ttk::notebook,notebook,type) "TKCMD"
set syndb(ttk::notebook,notebook,hint) "ttk::notebook pathName ?options...?"
set syndb(ttk::notebook,notebook,arglist) [list -class -cursor -height -padding -style -takefocus -width]
set syndb(ttk::notebook,-class,type) "TKOPT"
set syndb(ttk::notebook,-class,hint)  ""
set syndb(ttk::notebook,-class,arglist)  [list ]
set syndb(ttk::notebook,-cursor,type) "TKOPT"
set syndb(ttk::notebook,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::notebook,-cursor,hint)  ""
set syndb(ttk::notebook,-height,type) "TKOPT"
set syndb(ttk::notebook,-height,hint)  ""
set syndb(ttk::notebook,-height,arglist)  [list ]
set syndb(ttk::notebook,-padding,type) "TKOPT"
set syndb(ttk::notebook,-padding,hint)  ""
set syndb(ttk::notebook,-padding,arglist)  [list ]
set syndb(ttk::notebook,-style,type) "TKOPT"
set syndb(ttk::notebook,-style,hint)  ""
set syndb(ttk::notebook,-style,arglist)  [list ]
set syndb(ttk::notebook,-takefocus,type) "TKOPT"
set syndb(ttk::notebook,-takefocus,hint)  ""
set syndb(ttk::notebook,-takefocus,arglist)  [list ]
set syndb(ttk::notebook,-width,type) "TKOPT"
set syndb(ttk::notebook,-width,hint)  ""
set syndb(ttk::notebook,-width,arglist)  [list ]

set syndb(ttk::panedwindow,panedwindow,type) "TKCMD"
set syndb(ttk::panedwindow,panedwindow,hint) "ttk::panedwindow pathName ?options?"
set syndb(ttk::panedwindow,panedwindow,arglist) [list -class -cursor -height -orient -style -takefocus -width]
set syndb(ttk::panedwindow,-class,type) "TKOPT"
set syndb(ttk::panedwindow,-class,hint)  ""
set syndb(ttk::panedwindow,-class,arglist)  [list ]
set syndb(ttk::panedwindow,-cursor,type) "TKOPT"
set syndb(ttk::panedwindow,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::panedwindow,-cursor,hint)  ""
set syndb(ttk::panedwindow,-height,type) "TKOPT"
set syndb(ttk::panedwindow,-height,hint)  ""
set syndb(ttk::panedwindow,-height,arglist)  [list ]
set syndb(ttk::panedwindow,-orient,type) "TKOPT"
set syndb(ttk::panedwindow,-orient,arglist)  [list horizontal vertical]
set syndb(ttk::panedwindow,-orient,hint)  ""
set syndb(ttk::panedwindow,-style,type) "TKOPT"
set syndb(ttk::panedwindow,-style,hint)  ""
set syndb(ttk::panedwindow,-style,arglist)  [list ]
set syndb(ttk::panedwindow,-takefocus,type) "TKOPT"
set syndb(ttk::panedwindow,-takefocus,hint)  ""
set syndb(ttk::panedwindow,-takefocus,arglist)  [list ]
set syndb(ttk::panedwindow,-width,type) "TKOPT"
set syndb(ttk::panedwindow,-width,hint)  ""
set syndb(ttk::panedwindow,-width,arglist)  [list ]

set syndb(ttk::progressbar,progressbar,type) "TKCMD"
set syndb(ttk::progressbar,progressbar,hint) "ttk::progressbar pathName ?options?"
set syndb(ttk::progressbar,progressbar,arglist) [list -class -cursor -length -maximum -mode -orient -phase -style -takefocus -value -variable]
set syndb(ttk::progressbar,-class,type) "TKOPT"
set syndb(ttk::progressbar,-class,hint)  ""
set syndb(ttk::progressbar,-class,arglist)  [list ]
set syndb(ttk::progressbar,-cursor,type) "TKOPT"
set syndb(ttk::progressbar,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::progressbar,-cursor,hint)  ""
set syndb(ttk::progressbar,-length,type) "TKOPT"
set syndb(ttk::progressbar,-length,hint)  ""
set syndb(ttk::progressbar,-length,arglist)  [list ]
set syndb(ttk::progressbar,-maximum,type) "TKOPT"
set syndb(ttk::progressbar,-maximum,hint)  ""
set syndb(ttk::progressbar,-maximum,arglist)  [list ]
set syndb(ttk::progressbar,-mode,type) "TKOPT"
set syndb(ttk::progressbar,-mode,hint)  ""
set syndb(ttk::progressbar,-mode,arglist)  [list determinate indeterminate]
set syndb(ttk::progressbar,-orient,type) "TKOPT"
set syndb(ttk::progressbar,-orient,arglist)  [list horizontal vertical]
set syndb(ttk::progressbar,-orient,hint)  ""
set syndb(ttk::progressbar,-phase,type) "TKOPT"
set syndb(ttk::progressbar,-phase,hint)  ""
set syndb(ttk::progressbar,-phase,arglist)  [list ]
set syndb(ttk::progressbar,-style,type) "TKOPT"
set syndb(ttk::progressbar,-style,hint)  ""
set syndb(ttk::progressbar,-style,arglist)  [list ]
set syndb(ttk::progressbar,-takefocus,type) "TKOPT"
set syndb(ttk::progressbar,-takefocus,hint)  ""
set syndb(ttk::progressbar,-takefocus,arglist)  [list ]
set syndb(ttk::progressbar,-value,type) "TKOPT"
set syndb(ttk::progressbar,-value,hint)  ""
set syndb(ttk::progressbar,-value,arglist)  [list ]
set syndb(ttk::progressbar,-variable,type) "TKOPT"
set syndb(ttk::progressbar,-variable,hint)  ""
set syndb(ttk::progressbar,-variable,arglist)  [list ]

set syndb(ttk::radiobutton,radiobutton,type) "TKCMD"
set syndb(ttk::radiobutton,radiobutton,hint) "ttk::radiobutton pathName ?options?"
set syndb(ttk::radiobutton,radiobutton,arglist) [list -class -command -compound -cursor -image -state -style -takefocus -text -textvariable -underline -value -variable -width]
set syndb(ttk::radiobutton,-class,type) "TKOPT"
set syndb(ttk::radiobutton,-class,hint)  ""
set syndb(ttk::radiobutton,-class,arglist)  [list ]
set syndb(ttk::radiobutton,-command,type) "TKOPT"
set syndb(ttk::radiobutton,-command,hint)  ""
set syndb(ttk::radiobutton,-command,arglist)  [list ]
set syndb(ttk::radiobutton,-compound,type) "TKOPT"
set syndb(ttk::radiobutton,-compound,arglist)  [list none bottom top left right center]
set syndb(ttk::radiobutton,-compound,hint)  ""
set syndb(ttk::radiobutton,-cursor,type) "TKOPT"
set syndb(ttk::radiobutton,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::radiobutton,-cursor,hint)  ""
set syndb(ttk::radiobutton,-image,type) "TKOPT"
set syndb(ttk::radiobutton,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(ttk::radiobutton,-image,hint)  ""
set syndb(ttk::radiobutton,-state,type) "TKOPT"
set syndb(ttk::radiobutton,-state,arglist)  [list normal disabled]
set syndb(ttk::radiobutton,-state,hint)  ""
set syndb(ttk::radiobutton,-style,type) "TKOPT"
set syndb(ttk::radiobutton,-style,hint)  ""
set syndb(ttk::radiobutton,-style,arglist)  [list ]
set syndb(ttk::radiobutton,-takefocus,type) "TKOPT"
set syndb(ttk::radiobutton,-takefocus,hint)  ""
set syndb(ttk::radiobutton,-takefocus,arglist)  [list ]
set syndb(ttk::radiobutton,-text,type) "TKOPT"
set syndb(ttk::radiobutton,-text,hint)  ""
set syndb(ttk::radiobutton,-text,arglist)  [list ]
set syndb(ttk::radiobutton,-textvariable,type) "TKOPT"
set syndb(ttk::radiobutton,-textvariable,hint)  ""
set syndb(ttk::radiobutton,-textvariable,arglist)  [list ]
set syndb(ttk::radiobutton,-underline,type) "TKOPT"
set syndb(ttk::radiobutton,-underline,hint)  ""
set syndb(ttk::radiobutton,-underline,arglist)  [list ]
set syndb(ttk::radiobutton,-value,type) "TKOPT"
set syndb(ttk::radiobutton,-value,hint)  ""
set syndb(ttk::radiobutton,-value,arglist)  [list ]
set syndb(ttk::radiobutton,-variable,type) "TKOPT"
set syndb(ttk::radiobutton,-variable,hint)  ""
set syndb(ttk::radiobutton,-variable,arglist)  [list ]
set syndb(ttk::radiobutton,-width,type) "TKOPT"
set syndb(ttk::radiobutton,-width,hint)  ""
set syndb(ttk::radiobutton,-width,arglist)  [list ]

set syndb(ttk::scale,scale,type) "TKCMD"
set syndb(ttk::scale,scale,hint) "ttk::scale pathName ?options...?"
set syndb(ttk::scale,scale,arglist) [list -class -command -cursor -from -length -orient -style -takefocus -to -value -variable]
set syndb(ttk::scale,-class,type) "TKOPT"
set syndb(ttk::scale,-class,hint)  ""
set syndb(ttk::scale,-class,arglist)  [list ]
set syndb(ttk::scale,-command,type) "TKOPT"
set syndb(ttk::scale,-command,hint)  ""
set syndb(ttk::scale,-command,arglist)  [list ]
set syndb(ttk::scale,-cursor,type) "TKOPT"
set syndb(ttk::scale,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::scale,-cursor,hint)  ""
set syndb(ttk::scale,-from,type) "TKOPT"
set syndb(ttk::scale,-from,hint)  ""
set syndb(ttk::scale,-from,arglist)  [list ]
set syndb(ttk::scale,-length,type) "TKOPT"
set syndb(ttk::scale,-length,hint)  ""
set syndb(ttk::scale,-length,arglist)  [list ]
set syndb(ttk::scale,-orient,type) "TKOPT"
set syndb(ttk::scale,-orient,arglist)  [list horizontal vertical]
set syndb(ttk::scale,-orient,hint)  ""
set syndb(ttk::scale,-style,type) "TKOPT"
set syndb(ttk::scale,-style,hint)  ""
set syndb(ttk::scale,-style,arglist)  [list ]
set syndb(ttk::scale,-takefocus,type) "TKOPT"
set syndb(ttk::scale,-takefocus,hint)  ""
set syndb(ttk::scale,-takefocus,arglist)  [list ]
set syndb(ttk::scale,-to,type) "TKOPT"
set syndb(ttk::scale,-to,hint)  ""
set syndb(ttk::scale,-to,arglist)  [list ]
set syndb(ttk::scale,-value,type) "TKOPT"
set syndb(ttk::scale,-value,hint)  ""
set syndb(ttk::scale,-value,arglist)  [list ]
set syndb(ttk::scale,-variable,type) "TKOPT"
set syndb(ttk::scale,-variable,hint)  ""
set syndb(ttk::scale,-variable,arglist)  [list ]

set syndb(ttk::scrollbar,scrollbar,type) "TKCMD"
set syndb(ttk::scrollbar,scrollbar,hint) "ttk::scrollbar pathName ?options...?"
set syndb(ttk::scrollbar,scrollbar,arglist) [list -class -command -cursor -orient -style -takefocus]
set syndb(ttk::scrollbar,-class,type) "TKOPT"
set syndb(ttk::scrollbar,-class,hint)  ""
set syndb(ttk::scrollbar,-class,arglist)  [list ]
set syndb(ttk::scrollbar,-command,type) "TKOPT"
set syndb(ttk::scrollbar,-command,hint)  ""
set syndb(ttk::scrollbar,-command,arglist)  [list ]
set syndb(ttk::scrollbar,-cursor,type) "TKOPT"
set syndb(ttk::scrollbar,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::scrollbar,-cursor,hint)  ""
set syndb(ttk::scrollbar,-orient,type) "TKOPT"
set syndb(ttk::scrollbar,-orient,arglist)  [list horizontal vertical]
set syndb(ttk::scrollbar,-orient,hint)  ""
set syndb(ttk::scrollbar,-style,type) "TKOPT"
set syndb(ttk::scrollbar,-style,hint)  ""
set syndb(ttk::scrollbar,-style,arglist)  [list ]
set syndb(ttk::scrollbar,-takefocus,type) "TKOPT"
set syndb(ttk::scrollbar,-takefocus,hint)  ""
set syndb(ttk::scrollbar,-takefocus,arglist)  [list ]

set syndb(ttk::separator,separator,type) "TKCMD"
set syndb(ttk::separator,separator,hint) "ttk::separator pathName ?options?"
set syndb(ttk::separator,separator,arglist) [list -class -cursor -orient -state -style -takefocus]
set syndb(ttk::separator,-class,type) "TKOPT"
set syndb(ttk::separator,-class,hint)  ""
set syndb(ttk::separator,-class,arglist)  [list ]
set syndb(ttk::separator,-cursor,type) "TKOPT"
set syndb(ttk::separator,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::separator,-cursor,hint)  ""
set syndb(ttk::separator,-orient,type) "TKOPT"
set syndb(ttk::separator,-orient,arglist)  [list horizontal vertical]
set syndb(ttk::separator,-orient,hint)  ""
set syndb(ttk::separator,-state,type) "TKOPT"
set syndb(ttk::separator,-state,arglist)  [list normal disabled]
set syndb(ttk::separator,-state,hint)  ""
set syndb(ttk::separator,-style,type) "TKOPT"
set syndb(ttk::separator,-style,hint)  ""
set syndb(ttk::separator,-style,arglist)  [list ]
set syndb(ttk::separator,-takefocus,type) "TKOPT"
set syndb(ttk::separator,-takefocus,hint)  ""
set syndb(ttk::separator,-takefocus,arglist)  [list ]

set syndb(ttk::sizegrip,sizegrip,type) "TKCMD"
set syndb(ttk::sizegrip,sizegrip,hint) "ttk::sizegrip pathName ?options?"
set syndb(ttk::sizegrip,sizegrip,arglist) [list -class -cursor -state -style -takefocus]
set syndb(ttk::sizegrip,-class,type) "TKOPT"
set syndb(ttk::sizegrip,-class,hint)  ""
set syndb(ttk::sizegrip,-class,arglist)  [list ]
set syndb(ttk::sizegrip,-cursor,type) "TKOPT"
set syndb(ttk::sizegrip,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::sizegrip,-cursor,hint)  ""
set syndb(ttk::sizegrip,-state,type) "TKOPT"
set syndb(ttk::sizegrip,-state,arglist)  [list normal disabled]
set syndb(ttk::sizegrip,-state,hint)  ""
set syndb(ttk::sizegrip,-style,type) "TKOPT"
set syndb(ttk::sizegrip,-style,hint)  ""
set syndb(ttk::sizegrip,-style,arglist)  [list ]
set syndb(ttk::sizegrip,-takefocus,type) "TKOPT"
set syndb(ttk::sizegrip,-takefocus,hint)  ""
set syndb(ttk::sizegrip,-takefocus,arglist)  [list ]

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

set syndb(ttk::treeview,treeview,type) "TKCMD"
set syndb(ttk::treeview,treeview,hint) ""
set syndb(ttk::treeview,treeview,arglist) [list -class -columns -cursor -displaycolumns -height -padding -selectmode -show -style -takefocus -xscrollcommand -yscrollcommand]
set syndb(ttk::treeview,-class,type) "TKOPT"
set syndb(ttk::treeview,-class,hint)  ""
set syndb(ttk::treeview,-class,arglist)  [list ]
set syndb(ttk::treeview,-columns,type) "TKOPT"
set syndb(ttk::treeview,-columns,hint)  ""
set syndb(ttk::treeview,-columns,arglist)  [list ]
set syndb(ttk::treeview,-cursor,type) "TKOPT"
set syndb(ttk::treeview,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(ttk::treeview,-cursor,hint)  ""
set syndb(ttk::treeview,-displaycolumns,type) "TKOPT"
set syndb(ttk::treeview,-displaycolumns,hint)  ""
set syndb(ttk::treeview,-displaycolumns,arglist)  [list ]
set syndb(ttk::treeview,-height,type) "TKOPT"
set syndb(ttk::treeview,-height,hint)  ""
set syndb(ttk::treeview,-height,arglist)  [list ]
set syndb(ttk::treeview,-padding,type) "TKOPT"
set syndb(ttk::treeview,-padding,hint)  ""
set syndb(ttk::treeview,-padding,arglist)  [list ]
set syndb(ttk::treeview,-selectmode,type) "TKOPT"
set syndb(ttk::treeview,-selectmode,hint)  ""
set syndb(ttk::treeview,-selectmode,arglist)  [list ]
set syndb(ttk::treeview,-show,type) "TKOPT"
set syndb(ttk::treeview,-show,hint)  ""
set syndb(ttk::treeview,-show,arglist)  [list ]
set syndb(ttk::treeview,-style,type) "TKOPT"
set syndb(ttk::treeview,-style,hint)  ""
set syndb(ttk::treeview,-style,arglist)  [list ]
set syndb(ttk::treeview,-takefocus,type) "TKOPT"
set syndb(ttk::treeview,-takefocus,hint)  ""
set syndb(ttk::treeview,-takefocus,arglist)  [list ]
set syndb(ttk::treeview,-xscrollcommand,type) "TKOPT"
set syndb(ttk::treeview,-xscrollcommand,hint)  ""
set syndb(ttk::treeview,-xscrollcommand,arglist)  [list ]
set syndb(ttk::treeview,-yscrollcommand,type) "TKOPT"
set syndb(ttk::treeview,-yscrollcommand,hint)  ""
set syndb(ttk::treeview,-yscrollcommand,arglist)  [list ]

set syndb(ttk::widget,widget,type) "TKCMD"
set syndb(ttk::widget,widget,hint) ""
set syndb(ttk::widget,widget,arglist) [list ]

set syndb(winfo,winfo,type) "TKCMD"
set syndb(winfo,winfo,hint) "winfo option ?arg arg ...?"
set syndb(winfo,winfo,arglist) [list atom atomname cells children class colormapfull containing depth exists fpixels geometry height id interps ismapped manager name parent pathname pixels pointerx pointerxy pointery reqheight reqwidth rgb rootx rooty screen screencells screendepth screenheight screenmmheight screenmmwidth screenvisual screenwidth server toplevel viewable visual visualid visualsavailable vrootheight vrootwidth vrootx vrooty width x y]
set syndb(winfo,atom,type) "TKARG"
set syndb(winfo,atom,hint)  "winfo atom ?-displayof window? name"
set syndb(winfo,atom,arglist)  [list ]
set syndb(winfo,atomname,type) "TKARG"
set syndb(winfo,atomname,hint)  "winfo atomname ?-displayof window? id"
set syndb(winfo,atomname,arglist)  [list -displayof]
set syndb(winfo,cells,type) "TKARG"
set syndb(winfo,cells,hint)  "winfo cells window"
set syndb(winfo,cells,arglist)  [list ]
set syndb(winfo,children,type) "TKARG"
set syndb(winfo,children,hint)  "winfo children window"
set syndb(winfo,children,arglist)  [list ]
set syndb(winfo,class,type) "TKARG"
set syndb(winfo,class,hint)  "winfo class window"
set syndb(winfo,class,arglist)  [list ]
set syndb(winfo,colormapfull,type) "TKARG"
set syndb(winfo,colormapfull,hint)  "winfo colormapfull window"
set syndb(winfo,colormapfull,arglist)  [list ]
set syndb(winfo,containing,type) "TKARG"
set syndb(winfo,containing,hint)  "winfo containing ?-displayof window? rootX rootY"
set syndb(winfo,containing,arglist)  [list -displayof]
set syndb(winfo,depth,type) "TKARG"
set syndb(winfo,depth,hint)  "winfo depth window"
set syndb(winfo,depth,arglist)  [list ]
set syndb(winfo,exists,type) "TKARG"
set syndb(winfo,exists,hint)  "winfo exists window"
set syndb(winfo,exists,arglist)  [list ]
set syndb(winfo,fpixels,type) "TKARG"
set syndb(winfo,fpixels,hint)  "winfo fpixels window number"
set syndb(winfo,fpixels,arglist)  [list ]
set syndb(winfo,geometry,type) "TKARG"
set syndb(winfo,geometry,hint)  "winfo geometry window"
set syndb(winfo,geometry,arglist)  [list ]
set syndb(winfo,height,type) "TKARG"
set syndb(winfo,height,hint)  "winfo height window"
set syndb(winfo,height,arglist)  [list ]
set syndb(winfo,id,type) "TKARG"
set syndb(winfo,id,hint)  "winfo id window"
set syndb(winfo,id,arglist)  [list ]
set syndb(winfo,interps,type) "TKARG"
set syndb(winfo,interps,hint)  "winfo interps ?-displayof window?"
set syndb(winfo,interps,arglist)  [list -displayof]
set syndb(winfo,ismapped,type) "TKARG"
set syndb(winfo,ismapped,hint)  "winfo ismapped window"
set syndb(winfo,ismapped,arglist)  [list ]
set syndb(winfo,manager,type) "TKARG"
set syndb(winfo,manager,hint)  "winfo manager window"
set syndb(winfo,manager,arglist)  [list ]
set syndb(winfo,name,type) "TKARG"
set syndb(winfo,name,hint)  "winfo name window"
set syndb(winfo,name,arglist)  [list ]
set syndb(winfo,parent,type) "TKARG"
set syndb(winfo,parent,hint)  "winfo parent window"
set syndb(winfo,parent,arglist)  [list ]
set syndb(winfo,pathname,type) "TKARG"
set syndb(winfo,pathname,hint)  "winfo pathname ?-displayof window? id"
set syndb(winfo,pathname,arglist)  [list -displayof]
set syndb(winfo,pixels,type) "TKARG"
set syndb(winfo,pixels,hint)  "winfo pixels window number"
set syndb(winfo,pixels,arglist)  [list ]
set syndb(winfo,pointerx,type) "TKARG"
set syndb(winfo,pointerx,hint)  "winfo pointerx window"
set syndb(winfo,pointerx,arglist)  [list ]
set syndb(winfo,pointerxy,type) "TKARG"
set syndb(winfo,pointerxy,hint)  "winfo pointerxy window"
set syndb(winfo,pointerxy,arglist)  [list ]
set syndb(winfo,pointery,type) "TKARG"
set syndb(winfo,pointery,hint)  "winfo pointery window"
set syndb(winfo,pointery,arglist)  [list ]
set syndb(winfo,reqheight,type) "TKARG"
set syndb(winfo,reqheight,hint)  "winfo reqheight window"
set syndb(winfo,reqheight,arglist)  [list ]
set syndb(winfo,reqwidth,type) "TKARG"
set syndb(winfo,reqwidth,hint)  "winfo reqwidth window"
set syndb(winfo,reqwidth,arglist)  [list ]
set syndb(winfo,rgb,type) "TKARG"
set syndb(winfo,rgb,hint)  "winfo rgb window color"
set syndb(winfo,rgb,arglist)  [list ]
set syndb(winfo,rootx,type) "TKARG"
set syndb(winfo,rootx,hint)  "winfo rootx window"
set syndb(winfo,rootx,arglist)  [list ]
set syndb(winfo,rooty,type) "TKARG"
set syndb(winfo,rooty,hint)  "winfo rooty window"
set syndb(winfo,rooty,arglist)  [list ]
set syndb(winfo,screen,type) "TKARG"
set syndb(winfo,screen,hint)  "winfo screen window"
set syndb(winfo,screen,arglist)  [list ]
set syndb(winfo,screencells,type) "TKARG"
set syndb(winfo,screencells,hint)  "winfo screencells window"
set syndb(winfo,screencells,arglist)  [list ]
set syndb(winfo,screendepth,type) "TKARG"
set syndb(winfo,screendepth,hint)  "winfo screendepth window"
set syndb(winfo,screendepth,arglist)  [list ]
set syndb(winfo,screenheight,type) "TKARG"
set syndb(winfo,screenheight,hint)  "winfo screenheight window"
set syndb(winfo,screenheight,arglist)  [list ]
set syndb(winfo,screenmmheight,type) "TKARG"
set syndb(winfo,screenmmheight,hint)  "winfo screenmmheight window"
set syndb(winfo,screenmmheight,arglist)  [list ]
set syndb(winfo,screenmmwidth,type) "TKARG"
set syndb(winfo,screenmmwidth,hint)  "winfo screenmmwidth window"
set syndb(winfo,screenmmwidth,arglist)  [list ]
set syndb(winfo,screenvisual,type) "TKARG"
set syndb(winfo,screenvisual,hint)  "winfo screenvisual window"
set syndb(winfo,screenvisual,arglist)  [list ]
set syndb(winfo,screenwidth,type) "TKARG"
set syndb(winfo,screenwidth,hint)  "winfo screenwidth window"
set syndb(winfo,screenwidth,arglist)  [list ]
set syndb(winfo,server,type) "TKARG"
set syndb(winfo,server,hint)  "winfo server window"
set syndb(winfo,server,arglist)  [list ]
set syndb(winfo,toplevel,type) "TKARG"
set syndb(winfo,toplevel,hint)  "winfo toplevel window"
set syndb(winfo,toplevel,arglist)  [list ]
set syndb(winfo,viewable,type) "TKARG"
set syndb(winfo,viewable,hint)  "winfo viewable window "
set syndb(winfo,viewable,arglist)  [list ]
set syndb(winfo,visual,type) "TKARG"
set syndb(winfo,visual,hint)  "winfo visual window"
set syndb(winfo,visual,arglist)  [list ]
set syndb(winfo,visualid,type) "TKARG"
set syndb(winfo,visualid,hint)  "winfo visualid window"
set syndb(winfo,visualid,arglist)  [list ]
set syndb(winfo,visualsavailable,type) "TKARG"
set syndb(winfo,visualsavailable,hint)  "winfo visualsavailable window ?includeids?"
set syndb(winfo,visualsavailable,arglist)  [list ]
set syndb(winfo,vrootheight,type) "TKARG"
set syndb(winfo,vrootheight,hint)  "winfo vrootheight window"
set syndb(winfo,vrootheight,arglist)  [list ]
set syndb(winfo,vrootwidth,type) "TKARG"
set syndb(winfo,vrootwidth,hint)  "winfo vrootwidth window"
set syndb(winfo,vrootwidth,arglist)  [list ]
set syndb(winfo,vrootx,type) "TKARG"
set syndb(winfo,vrootx,hint)  "winfo vrootx window"
set syndb(winfo,vrootx,arglist)  [list ]
set syndb(winfo,vrooty,type) "TKARG"
set syndb(winfo,vrooty,hint)  "winfo vrooty window"
set syndb(winfo,vrooty,arglist)  [list ]
set syndb(winfo,width,type) "TKARG"
set syndb(winfo,width,hint)  "winfo width window"
set syndb(winfo,width,arglist)  [list ]
set syndb(winfo,x,type) "TKARG"
set syndb(winfo,x,hint)  "winfo x window"
set syndb(winfo,x,arglist)  [list ]
set syndb(winfo,y,type) "TKARG"
set syndb(winfo,y,hint)  "winfo y window"
set syndb(winfo,y,arglist)  [list ]

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

set syndb(send,send,type) "TKCMD"
set syndb(send,send,hint) "send ?options? app cmd ?arg arg ...?"
set syndb(send,send,arglist) [list -async -displayof]
set syndb(send,-async,type) "TKOPT"
set syndb(send,-async,hint)  ""
set syndb(send,-async,arglist)  [list ]
set syndb(send,-displayof,type) "TKOPT"
set syndb(send,-displayof,hint)  ""
set syndb(send,-displayof,arglist)  [list ]

set syndb(spinbox,spinbox,type) "TKCMD"
set syndb(spinbox,spinbox,hint) "spinbox pathName ?options?"
set syndb(spinbox,spinbox,arglist) [list -activebackground -background -bd -bg -borderwidth -buttonbackground -buttoncursor -buttondownrelief -buttonuprelief -command -cursor -disabledbackground -disabledforeground -exportselection -fg -font -foreground -format -from -highlightbackground -highlightcolor -highlightthickness -increment -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -invalidcommand -invcmd -justify -readonlybackground -relief -repeatdelay -repeatinterval -selectbackground -selectborderwidth -selectforeground -state -takefocus -textvariable -to -validate -validatecommand -values -vcmd -width -xscrollcommand]
set syndb(spinbox,-activebackground,type) "TKOPT"
set syndb(spinbox,-activebackground,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-activebackground,hint)  ""
set syndb(spinbox,-background,type) "TKOPT"
set syndb(spinbox,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-background,hint)  ""
set syndb(spinbox,-bd,type) "TKOPT"
set syndb(spinbox,-bd,hint)  ""
set syndb(spinbox,-bd,arglist)  [list ]
set syndb(spinbox,-bg,type) "TKOPT"
set syndb(spinbox,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-bg,hint)  ""
set syndb(spinbox,-borderwidth,type) "TKOPT"
set syndb(spinbox,-borderwidth,hint)  ""
set syndb(spinbox,-borderwidth,arglist)  [list ]
set syndb(spinbox,-buttonbackground,type) "TKOPT"
set syndb(spinbox,-buttonbackground,hint)  ""
set syndb(spinbox,-buttonbackground,arglist)  [list ]
set syndb(spinbox,-buttoncursor,type) "TKOPT"
set syndb(spinbox,-buttoncursor,hint)  ""
set syndb(spinbox,-buttoncursor,arglist)  [list ]
set syndb(spinbox,-buttondownrelief,type) "TKOPT"
set syndb(spinbox,-buttondownrelief,hint)  ""
set syndb(spinbox,-buttondownrelief,arglist)  [list ]
set syndb(spinbox,-buttonuprelief,type) "TKOPT"
set syndb(spinbox,-buttonuprelief,hint)  ""
set syndb(spinbox,-buttonuprelief,arglist)  [list ]
set syndb(spinbox,-command,type) "TKOPT"
set syndb(spinbox,-command,hint)  ""
set syndb(spinbox,-command,arglist)  [list ]
set syndb(spinbox,-cursor,type) "TKOPT"
set syndb(spinbox,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(spinbox,-cursor,hint)  ""
set syndb(spinbox,-disabledbackground,type) "TKOPT"
set syndb(spinbox,-disabledbackground,hint)  ""
set syndb(spinbox,-disabledbackground,arglist)  [list ]
set syndb(spinbox,-disabledforeground,type) "TKOPT"
set syndb(spinbox,-disabledforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-disabledforeground,hint)  ""
set syndb(spinbox,-exportselection,type) "TKOPT"
set syndb(spinbox,-exportselection,hint)  ""
set syndb(spinbox,-exportselection,arglist)  [list ]
set syndb(spinbox,-fg,type) "TKOPT"
set syndb(spinbox,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-fg,hint)  ""
set syndb(spinbox,-font,type) "TKOPT"
set syndb(spinbox,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(spinbox,-font,hint)  ""
set syndb(spinbox,-foreground,type) "TKOPT"
set syndb(spinbox,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-foreground,hint)  ""
set syndb(spinbox,-format,type) "TKOPT"
set syndb(spinbox,-format,hint)  ""
set syndb(spinbox,-format,arglist)  [list ]
set syndb(spinbox,-from,type) "TKOPT"
set syndb(spinbox,-from,hint)  ""
set syndb(spinbox,-from,arglist)  [list ]
set syndb(spinbox,-highlightbackground,type) "TKOPT"
set syndb(spinbox,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-highlightbackground,hint)  ""
set syndb(spinbox,-highlightcolor,type) "TKOPT"
set syndb(spinbox,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-highlightcolor,hint)  ""
set syndb(spinbox,-highlightthickness,type) "TKOPT"
set syndb(spinbox,-highlightthickness,hint)  ""
set syndb(spinbox,-highlightthickness,arglist)  [list ]
set syndb(spinbox,-increment,type) "TKOPT"
set syndb(spinbox,-increment,hint)  ""
set syndb(spinbox,-increment,arglist)  [list ]
set syndb(spinbox,-insertbackground,type) "TKOPT"
set syndb(spinbox,-insertbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-insertbackground,hint)  ""
set syndb(spinbox,-insertborderwidth,type) "TKOPT"
set syndb(spinbox,-insertborderwidth,hint)  ""
set syndb(spinbox,-insertborderwidth,arglist)  [list ]
set syndb(spinbox,-insertofftime,type) "TKOPT"
set syndb(spinbox,-insertofftime,hint)  ""
set syndb(spinbox,-insertofftime,arglist)  [list ]
set syndb(spinbox,-insertontime,type) "TKOPT"
set syndb(spinbox,-insertontime,hint)  ""
set syndb(spinbox,-insertontime,arglist)  [list ]
set syndb(spinbox,-insertwidth,type) "TKOPT"
set syndb(spinbox,-insertwidth,hint)  ""
set syndb(spinbox,-insertwidth,arglist)  [list ]
set syndb(spinbox,-invalidcommand,type) "TKOPT"
set syndb(spinbox,-invalidcommand,hint)  ""
set syndb(spinbox,-invalidcommand,arglist)  [list ]
set syndb(spinbox,-invcmd,type) "TKOPT"
set syndb(spinbox,-invcmd,hint)  ""
set syndb(spinbox,-invcmd,arglist)  [list ]
set syndb(spinbox,-justify,type) "TKOPT"
set syndb(spinbox,-justify,arglist)  [list center left right]
set syndb(spinbox,-justify,hint)  ""
set syndb(spinbox,-readonlybackground,type) "TKOPT"
set syndb(spinbox,-readonlybackground,hint)  ""
set syndb(spinbox,-readonlybackground,arglist)  [list ]
set syndb(spinbox,-relief,type) "TKOPT"
set syndb(spinbox,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(spinbox,-relief,hint)  ""
set syndb(spinbox,-repeatdelay,type) "TKOPT"
set syndb(spinbox,-repeatdelay,hint)  ""
set syndb(spinbox,-repeatdelay,arglist)  [list ]
set syndb(spinbox,-repeatinterval,type) "TKOPT"
set syndb(spinbox,-repeatinterval,hint)  ""
set syndb(spinbox,-repeatinterval,arglist)  [list ]
set syndb(spinbox,-selectbackground,type) "TKOPT"
set syndb(spinbox,-selectbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-selectbackground,hint)  ""
set syndb(spinbox,-selectborderwidth,type) "TKOPT"
set syndb(spinbox,-selectborderwidth,hint)  ""
set syndb(spinbox,-selectborderwidth,arglist)  [list ]
set syndb(spinbox,-selectforeground,type) "TKOPT"
set syndb(spinbox,-selectforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(spinbox,-selectforeground,hint)  ""
set syndb(spinbox,-state,type) "TKOPT"
set syndb(spinbox,-state,arglist)  [list normal disabled]
set syndb(spinbox,-state,hint)  ""
set syndb(spinbox,-takefocus,type) "TKOPT"
set syndb(spinbox,-takefocus,hint)  ""
set syndb(spinbox,-takefocus,arglist)  [list ]
set syndb(spinbox,-textvariable,type) "TKOPT"
set syndb(spinbox,-textvariable,hint)  ""
set syndb(spinbox,-textvariable,arglist)  [list ]
set syndb(spinbox,-to,type) "TKOPT"
set syndb(spinbox,-to,hint)  ""
set syndb(spinbox,-to,arglist)  [list ]
set syndb(spinbox,-validate,type) "TKOPT"
set syndb(spinbox,-validate,hint)  ""
set syndb(spinbox,-validate,arglist)  [list ]
set syndb(spinbox,-validatecommand,type) "TKOPT"
set syndb(spinbox,-validatecommand,hint)  ""
set syndb(spinbox,-validatecommand,arglist)  [list ]
set syndb(spinbox,-values,type) "TKOPT"
set syndb(spinbox,-values,hint)  ""
set syndb(spinbox,-values,arglist)  [list ]
set syndb(spinbox,-vcmd,type) "TKOPT"
set syndb(spinbox,-vcmd,hint)  ""
set syndb(spinbox,-vcmd,arglist)  [list ]
set syndb(spinbox,-width,type) "TKOPT"
set syndb(spinbox,-width,hint)  ""
set syndb(spinbox,-width,arglist)  [list ]
set syndb(spinbox,-xscrollcommand,type) "TKOPT"
set syndb(spinbox,-xscrollcommand,hint)  ""
set syndb(spinbox,-xscrollcommand,arglist)  [list ]

set syndb(text,text,type) "TKCMD"
set syndb(text,text,hint) "text pathName ?options?"
set syndb(text,text,arglist) [list -align -autoseparators -background -bd -bg -bgstipple -borderwidth -create -cursor -elide -exportselection -fg -fgstipple -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -justify -lmargin1 -lmargin2 -maxundo -name -offset -overstrike -padx -pady -relief -rmargin -selectbackground -selectborderwidth -selectforeground -setgrid -spacing1 -spacing2 -spacing3 -state -stretch -tabs -takefocus -underline -undo -width -window -wrap -xscrollcommand -yscrollcommand]
set syndb(text,-align,type) "TKOPT"
set syndb(text,-align,hint)  ""
set syndb(text,-align,arglist)  [list ]
set syndb(text,-autoseparators,type) "TKOPT"
set syndb(text,-autoseparators,hint)  ""
set syndb(text,-autoseparators,arglist)  [list ]
set syndb(text,-background,type) "TKOPT"
set syndb(text,-background,arglist)  [list {[tk_chooseColor]}]
set syndb(text,-background,hint)  ""
set syndb(text,-bd,type) "TKOPT"
set syndb(text,-bd,hint)  ""
set syndb(text,-bd,arglist)  [list ]
set syndb(text,-bg,type) "TKOPT"
set syndb(text,-bg,arglist)  [list {[tk_chooseColor]}]
set syndb(text,-bg,hint)  ""
set syndb(text,-bgstipple,type) "TKOPT"
set syndb(text,-bgstipple,hint)  ""
set syndb(text,-bgstipple,arglist)  [list ]
set syndb(text,-borderwidth,type) "TKOPT"
set syndb(text,-borderwidth,hint)  ""
set syndb(text,-borderwidth,arglist)  [list ]
set syndb(text,-create,type) "TKOPT"
set syndb(text,-create,hint)  ""
set syndb(text,-create,arglist)  [list ]
set syndb(text,-cursor,type) "TKOPT"
set syndb(text,-cursor,arglist)  [list {[ez_chooseCursor]}]
set syndb(text,-cursor,hint)  ""
set syndb(text,-elide,type) "TKOPT"
set syndb(text,-elide,hint)  ""
set syndb(text,-elide,arglist)  [list ]
set syndb(text,-exportselection,type) "TKOPT"
set syndb(text,-exportselection,hint)  ""
set syndb(text,-exportselection,arglist)  [list ]
set syndb(text,-fg,type) "TKOPT"
set syndb(text,-fg,arglist)  [list {[tk_chooseColor]}]
set syndb(text,-fg,hint)  ""
set syndb(text,-fgstipple,type) "TKOPT"
set syndb(text,-fgstipple,hint)  ""
set syndb(text,-fgstipple,arglist)  [list ]
set syndb(text,-font,type) "TKOPT"
set syndb(text,-font,arglist)  [list {[ez_chooseFont]} TkCaptionFont TkDefaultFont TkFixedFont TkHeadingFont TkIconFont TkMenuFont TkSmallCaptionFont TkTextFont TkTooltipFont systemAlertHeaderFont systemApplicationFont systemDetailEmphasizedSystemFont systemDetailSystemFont systemEmphasizedSystemFont systemLabelFont systemMenuItemCmdKeyFont systemMenuItemFont systemMenuItemMarkFont systemMenuTitleFont systemMiniSystemFont systemPushButtonFont systemSmallEmphasizedSystemFont systemSmallSystemFont systemSystemFont systemToolbarFont systemUtilityWindowTitleFont systemViewsFont systemWindowTitleFont]
set syndb(text,-font,hint)  ""
set syndb(text,-foreground,type) "TKOPT"
set syndb(text,-foreground,arglist)  [list {[tk_chooseColor]}]
set syndb(text,-foreground,hint)  ""
set syndb(text,-height,type) "TKOPT"
set syndb(text,-height,hint)  ""
set syndb(text,-height,arglist)  [list ]
set syndb(text,-highlightbackground,type) "TKOPT"
set syndb(text,-highlightbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(text,-highlightbackground,hint)  ""
set syndb(text,-highlightcolor,type) "TKOPT"
set syndb(text,-highlightcolor,arglist)  [list {[tk_chooseColor]}]
set syndb(text,-highlightcolor,hint)  ""
set syndb(text,-highlightthickness,type) "TKOPT"
set syndb(text,-highlightthickness,hint)  ""
set syndb(text,-highlightthickness,arglist)  [list ]
set syndb(text,-image,type) "TKOPT"
set syndb(text,-image,arglist)  [list {[ez_chooseImage]}]
set syndb(text,-image,hint)  ""
set syndb(text,-insertbackground,type) "TKOPT"
set syndb(text,-insertbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(text,-insertbackground,hint)  ""
set syndb(text,-insertborderwidth,type) "TKOPT"
set syndb(text,-insertborderwidth,hint)  ""
set syndb(text,-insertborderwidth,arglist)  [list ]
set syndb(text,-insertofftime,type) "TKOPT"
set syndb(text,-insertofftime,hint)  ""
set syndb(text,-insertofftime,arglist)  [list ]
set syndb(text,-insertontime,type) "TKOPT"
set syndb(text,-insertontime,hint)  ""
set syndb(text,-insertontime,arglist)  [list ]
set syndb(text,-insertwidth,type) "TKOPT"
set syndb(text,-insertwidth,hint)  ""
set syndb(text,-insertwidth,arglist)  [list ]
set syndb(text,-justify,type) "TKOPT"
set syndb(text,-justify,arglist)  [list center left right]
set syndb(text,-justify,hint)  ""
set syndb(text,-lmargin1,type) "TKOPT"
set syndb(text,-lmargin1,hint)  ""
set syndb(text,-lmargin1,arglist)  [list ]
set syndb(text,-lmargin2,type) "TKOPT"
set syndb(text,-lmargin2,hint)  ""
set syndb(text,-lmargin2,arglist)  [list ]
set syndb(text,-maxundo,type) "TKOPT"
set syndb(text,-maxundo,hint)  ""
set syndb(text,-maxundo,arglist)  [list ]
set syndb(text,-name,type) "TKOPT"
set syndb(text,-name,hint)  ""
set syndb(text,-name,arglist)  [list ]
set syndb(text,-offset,type) "TKOPT"
set syndb(text,-offset,hint)  ""
set syndb(text,-offset,arglist)  [list ]
set syndb(text,-overstrike,type) "TKOPT"
set syndb(text,-overstrike,hint)  ""
set syndb(text,-overstrike,arglist)  [list ]
set syndb(text,-padx,type) "TKOPT"
set syndb(text,-padx,hint)  ""
set syndb(text,-padx,arglist)  [list ]
set syndb(text,-pady,type) "TKOPT"
set syndb(text,-pady,hint)  ""
set syndb(text,-pady,arglist)  [list ]
set syndb(text,-relief,type) "TKOPT"
set syndb(text,-relief,arglist)  [list raised sunken flat ridge solid groove]
set syndb(text,-relief,hint)  ""
set syndb(text,-rmargin,type) "TKOPT"
set syndb(text,-rmargin,hint)  ""
set syndb(text,-rmargin,arglist)  [list ]
set syndb(text,-selectbackground,type) "TKOPT"
set syndb(text,-selectbackground,arglist)  [list {[tk_chooseColor]}]
set syndb(text,-selectbackground,hint)  ""
set syndb(text,-selectborderwidth,type) "TKOPT"
set syndb(text,-selectborderwidth,hint)  ""
set syndb(text,-selectborderwidth,arglist)  [list ]
set syndb(text,-selectforeground,type) "TKOPT"
set syndb(text,-selectforeground,arglist)  [list {[tk_chooseColor]}]
set syndb(text,-selectforeground,hint)  ""
set syndb(text,-setgrid,type) "TKOPT"
set syndb(text,-setgrid,hint)  ""
set syndb(text,-setgrid,arglist)  [list ]
set syndb(text,-spacing1,type) "TKOPT"
set syndb(text,-spacing1,hint)  ""
set syndb(text,-spacing1,arglist)  [list ]
set syndb(text,-spacing2,type) "TKOPT"
set syndb(text,-spacing2,hint)  ""
set syndb(text,-spacing2,arglist)  [list ]
set syndb(text,-spacing3,type) "TKOPT"
set syndb(text,-spacing3,hint)  ""
set syndb(text,-spacing3,arglist)  [list ]
set syndb(text,-state,type) "TKOPT"
set syndb(text,-state,arglist)  [list normal disabled]
set syndb(text,-state,hint)  ""
set syndb(text,-stretch,type) "TKOPT"
set syndb(text,-stretch,hint)  ""
set syndb(text,-stretch,arglist)  [list ]
set syndb(text,-tabs,type) "TKOPT"
set syndb(text,-tabs,hint)  ""
set syndb(text,-tabs,arglist)  [list ]
set syndb(text,-takefocus,type) "TKOPT"
set syndb(text,-takefocus,hint)  ""
set syndb(text,-takefocus,arglist)  [list ]
set syndb(text,-underline,type) "TKOPT"
set syndb(text,-underline,hint)  ""
set syndb(text,-underline,arglist)  [list ]
set syndb(text,-undo,type) "TKOPT"
set syndb(text,-undo,hint)  ""
set syndb(text,-undo,arglist)  [list ]
set syndb(text,-width,type) "TKOPT"
set syndb(text,-width,hint)  ""
set syndb(text,-width,arglist)  [list ]
set syndb(text,-window,type) "TKOPT"
set syndb(text,-window,hint)  ""
set syndb(text,-window,arglist)  [list ]
set syndb(text,-wrap,type) "TKOPT"
set syndb(text,-wrap,hint)  ""
set syndb(text,-wrap,arglist)  [list ]
set syndb(text,-xscrollcommand,type) "TKOPT"
set syndb(text,-xscrollcommand,hint)  ""
set syndb(text,-xscrollcommand,arglist)  [list ]
set syndb(text,-yscrollcommand,type) "TKOPT"
set syndb(text,-yscrollcommand,hint)  ""
set syndb(text,-yscrollcommand,arglist)  [list ]

set syndb(tk,tk,type) "TKCMD"
set syndb(tk,tk,hint) "tk option ?arg arg ...?"
set syndb(tk,tk,arglist) [list -displayof appname caret fontchooser scaling tk useinputmethods window windowingsystem]
set syndb(tk,-displayof,type) "TKOPT"
set syndb(tk,-displayof,hint)  ""
set syndb(tk,-displayof,arglist)  [list ]
set syndb(tk,appname,type) "TKARG"
set syndb(tk,appname,hint)  "tk appname ?newName?"
set syndb(tk,appname,arglist)  [list ]
set syndb(tk,caret,type) "TKARG"
set syndb(tk,caret,hint)  "tk caret window ?-x x? ?-y y? ?-height height?"
set syndb(tk,caret,arglist)  [list ]
set syndb(tk,fontchooser,type) "TKARG"
set syndb(tk,fontchooser,hint)  "tk fontchooser subcommand ..."
set syndb(tk,fontchooser,arglist)  [list ]
set syndb(tk,scaling,type) "TKARG"
set syndb(tk,scaling,hint)  "tk scaling ?-displayof window? ?number?"
set syndb(tk,scaling,arglist)  [list ]
set syndb(tk,tk,type) "TKARG"
set syndb(tk,tk,hint)  ""
set syndb(tk,tk,arglist)  [list ]
set syndb(tk,useinputmethods,type) "TKARG"
set syndb(tk,useinputmethods,hint)  "tk useinputmethods ?-displayof window? ?boolean?"
set syndb(tk,useinputmethods,arglist)  [list ]
set syndb(tk,window,type) "TKARG"
set syndb(tk,window,hint)  ""
set syndb(tk,window,arglist)  [list ]
set syndb(tk,windowingsystem,type) "TKARG"
set syndb(tk,windowingsystem,hint)  "tk windowingsystem"
set syndb(tk,windowingsystem,arglist)  [list ]

set syndb(tkerror,tkerror,type) "TKCMD"
set syndb(tkerror,tkerror,hint) "tkerror message"
set syndb(tkerror,tkerror,arglist) [list ]

set syndb(tkwait,tkwait,type) "TKCMD"
set syndb(tkwait,tkwait,hint) "tkwait (variable | visibility | window) name"
set syndb(tkwait,tkwait,arglist) [list variable visibility window]
set syndb(tkwait,variable,type) "TKARG"
set syndb(tkwait,variable,hint)  ""
set syndb(tkwait,variable,arglist)  [list ]
set syndb(tkwait,visibility,type) "TKARG"
set syndb(tkwait,visibility,hint)  ""
set syndb(tkwait,visibility,arglist)  [list ]
set syndb(tkwait,window,type) "TKARG"
set syndb(tkwait,window,hint)  ""
set syndb(tkwait,window,arglist)  [list ]

set syndb(tk_bisque,tk_bisque,type) "TKCMD"
set syndb(tk_bisque,tk_bisque,hint) "tk_bisque"
set syndb(tk_bisque,tk_bisque,arglist) [list ]

set syndb(tk_chooseColor,tk_chooseColor,type) "TKCMD"
set syndb(tk_chooseColor,tk_chooseColor,hint) "tk_chooseColor ?option value ...?"
set syndb(tk_chooseColor,tk_chooseColor,arglist) [list -initialcolor -parent -title]
set syndb(tk_chooseColor,-initialcolor,type) "TKOPT"
set syndb(tk_chooseColor,-initialcolor,hint)  ""
set syndb(tk_chooseColor,-initialcolor,arglist)  [list ]
set syndb(tk_chooseColor,-parent,type) "TKOPT"
set syndb(tk_chooseColor,-parent,hint)  ""
set syndb(tk_chooseColor,-parent,arglist)  [list ]
set syndb(tk_chooseColor,-title,type) "TKOPT"
set syndb(tk_chooseColor,-title,hint)  ""
set syndb(tk_chooseColor,-title,arglist)  [list ]

set syndb(tk_chooseDirectory,tk_chooseDirectory,type) "TKCMD"
set syndb(tk_chooseDirectory,tk_chooseDirectory,hint) "tk_chooseDirectory ?option value ...?"
set syndb(tk_chooseDirectory,tk_chooseDirectory,arglist) [list -initialdir -mustexist -parent -title]
set syndb(tk_chooseDirectory,-initialdir,type) "TKOPT"
set syndb(tk_chooseDirectory,-initialdir,hint)  ""
set syndb(tk_chooseDirectory,-initialdir,arglist)  [list ]
set syndb(tk_chooseDirectory,-mustexist,type) "TKOPT"
set syndb(tk_chooseDirectory,-mustexist,hint)  ""
set syndb(tk_chooseDirectory,-mustexist,arglist)  [list ]
set syndb(tk_chooseDirectory,-parent,type) "TKOPT"
set syndb(tk_chooseDirectory,-parent,hint)  ""
set syndb(tk_chooseDirectory,-parent,arglist)  [list ]
set syndb(tk_chooseDirectory,-title,type) "TKOPT"
set syndb(tk_chooseDirectory,-title,hint)  ""
set syndb(tk_chooseDirectory,-title,arglist)  [list ]

set syndb(tk_dialog,tk_dialog,type) "TKCMD"
set syndb(tk_dialog,tk_dialog,hint) "tk_dialog window title text bitmap default string string ..."
set syndb(tk_dialog,tk_dialog,arglist) [list ]

set syndb(tk_focusFollowsMouse,tk_focusFollowsMouse,type) "TKCMD"
set syndb(tk_focusFollowsMouse,tk_focusFollowsMouse,hint) "tk_focusFollowsMouse"
set syndb(tk_focusFollowsMouse,tk_focusFollowsMouse,arglist) [list ]

set syndb(tk_focusNext,tk_focusNext,type) "TKCMD"
set syndb(tk_focusNext,tk_focusNext,hint) "tk_focusNext window"
set syndb(tk_focusNext,tk_focusNext,arglist) [list ]

set syndb(tk_focusPrev,tk_focusPrev,type) "TKCMD"
set syndb(tk_focusPrev,tk_focusPrev,hint) "tk_focusPrev window"
set syndb(tk_focusPrev,tk_focusPrev,arglist) [list ]

set syndb(tk_getOpenFile,tk_getOpenFile,type) "TKCMD"
set syndb(tk_getOpenFile,tk_getOpenFile,hint) "tk_getOpenFile ?option value ...?"
set syndb(tk_getOpenFile,tk_getOpenFile,arglist) [list -defaultextension -filetypes -initialdir -initialfile -message -multiple -parent -title]
set syndb(tk_getOpenFile,-defaultextension,type) "TKOPT"
set syndb(tk_getOpenFile,-defaultextension,hint)  ""
set syndb(tk_getOpenFile,-defaultextension,arglist)  [list ]
set syndb(tk_getOpenFile,-filetypes,type) "TKOPT"
set syndb(tk_getOpenFile,-filetypes,hint)  ""
set syndb(tk_getOpenFile,-filetypes,arglist)  [list ]
set syndb(tk_getOpenFile,-initialdir,type) "TKOPT"
set syndb(tk_getOpenFile,-initialdir,hint)  ""
set syndb(tk_getOpenFile,-initialdir,arglist)  [list ]
set syndb(tk_getOpenFile,-initialfile,type) "TKOPT"
set syndb(tk_getOpenFile,-initialfile,hint)  ""
set syndb(tk_getOpenFile,-initialfile,arglist)  [list ]
set syndb(tk_getOpenFile,-message,type) "TKOPT"
set syndb(tk_getOpenFile,-message,hint)  ""
set syndb(tk_getOpenFile,-message,arglist)  [list ]
set syndb(tk_getOpenFile,-multiple,type) "TKOPT"
set syndb(tk_getOpenFile,-multiple,hint)  ""
set syndb(tk_getOpenFile,-multiple,arglist)  [list ]
set syndb(tk_getOpenFile,-parent,type) "TKOPT"
set syndb(tk_getOpenFile,-parent,hint)  ""
set syndb(tk_getOpenFile,-parent,arglist)  [list ]
set syndb(tk_getOpenFile,-title,type) "TKOPT"
set syndb(tk_getOpenFile,-title,hint)  ""
set syndb(tk_getOpenFile,-title,arglist)  [list ]

set syndb(tk_getSaveFile,tk_getSaveFile,type) "TKCMD"
set syndb(tk_getSaveFile,tk_getSaveFile,hint) "tk_getSaveFile ?option value ...?"
set syndb(tk_getSaveFile,tk_getSaveFile,arglist) [list -defaultextension -filetypes -initialdir -initialfile -message -multiple -parent -title]
set syndb(tk_getSaveFile,-defaultextension,type) "TKOPT"
set syndb(tk_getSaveFile,-defaultextension,hint)  ""
set syndb(tk_getSaveFile,-defaultextension,arglist)  [list ]
set syndb(tk_getSaveFile,-filetypes,type) "TKOPT"
set syndb(tk_getSaveFile,-filetypes,hint)  ""
set syndb(tk_getSaveFile,-filetypes,arglist)  [list ]
set syndb(tk_getSaveFile,-initialdir,type) "TKOPT"
set syndb(tk_getSaveFile,-initialdir,hint)  ""
set syndb(tk_getSaveFile,-initialdir,arglist)  [list ]
set syndb(tk_getSaveFile,-initialfile,type) "TKOPT"
set syndb(tk_getSaveFile,-initialfile,hint)  ""
set syndb(tk_getSaveFile,-initialfile,arglist)  [list ]
set syndb(tk_getSaveFile,-message,type) "TKOPT"
set syndb(tk_getSaveFile,-message,hint)  ""
set syndb(tk_getSaveFile,-message,arglist)  [list ]
set syndb(tk_getSaveFile,-multiple,type) "TKOPT"
set syndb(tk_getSaveFile,-multiple,hint)  ""
set syndb(tk_getSaveFile,-multiple,arglist)  [list ]
set syndb(tk_getSaveFile,-parent,type) "TKOPT"
set syndb(tk_getSaveFile,-parent,hint)  ""
set syndb(tk_getSaveFile,-parent,arglist)  [list ]
set syndb(tk_getSaveFile,-title,type) "TKOPT"
set syndb(tk_getSaveFile,-title,hint)  ""
set syndb(tk_getSaveFile,-title,arglist)  [list ]

set syndb(tk_menuSetFocus,tk_menuSetFocus,type) "TKCMD"
set syndb(tk_menuSetFocus,tk_menuSetFocus,hint) "tk_menuSetFocus pathName"
set syndb(tk_menuSetFocus,tk_menuSetFocus,arglist) [list ]

set syndb(tk_messageBox,tk_messageBox,type) "TKCMD"
set syndb(tk_messageBox,tk_messageBox,hint) "tk_messageBox ?option value ...?"
set syndb(tk_messageBox,tk_messageBox,arglist) [list -default -icon -message -parent -title -type]
set syndb(tk_messageBox,-default,type) "TKOPT"
set syndb(tk_messageBox,-default,hint)  ""
set syndb(tk_messageBox,-default,arglist)  [list ]
set syndb(tk_messageBox,-icon,type) "TKOPT"
set syndb(tk_messageBox,-icon,hint)  ""
set syndb(tk_messageBox,-icon,arglist)  [list error info question warning]
set syndb(tk_messageBox,-message,type) "TKOPT"
set syndb(tk_messageBox,-message,hint)  ""
set syndb(tk_messageBox,-message,arglist)  [list ]
set syndb(tk_messageBox,-parent,type) "TKOPT"
set syndb(tk_messageBox,-parent,hint)  ""
set syndb(tk_messageBox,-parent,arglist)  [list ]
set syndb(tk_messageBox,-title,type) "TKOPT"
set syndb(tk_messageBox,-title,hint)  ""
set syndb(tk_messageBox,-title,arglist)  [list ]
set syndb(tk_messageBox,-type,type) "TKOPT"
set syndb(tk_messageBox,-type,hint)  ""
set syndb(tk_messageBox,-type,arglist)  [list abortretryignore ok okcancel retrycancel yesno yesnocancel]

set syndb(tk_optionMenu,tk_optionMenu,type) "TKCMD"
set syndb(tk_optionMenu,tk_optionMenu,hint) "tk_optionMenu pathName varName value ?value value ...?"
set syndb(tk_optionMenu,tk_optionMenu,arglist) [list ]

set syndb(CMDS) [list abs acos after append apply array asin atan atan2 auto_execok auto_load auto_mkindex auto_mkindex_old auto_qualify auto_reset bell bgerror binary bind bindtags bitmap bool break button canvas catch cd ceil chan checkbutton class clipboard clock close concat console constructor continue cos cosh dde deletemethod destroy destructor dict double encoding entier entry eof error eval event exec exit exp export expr fblocked fconfigure fcopy file fileevent filename filter floor flush fmod focus font for foreach format forward frame gets glob global grab grid history http::cleanup http::code http::config http::data http::error http::formatQuery http::geturl http::meta http::ncode http::register http::reset http::size http::status http::unregister http::wait hypot if image incr info int interp isqrt join label labelframe lappend lassign lindex linsert list listbox llength load loadTk log log10 lower lrange lrepeat lreplace lreverse lsearch lset lsort max memory menu menubutton message method min mixin msgcat::mc msgcat::mcload msgcat::mclocale msgcat::mcmax msgcat::mcmset msgcat::mcreferences msgcat::mcset msgcat::mcunknown my namespace next oo::class oo::copy oo::define oo::objdefine oo::object open option options pack package panedwindow parray photo pid pkg pkg_mkIndex place platform::generic platform::identify platform::patterns platform::shell::generic platform::shell::identify platform::shell::platform pow proc puts pwd radiobutton raise rand re_syntax read refchan regexp registry regsub rename renamemethod resource return round safe::interpAddToAccessPath safe::interpConfigure safe::interpCreate safe::interpDelete safe::interpFindInAccessPath safe::interpInit safe::setLogCmd scale scan scrollbar seek selection self send set sin sinh socket source spinbox split sqrt srand string subst superclass switch tan tanh tcl::prefix tcl_endOfWord tcl_findLibrary tcl_startOfNextWord tcl_startOfPreviousWord tcl_wordBreakAfter tcl_wordBreakBefore tcltest::bytestring tcltest::cleanupTests tcltest::configure tcltest::customMatch tcltest::debug tcltest::errorChannel tcltest::errorFile tcltest::interpreter tcltest::limitConstraints tcltest::loadFile tcltest::loadScript tcltest::loadTestedCommands tcltest::makeDirectory tcltest::makeFile tcltest::match tcltest::matchDirectories tcltest::matchFiles tcltest::normalizeMsg tcltest::normalizePath tcltest::outputChannel tcltest::outputFile tcltest::preserveCore tcltest::removeDirectory tcltest::removeFile tcltest::runAllTests tcltest::singleProcess tcltest::skip tcltest::skipDirectories tcltest::skipFiles tcltest::temporaryDirectory tcltest::test tcltest::testConstraint tcltest::testsDirectory tcltest::verbose tcltest::viewFile tcltest::workingDirectory tell text throw time tk tk_bisque tk_chooseColor tk_chooseDirectory tk_dialog tk_focusFollowsMouse tk_focusNext tk_focusPrev tk_getOpenFile tk_getSaveFile tk_menuSetFocus tk_messageBox tk_optionMenu tk_popup tk_setPalette tk_textCopy tk_textCut tk_textPaste tkerror tkwait toplevel trace try ttk::button ttk::checkbutton ttk::combobox ttk::entry ttk::frame ttk::image ttk::intro ttk::label ttk::labelframe ttk::menubutton ttk::notebook ttk::panedwindow ttk::progressbar ttk::radiobutton ttk::scale ttk::scrollbar ttk::separator ttk::sizegrip ttk::style ttk::treeview ttk::widget unexport unknown unset update uplevel upvar variable vwait while wide winfo wm zlib]
