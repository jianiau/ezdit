set syndb(read,read,type) "TCLCMD"
set syndb(read,read,hint) "read (?-nonewline? channelId |  channelId numChars)"
set syndb(read,read,arglist) [list -nonewline]
set syndb(read,-nonewline,type) "TCLARG"
set syndb(read,-nonewline,hint)  ""
set syndb(read,-nonewline,arglist)  [list] 
