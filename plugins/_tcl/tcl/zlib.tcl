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
