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
