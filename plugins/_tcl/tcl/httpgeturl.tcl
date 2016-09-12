set syndb(http::geturl,geturl,type) "TCLCMD"
set syndb(http::geturl,geturl,hint) "http::geturl url ?options?"
set syndb(http::geturl,geturl,arglist) [list -blocksize -channel -command -handler -headers -keepalive \
	-method -myaddr -progress -protocol -query -queryblocksize -querychannel -queryprogress -strict -timeout -type -validate \
]

