#
# Copyright (c) 2003-2009, Ashok P. Nadkarni
# All rights reserved.
#
# See the file LICENSE for license

# Contains commands available in the full twapi build only.
# Return list of process ids
# Note if -path or -name is specified, then processes for which this
# information cannot be obtained are skipped
proc twapi::get_process_ids {args} {

    set save_args $args;                # Need to pass to process_exists
    array set opts [parseargs args {
        user.arg
        path.arg
        name.arg
        logonsession.arg
        glob} -maxleftover 0]

    if {[info exists opts(path)] && [info exists opts(name)]} {
        error "Options -path and -name are mutually exclusive"
    }

    if {$opts(glob)} {
        set match_op match
    } else {
        set match_op equal
    }

    set process_pids [list ]

    # If we do not care about user or path, Twapi_GetProcessList
    # is faster than EnumProcesses or the WTS functions
    if {[info exists opts(user)] == 0 &&
        [info exists opts(logonsession)] == 0 &&
        [info exists opts(path)] == 0} {
        if {[info exists opts(name)] == 0} {
            return [Twapi_GetProcessList -1 0]
        }
        # We need to match against the name
        foreach {pid piddata} [Twapi_GetProcessList -1 2] {
            if {[string $match_op -nocase $opts(name) [kl_get $piddata ProcessName]]} {
                lappend process_pids $pid
            }
        }
        return $process_pids
    }

    # Only want pids with a specific user or path

    # If is the name we are looking for, try using the faster WTS
    # API's first. If they are not available, we try a slower method
    # If we need to match paths or logon sessions, we don't try this
    # at all as the wts api's don't provide that info
    if {[info exists opts(path)] == 0 &&
        [info exists opts(logonsession)] == 0} {
        if {[info exists opts(user)]} {
            if {[catch {map_account_to_sid $opts(user)} sid]} {
                # No such user. Return empty list (no processes)
                return [list ]
            }
        }
        if {! [catch {WTSEnumerateProcesses NULL} wtslist]} {
            foreach wtselem $wtslist {
                array set procinfo $wtselem
                if {[info exists sid] &&
                    $procinfo(pUserSid) ne $sid} {
                    continue;           # User does not match
                }
                if {[info exists opts(name)]} {
                    # We need to match on name as well
                    if {![string $match_op -nocase $opts(name) $procinfo(pProcessName)]} {
                        # No match
                        continue
                    }
                }
                lappend process_pids $procinfo(ProcessId)
            }
            return $process_pids
        }
    }

    # Either we are matching on path/logonsession, or the WTS call failed
    # Try yet another way.

    # Note that in the code below, we use "file join" with a single arg
    # to convert \ to /. Do not use file normalize as that will also
    # land up converting relative paths to full paths
    if {[info exists opts(path)]} {
        set opts(path) [file join $opts(path)]
    }

    set process_pids [list ]
    if {[info exists opts(name)]} {
        # Note we may reach here if the WTS call above failed
        foreach {pid piddata} [Twapi_GetProcessList -1 2] {
            if {[string $match_op -nocase $opts(name) [kl_get $piddata ProcessName]]} {
                lappend all_pids $pid
            }
        }
    } else {
        set all_pids [Twapi_GetProcessList -1 0]
    }

    set popts [list ]
    foreach opt {path user logonsession} {
        if {[info exists opts($opt)]} {
            lappend popts -$opt
        }
    }
    foreach {pid piddata} [eval [list get_multiple_process_info $all_pids] $popts] {
        array set pidvals $piddata
        if {[info exists opts(path)] &&
            ![string $match_op -nocase $opts(path) [file join $pidvals(-path)]]} {
            continue
        }

        if {[info exists opts(user)] && $pidvals(-user) ne $opts(user)} {
            continue
        }

        if {[info exists opts(logonsession)] &&
            $pidvals(-logonsession) ne $opts(logonsession)} {
            continue
        }

        lappend process_pids $pid
    }
    return $process_pids
}


# Return list of modules handles for a process
proc twapi::get_process_modules {pid args} {
    variable windefs

    array set opts [parseargs args {handle name path imagedata all}]

    if {$opts(all)} {
        foreach opt {handle name path imagedata} {
            set opts($opt) 1
        }
    }
    set noopts [expr {($opts(name) || $opts(path) || $opts(imagedata) || $opts(handle)) == 0}]

    set hpid [get_process_handle $pid -access {process_query_information process_vm_read}]
    set results [list ]
    try {
        foreach module [EnumProcessModules $hpid] {
            if {$noopts} {
                lappend results $module
                continue
            }
            set module_data [list ]
            if {$opts(handle)} {
                lappend module_data -handle $module
            }
            if {$opts(name)} {
                if {[catch {GetModuleBaseName $hpid $module} name]} {
                    set name ""
                }
                lappend module_data -name $name
            }
           if {$opts(path)} {
                if {[catch {GetModuleFileNameEx $hpid $module} path]} {
                    set path ""
                }
               lappend module_data -path [_normalize_path $path]
            }
            if {$opts(imagedata)} {
                if {[catch {GetModuleInformation $hpid $module} imagedata]} {
                    set base ""
                    set size ""
                    set entry ""
                } else {
                    array set temp $imagedata
                    set base $temp(lpBaseOfDll)
                    set size $temp(SizeOfImage)
                    set entry $temp(EntryPoint)
                }
                lappend module_data -imagedata [list $base $size $entry]
            }
            lappend results $module_data
        }
    } finally {
        CloseHandle $hpid
    }
    return $results
}


#
# Kill a process
# Returns 1 if process was ended, 0 if not ended within timeout
#
proc twapi::end_process {pid args} {

    array set opts [parseargs args {
        {exitcode.int 1}
        force
        {wait.int 0}
    }]

    set process_path [get_process_path $pid]

    # First try to close nicely. We need to send messages to toplevels
    # as well as message-only windows.
    set toplevels [concat [get_toplevel_windows -pid $pid] [find_windows -pids [list $pid] -messageonlywindow true]]
    if {[llength $toplevels]} {
        # Try and close by sending them a message. WM_CLOSE is 0x10
        foreach toplevel $toplevels {
            # Send a message but come back right away
            if {0} {
                catch {PostMessage $toplevel 0x10 0 0}
            } else {
                catch {SendNotifyMessage $toplevel 0x10 0 0}
            }
        }

        # Wait for the specified time to verify process has gone away
        set gone [twapi::wait {process_exists $pid -path $process_path} 0 $opts(wait)]
        if {$gone || ! $opts(force)} {
            # Succeeded or do not want to force a kill
            return $gone
        }

        # Only wait 10 ms since we have already waited above
        if {$opts(wait)} {
            set opts(wait) 10
        }
    }

    # Open the process for terminate access. IF access denied (5), retry after
    # getting the required privilege
    try {
        set hpid [get_process_handle $pid -access process_terminate]
    } onerror {TWAPI_WIN32 5} {
        # Retry - if still fail, then just throw the error
        eval_with_privileges {
            set hpid [get_process_handle $pid -access process_terminate]
        } SeDebugPrivilege
    }

    try {
        TerminateProcess $hpid $opts(exitcode)
    } finally {
        CloseHandle $hpid
    }

    if {0} {
        While the process is being terminated, we can get access denied
        if we try to get the path so this if branch is commented out
        return [twapi::wait {process_exists $pid -path $process_path} 0 $opts(wait)]
    } else {
        return [twapi::wait {process_exists $pid} 0 $opts(wait)]
    }
}

#
# Get the path of a process
proc twapi::get_process_path {pid args} {
    return [eval [list twapi::_get_process_name_path_helper $pid path] $args]
}

#
# Get the path of a process
proc twapi::get_process_name {pid args} {
    return [eval [list twapi::_get_process_name_path_helper $pid name] $args]
}


# Return list of device drivers
proc twapi::get_device_drivers {args} {
    variable windefs

    array set opts [parseargs args {name path base all}]

    set results [list ]
    foreach module [EnumDeviceDrivers] {
        catch {unset module_data}
        if {$opts(base) || $opts(all)} {
            set module_data [list -base $module]
        }
        if {$opts(name) || $opts(all)} {
            if {[catch {GetDeviceDriverBaseName $module} name]} {
                    set name ""
            }
            lappend module_data -name $name
        }
        if {$opts(path) || $opts(all)} {
            if {[catch {GetDeviceDriverFileName $module} path]} {
                set path ""
            }
            lappend module_data -path [_normalize_path $path]
        }
        if {[info exists module_data]} {
            lappend results $module_data
        }
    }

    return $results
}

# Check if the given process exists
# 0 - does not exist or exists but paths/names do not match,
# 1 - exists and matches path (or no -path or -name specified)
# -1 - exists but do not know path and cannot compare
proc twapi::process_exists {pid args} {
    array set opts [parseargs args { path.arg name.arg glob}]

    # Simplest case - don't care about name or path
    if {! ([info exists opts(path)] || [info exists opts(name)])} {
        if {[llength [Twapi_GetProcessList $pid 0]] == 0} {
            return 0
        } else {
            return 1
        }
    }

    # Can't specify both name and path
    if {[info exists opts(path)] && [info exists opts(name)]} {
        error "Options -path and -name are mutually exclusive"
    }

    if {$opts(glob)} {
        set string_cmd match
    } else {
        set string_cmd equal
    }

    if {[info exists opts(name)]} {
        # Name is specified
        set piddata [Twapi_GetProcessList $pid 2]
        if {[llength $piddata] &&
            [string $string_cmd -nocase $opts(name) [kl_get [lindex $piddata 1] ProcessName]]} {
            # PID exists and name matches
            return 1
        } else {
            return 0
        }
    }

    # Need to match on the path
    set process_path [get_process_path $pid -noexist "" -noaccess "(unknown)"]
    if {[string length $process_path] == 0} {
        # No such process
        return 0
    }

    # Process with this pid exists
    # Path still has to match
    if {[string equal $process_path "(unknown)"]} {
        # Exists but cannot check path/name
        return -1
    }

    # Note we do not use file normalize here since that will tack on
    # absolute paths which we do not want for glob matching

    # We use [file join ] to convert \ to / to avoid special
    # interpretation of \ in string match command
    return [string $string_cmd -nocase [file join $opts(path)] [file join $process_path]]
}

#
# Get the parent process of a thread. Return "" if no such thread
proc twapi::get_thread_parent_process_id {tid} {
    set status [catch {
        set th [get_thread_handle $tid]
        try {
            set pid [lindex [lindex [Twapi_NtQueryInformationThreadBasicInformation $th] 2] 0]
        } finally {
            close_handles [list $th]
        }
    }]

    if {$status == 0} {
        return $pid
    }


    # Could not use undocumented function. Try slooooow perf counter method
    set pid_paths [get_perf_thread_counter_paths $tid -pid]
    if {[llength $pid_paths] == 0} {
        return ""
    }

    if {[get_counter_path_value [lindex [lindex $pid_paths 0] 3] -var pid]} {
        return $pid
    } else {
        return ""
    }
}

#
# Get the thread ids belonging to a process
proc twapi::get_process_thread_ids {pid} {
    return [lindex [lindex [get_multiple_process_info [list $pid] -tids] 1] 1]
}


#
# Get process information
proc twapi::get_process_info {pid args} {
    return [lindex [eval [list get_multiple_process_info [list $pid]] $args] 1]
}


#
# Get multiple process information
proc twapi::get_multiple_process_info {pids args} {

    # Options that are directly available from Twapi_GetProcessList
    if {![info exists ::twapi::get_multiple_process_info_base_opts]} {
        # Array value is the flags to pass to Twapi_GetProcessList
        array set ::twapi::get_multiple_process_info_base_opts {
            basepriority       1
            parent             1
            tssession          1
            name               2
            createtime         4
            usertime           4
            privilegedtime     4
            elapsedtime        4
            handlecount        4
            pagefaults         8
            pagefilebytes      8
            pagefilebytespeak  8
            poolnonpagedbytes  8
            poolnonpagedbytespeak  8
            poolpagedbytes     8
            poolpagedbytespeak 8
            threadcount        4
            virtualbytes       8
            virtualbytespeak   8
            workingset         8
            workingsetpeak     8
            tids               32
        }

        # The ones below are not supported on NT 4
        if {[min_os_version 5]} {
            array set ::twapi::get_multiple_process_info_base_opts {
                ioreadops         16
                iowriteops        16
                iootherops        16
                ioreadbytes       16
                iowritebytes      16
                iootherbytes      16
            }
        }
    }


    # Note the PDH options match those of twapi::get_process_perf_counter_paths
    set pdh_opts {
        privatebytes
    }

    set pdh_rate_opts {
        privilegedutilization
        processorutilization
        userutilization
        iodatabytesrate
        iodataopsrate
        iootherbytesrate
        iootheropsrate
        ioreadbytesrate
        ioreadopsrate
        iowritebytesrate
        iowriteopsrate
        pagefaultrate
    }

    set token_opts {
        user
        groups
        primarygroup
        privileges
        logonsession
    }

    array set opts [parseargs args \
                        [concat [list all \
                                     pid \
                                     handles \
                                     path \
                                     toplevels \
                                     commandline \
                                     priorityclass \
                                     [list noexist.arg "(no such process)"] \
                                     [list noaccess.arg "(unknown)"] \
                                     [list interval.int 100]] \
                             [array names ::twapi::get_multiple_process_info_base_opts] \
                             $token_opts \
                             $pdh_opts \
                             $pdh_rate_opts]]

    array set results {}

    # If user is requested, try getting it through terminal services
    # if possible since the token method fails on some newer platforms
    if {$opts(all) || $opts(user)} {
        _get_wts_pids wtssids wtsnames
    }

    # See if any Twapi_GetProcessList options are requested and if
    # so, calculate the appropriate flags
    set flags 0
    foreach opt [array names ::twapi::get_multiple_process_info_base_opts] {
        if {$opts($opt) || $opts(all)} {
            set flags [expr {$flags | $::twapi::get_multiple_process_info_base_opts($opt)}]
        }
    }
    if {$flags} {
        if {[llength $pids] == 1} {
            array set basedata [twapi::Twapi_GetProcessList [lindex $pids 0] $flags]
        } else {
            array set basedata [twapi::Twapi_GetProcessList -1 $flags]
        }
    }

    foreach pid $pids {
        set result [list ]

        if {$opts(all) || $opts(pid)} {
            lappend result -pid $pid
        }

        foreach {opt field} {
            createtime         CreateTime
            usertime           UserTime
            privilegedtime     KernelTime
            handlecount        HandleCount
            pagefaults         VmCounters.PageFaultCount
            pagefilebytes      VmCounters.PagefileUsage
            pagefilebytespeak  VmCounters.PeakPagefileUsage
            poolnonpagedbytes  VmCounters.QuotaNonPagedPoolUsage
            poolnonpagedbytespeak  VmCounters.QuotaPeakNonPagedPoolUsage
            poolpagedbytespeak     VmCounters.QuotaPeakPagedPoolUsage
            poolpagedbytes     VmCounters.QuotaPagedPoolUsage
            basepriority       BasePriority
            threadcount        ThreadCount
            virtualbytes       VmCounters.VirtualSize
            virtualbytespeak   VmCounters.PeakVirtualSize
            workingset         VmCounters.WorkingSetSize
            workingsetpeak     VmCounters.PeakWorkingSetSize
            ioreadops          IoCounters.ReadOperationCount
            iowriteops         IoCounters.WriteOperationCount
            iootherops         IoCounters.OtherOperationCount
            ioreadbytes        IoCounters.ReadTransferCount
            iowritebytes       IoCounters.WriteTransferCount
            iootherbytes       IoCounters.OtherTransferCount
            parent             InheritedFromProcessId
            tssession          SessionId
        } {
            if {$opts($opt) || $opts(all)} {
                if {[info exists basedata($pid)]} {
                    lappend result -$opt [twapi::kl_get $basedata($pid) $field]
                } else {
                    lappend result -$opt $opts(noexist)
                }
            }
        }

        if {$opts(elapsedtime) || $opts(all)} {
            if {[info exists basedata($pid)]} {
                lappend result -elapsedtime [expr {[clock seconds]-[large_system_time_to_secs [twapi::kl_get $basedata($pid) CreateTime]]}]
            } else {
                lappend result -elapsedtime $opts(noexist)
            }
        }

        if {$opts(tids) || $opts(all)} {
            if {[info exists basedata($pid)]} {
                set tids [list ]
                foreach {tid threaddata} [twapi::kl_get $basedata($pid) Threads] {
                    lappend tids $tid
                }
                lappend result -tids $tids
            } else {
                lappend result -tids $opts(noexist)
            }
        }

        if {$opts(name) || $opts(all)} {
            if {[info exists basedata($pid)]} {
                set name [twapi::kl_get $basedata($pid) ProcessName]
                if {$name eq ""} {
                    if {[is_system_pid $pid]} {
                        set name "System"
                    } elseif {[is_idle_pid $pid]} {
                        set name "System Idle Process"
                    }
                }
                lappend result -name $name
            } else {
                lappend result -name $opts(noexist)
            }
        }

        if {$opts(all) || $opts(path)} {
            lappend result -path [get_process_path $pid -noexist $opts(noexist) -noaccess $opts(noaccess)]
        }

        if {$opts(all) || $opts(priorityclass)} {
            try {
                set prioclass [get_priority_class $pid]
            } onerror {TWAPI_WIN32 5} {
                set prioclass $opts(noaccess)
            } onerror {TWAPI_WIN32 87} {
                set prioclass $opts(noexist)
            }
            lappend result -priorityclass $prioclass
        }

        if {$opts(all) || $opts(toplevels)} {
            set toplevels [get_toplevel_windows -pid $pid]
            if {[llength $toplevels]} {
                lappend result -toplevels $toplevels
            } else {
                if {[process_exists $pid]} {
                    lappend result -toplevels [list ]
                } else {
                    lappend result -toplevels $opts(noexist)
                }
            }
        }

        # NOTE: we do not check opts(all) for handles since the latter
        # is an unsupported option
        if {$opts(handles)} {
            set handles [list ]
            foreach hinfo [get_open_handles $pid] {
                lappend handles [list [kl_get $hinfo -handle] [kl_get $hinfo -type] [kl_get $hinfo -name]]
            }
            lappend result -handles $handles
        }

        if {$opts(all) || $opts(commandline)} {
            lappend result -commandline [get_process_commandline $pid -noexist $opts(noexist) -noaccess $opts(noaccess)]
        }

        # Now get token related info, if any requested
        set requested_opts [list ]
        if {$opts(all) || $opts(user)} {
            # See if we already have the user. Note sid of system idle
            # will be empty string
            if {[info exists wtssids($pid)]} {
                if {$wtssids($pid) == ""} {
                    # Put user as System
                    lappend result -user "SYSTEM"
                } else {
                    # We speed up account lookup by caching sids
                    if {[info exists sidcache($wtssids($pid))]} {
                        lappend result -user $sidcache($wtssids($pid))
                    } else {
                        set uname [lookup_account_sid $wtssids($pid)]
                        lappend result -user $uname
                        set sidcache($wtssids($pid)) $uname
                    }
                }
            } else {
                lappend requested_opts -user
            }
        }
        foreach opt {groups primarygroup privileges logonsession} {
            if {$opts(all) || $opts($opt)} {
                lappend requested_opts -$opt
            }
        }
        if {[llength $requested_opts]} {
            try {
                eval lappend result [_get_token_info process $pid $requested_opts]
            } onerror {TWAPI_WIN32 5} {
                foreach opt $requested_opts {
                    set tokresult($opt) $opts(noaccess)
                }
                # The NETWORK SERVICE and LOCAL SERVICE processes cannot
                # be accessed. If we are looking for the logon session for
                # these, try getting it from the witssid if we have it
                # since the logon session is hardcoded for these accounts
                if {[lsearch -exact $requested_opts "-logonsession"] >= 0} {
                    if {![info exists wtssids]} {
                        _get_wts_pids wtssids wtsnames
                    }
                    if {[info exists wtssids($pid)]} {
                        # Map user SID to logon session
                        switch -exact -- $wtssids($pid) {
                            S-1-5-18 {
                                # SYSTEM
                                set tokresult(-logonsession) 00000000-000003e7
                            }
                            S-1-5-19 {
                                # LOCAL SERVICE
                                set tokresult(-logonsession) 00000000-000003e5
                            }
                            S-1-5-20 {
                                # LOCAL SERVICE
                                set tokresult(-logonsession) 00000000-000003e4
                            }
                        }
                    }
                }

                # Similarly, if we are looking for user account, special case
                # system and system idle processes
                if {[lsearch -exact $requested_opts "-user"] >= 0} {
                    if {[is_idle_pid $pid] || [is_system_pid $pid]} {
                        set tokresult(-user) SYSTEM
                    }
                }

                set result [concat $result [array get tokresult]]
            } onerror {TWAPI_WIN32 87} {
                foreach opt $requested_opts {
                    if {$opt eq "-user" && ([is_idle_pid $pid] || [is_system_pid $pid])} {
                        lappend result $opt SYSTEM
                    } else {
                        lappend result $opt $opts(noexist)
                    }
                }
            }
        }

        set results($pid) $result
    }

    # Now deal with the PDH stuff. We need to track what data we managed
    # to get
    array set gotdata {}

    # Now retrieve each PDH non-rate related counter which do not
    # require an interval of measurement
    set wanted_pdh_opts [_array_non_zero_switches opts $pdh_opts $opts(all)]
    if {[llength $wanted_pdh_opts] != 0} {
        set counters [eval [list get_perf_process_counter_paths $pids] \
                          $wanted_pdh_opts]
        foreach {opt pid val} [get_perf_values_from_metacounter_info $counters -interval 0] {
            lappend results($pid) $opt $val
            set gotdata($pid,$opt) 1; # Since we have the data
        }
    }

    # NOw do the rate related counter. Again, we need to track missing data
    set wanted_pdh_rate_opts [_array_non_zero_switches opts $pdh_rate_opts $opts(all)]
    foreach pid $pids {
        foreach opt $wanted_pdh_rate_opts {
            set missingdata($pid,$opt) 1
        }
    }
    if {[llength $wanted_pdh_rate_opts] != 0} {
        set counters [eval [list get_perf_process_counter_paths $pids] \
                          $wanted_pdh_rate_opts]
        foreach {opt pid val} [get_perf_values_from_metacounter_info $counters -interval $opts(interval)] {
            lappend results($pid) $opt $val
            set gotdata($pid,$opt) 1; # Since we have the data
        }
    }

    # For data that we could not get from PDH assume the process does not exist
    foreach pid $pids {
        foreach opt [concat $wanted_pdh_opts $wanted_pdh_rate_opts] {
            if {![info exists gotdata($pid,$opt)]} {
                # Could not get this combination. Assume missing process
                lappend results($pid) $opt $opts(noexist)
            }
        }
    }

    return [array get results]
}


#
# Get thread information
# TBD - add info from GetGUIThreadInfo
proc twapi::get_thread_info {tid args} {

    # Options that are directly available from Twapi_GetProcessList
    if {![info exists ::twapi::get_thread_info_base_opts]} {
        # Array value is the flags to pass to Twapi_GetProcessList
        array set ::twapi::get_thread_info_base_opts {
            pid 32
            elapsedtime 96
            waittime 96
            usertime 96
            createtime 96
            privilegedtime 96
            contextswitches 96
            basepriority 160
            priority 160
            startaddress 160
            state 160
            waitreason 160
        }
    }

    # Note the PDH options match those of twapi::get_thread_perf_counter_paths
    # Right now, we don't need any PDH non-rate options
    set pdh_opts {
    }
    set pdh_rate_opts {
        privilegedutilization
        processorutilization
        userutilization
        contextswitchrate
    }

    set token_opts {
        groups
        user
        primarygroup
        privileges
    }

    array set opts [parseargs args \
                        [concat [list all \
                                     relativepriority \
                                     tid \
                                     [list noexist.arg "(no such thread)"] \
                                     [list noaccess.arg "(unknown)"] \
                                     [list interval.int 100]] \
                             [array names ::twapi::get_thread_info_base_opts] \
                             $token_opts $pdh_opts $pdh_rate_opts]]

    set requested_opts [_array_non_zero_switches opts $token_opts $opts(all)]
    # Now get token info, if any
    if {[llength $requested_opts]} {
        try {
            try {
                set results [_get_token_info thread $tid $requested_opts]
            } onerror {TWAPI_WIN32 1008} {
                # Thread does not have its own token. Use it's parent process
                set results [_get_token_info process [get_thread_parent_process_id $tid] $requested_opts]
            }
        } onerror {TWAPI_WIN32 5} {
            # No access
            foreach opt $requested_opts {
                lappend results $opt $opts(noaccess)
            }
        } onerror {TWAPI_WIN32 87} {
            # Thread does not exist
            foreach opt $requested_opts {
                lappend results $opt $opts(noexist)
            }
        }

    } else {
        set results [list ]
    }

    # Now get the base options
    set flags 0
    foreach opt [array names ::twapi::get_thread_info_base_opts] {
        if {$opts($opt) || $opts(all)} {
            set flags [expr {$flags | $::twapi::get_thread_info_base_opts($opt)}]
        }
    }

    if {$flags} {
        # We need at least one of the base options
        foreach {pid piddata} [twapi::Twapi_GetProcessList -1 $flags] {
            foreach {thread_id threaddata} [kl_get $piddata Threads] {
                if {$tid == $thread_id} {
                    # Found the thread we want
                    array set threadinfo $threaddata
                    break
                }
            }
            if {[info exists threadinfo]} {
                break;  # Found it, no need to keep looking through other pids
            }
        }
        # It is possible that we looped through all the processs without
        # a thread match. Hence we check again that we have threadinfo for
        # each option value
        foreach {opt field} {
            pid            ClientId.UniqueProcess
            waittime       WaitTime
            usertime       UserTime
            createtime     CreateTime
            privilegedtime KernelTime
            basepriority   BasePriority
            priority       Priority
            startaddress   StartAddress
            state          State
            waitreason     WaitReason
            contextswitches ContextSwitchCount
        } {
            if {$opts($opt) || $opts(all)} {
                if {[info exists threadinfo]} {
                    lappend results -$opt $threadinfo($field)
                } else {
                    lappend results -$opt $opts(noexist)
                }
            }
        }

        if {$opts(elapsedtime) || $opts(all)} {
            if {[info exists threadinfo(CreateTime)]} {
                lappend results -elapsedtime [expr {[clock seconds]-[large_system_time_to_secs $threadinfo(CreateTime)]}]
            } else {
                lappend results -elapsedtime $opts(noexist)
            }
        }
    }

    # Now retrieve each PDH non-rate related counter which do not
    # require an interval of measurement
    set requested_opts [_array_non_zero_switches opts $pdh_opts $opts(all)]
    array set pdhdata {}
    if {[llength $requested_opts] != 0} {
        set counter_list [eval [list get_perf_thread_counter_paths [list $tid]] \
                          $requested_opts]
        foreach {opt tid value} [get_perf_values_from_metacounter_info $counter_list -interval 0] {
            set pdhdata($opt) $value
        }
        foreach opt $requested_opts {
            if {[info exists pdhdata($opt)]} {
                lappend results $opt $pdhdata($opt)
            } else {
                # Assume does not exist
                lappend results $opt $opts(noexist)
            }
        }
    }


    # Now do the same for any interval based counters
    set requested_opts [_array_non_zero_switches opts $pdh_rate_opts $opts(all)]
    if {[llength $requested_opts] != 0} {
        set counter_list [eval [list get_perf_thread_counter_paths [list $tid]] \
                          $requested_opts]
        foreach {opt tid value} [get_perf_values_from_metacounter_info $counter_list -interval $opts(interval)] {
            set pdhdata($opt) $value
        }
        foreach opt $requested_opts {
            if {[info exists pdhdata($opt)]} {
                lappend results $opt $pdhdata($opt)
            } else {
                # Assume does not exist
                lappend results $opt $opts(noexist)
            }
        }
    }

    if {$opts(all) || $opts(relativepriority)} {
        try {
            lappend results -relativepriority [get_thread_relative_priority $tid]
        } onerror {TWAPI_WIN32 5} {
            lappend results -relativepriority $opts(noaccess)
        } onerror {TWAPI_WIN32 87} {
            lappend results -relativepriority $opts(noexist)
        }
    }

    if {$opts(all) || $opts(tid)} {
        lappend results -tid $tid
    }

    return $results
}

#
# Get a handle to a thread
proc twapi::get_thread_handle {tid args} {
    # OpenThread masks off the bottom two bits thereby converting
    # an invalid tid to a real one. We do not want this.
    if {$tid & 3} {
        win32_error 87;         # "The parameter is incorrect"
    }

    array set opts [parseargs args {
        {access.arg thread_query_information}
        {inherit.bool 0}
    }]
    return [OpenThread [_access_rights_to_mask $opts(access)] $opts(inherit) $tid]
}

#
# Suspend a thread
proc twapi::suspend_thread {tid} {
    set htid [get_thread_handle $tid -access thread_suspend_resume)]
    try {
        set status [SuspendThread $htid]
    } finally {
        CloseHandle $htid
    }
    return $status
}

#
# Resume a thread
proc twapi::resume_thread {tid} {
    set htid [get_thread_handle $tid -access thread_suspend_resume)]
    try {
        set status [ResumeThread $htid]
    } finally {
        CloseHandle $htid
    }
    return $status
}

#
# Get the command line for a process
proc twapi::get_process_commandline {pid args} {

    if {[is_system_pid $pid] || [is_idle_pid $pid]} {
        return ""
    }

    array set opts [parseargs args {
        {noexist.arg "(no such process)"}
        {noaccess.arg "(unknown)"}
    }]

    try {
        # Assume max command line len is 1024 chars (2048 bytes)
        set max_len 2048
        set hgbl [GlobalAlloc 0 $max_len]
        set pgbl [GlobalLock $hgbl]
        try {
            set hpid [get_process_handle $pid -access {process_query_information process_vm_read}]
        } onerror {TWAPI_WIN32 87} {
            # Process does not exist
            return $opts(noexist)
        }

        # Get the address where the PEB is stored - see Nebbett
        set peb_addr [lindex [Twapi_NtQueryInformationProcessBasicInformation $hpid] 1]
        # Read the PEB as binary
        # The pointer to the process information block is the 5th longword
        ReadProcessMemory $hpid [expr {16+$peb_addr}] $pgbl 4

        # Convert this to an integer address
        if {![binary scan [Twapi_ReadMemoryBinary $pgbl 0 4] i info_addr]} {
            error "Could not get address of process information block"
        }
        # The pointer to the command line is stored at offset 68
        ReadProcessMemory $hpid [expr {$info_addr + 68}] $pgbl 4
        if {![binary scan [Twapi_ReadMemoryBinary $pgbl 0 4] i cmdline_addr]} {
            error "Could not get address of command line"
        }

        # Now read the command line itself. We do not know the length
        # so assume MAX_PATH (1024) chars (2048 bytes). However, this may
        # fail if the memory beyond the command line is not allocated in the
        # target process. So we have to check for this error and retry with
        # smaller read sizes
        while {$max_len > 128} {
            try {
                ReadProcessMemory $hpid $cmdline_addr $pgbl $max_len
                break
            } onerror {TWAPI_WIN32 299} {
                # Reduce read size
                set max_len [expr {$max_len / 2}]
            }
        }

        # OK, got something. It's in Unicode format, may not be null terminated
        # or may have multiple null terminated strings. THe command line
        # is the first string.
        set cmdline [encoding convertfrom unicode [Twapi_ReadMemoryBinary $pgbl 0 $max_len]]
        set null_offset [string first "\0" $cmdline]
        if {$null_offset >= 0} {
            set cmdline [string range $cmdline 0 [expr {$null_offset-1}]]
        }

    } onerror {TWAPI_WIN32 5} {
        # Access denied
        set cmdline $opts(noaccess)
    } finally {
        if {[info exists hpid]} {
            close_handles $hpid
        }
        if {[info exists hgbl]} {
            if {[info exists pgbl]} {
                # We had locked the memory
                GlobalUnlock $hgbl
            }
            GlobalFree $hgbl
        }
    }

    return $cmdline
}


#
# Get process parent - can return ""
proc twapi::get_process_parent {pid args} {
    array set opts [parseargs args {
        {noexist.arg "(no such process)"}
        {noaccess.arg "(unknown)"}
    }]

    if {[is_system_pid $pid] || [is_idle_pid $pid]} {
        return ""
    }

    try {
        set hpid [get_process_handle $pid]
        set parent [lindex [Twapi_NtQueryInformationProcessBasicInformation $hpid] 5]

    } onerror {TWAPI_WIN32 5} {
        set error noaccess
    } onerror {TWAPI_WIN32 87} {
        set error noexist
    } finally {
        if {[info exists hpid]} {
            close_handles $hpid
        }
    }

    # TBD - if above fails, try through Twapi_GetProcessList

    if {![info exists parent]} {
        # Try getting through pdh library
        set counters [get_perf_process_counter_paths $pid -parent]
        if {[llength counters]} {
            set vals [get_perf_values_from_metacounter_info $counters -interval 0]
            if {[llength $vals] > 2} {
                set parent [lindex $vals 2]
            }
        }
        if {![info exists parent]} {
            set parent $opts($error)
        }
    }

    return $parent
}

#
# Get the base priority class of a process
proc twapi::get_priority_class {pid} {
    set ph [get_process_handle $pid]
    try {
        return [GetPriorityClass $ph]
    } finally {
        CloseHandle $ph
    }
}

#
# Get the base priority class of a process
proc twapi::set_priority_class {pid priority} {
    set ph [get_process_handle $pid -access process_set_information]
    try {
        SetPriorityClass $ph $priority
    } finally {
        CloseHandle $ph
    }
}

#
# Get the priority of a thread
proc twapi::get_thread_relative_priority {tid} {
    set h [get_thread_handle $tid]
    try {
        return [GetThreadPriority $h]
    } finally {
        CloseHandle $h
    }
}

#
# Set the priority of a thread
proc twapi::set_thread_relative_priority {tid priority} {
    switch -exact -- $priority {
        abovenormal { set priority 1 }
        belownormal { set priority -1 }
        highest     { set priority 2 }
        idle        { set priority -15 }
        lowest      { set priority -2 }
        normal      { set priority 0 }
        timecritical { set priority 15 }
        default {
            if {![string is integer -strict $priority]} {
                error "Invalid priority value '$priority'."
            }
        }
    }

    set h [get_thread_handle $tid -access thread_set_information]
    try {
        SetThreadPriority $h $priority
    } finally {
        CloseHandle $h
    }
}


#
# Utility procedures
#


#
# Get the path of a process
proc twapi::_get_process_name_path_helper {pid {type name} args} {
    variable windefs

    array set opts [parseargs args {
        {noexist.arg "(no such process)"}
        {noaccess.arg "(unknown)"}
    }]

    if {![string is integer $pid]} {
        error "Invalid non-numeric pid $pid"
    }
    if {[is_system_pid $pid]} {
        return "System"
    }
    if {[is_idle_pid $pid]} {
        return "System Idle Process"
    }

    try {
        set hpid [get_process_handle $pid -access {process_query_information process_vm_read}]
    } onerror {TWAPI_WIN32 87} {
        return $opts(noexist)
    } onerror {TWAPI_WIN32 5} {
        # Access denied
        # If it is the name we want, first try WTS and if that
        # fails try getting it from PDH (slowest)

        if {[string equal $type "name"]} {
            if {! [catch {WTSEnumerateProcesses NULL} wtslist]} {
                foreach wtselem $wtslist {
                    if {[kl_get $wtselem ProcessId] == $pid} {
                        return [kl_get $wtselem pProcessName]
                    }
                }
            }

            # That failed as well, try PDH
            set pdh_path [lindex [lindex [twapi::get_perf_process_counter_paths [list $pid] -pid] 0] 3]
            array set pdhinfo [parse_perf_counter_path $pdh_path]
            return $pdhinfo(instance)
        }
        return $opts(noaccess)
    }

    try {
        set module [lindex [EnumProcessModules $hpid] 0]
        if {[string equal $type "name"]} {
            set path [GetModuleBaseName $hpid $module]
        } else {
            set path [_normalize_path [GetModuleFileNameEx $hpid $module]]
        }
    } onerror {TWAPI_WIN32 5} {
        # Access denied
        # On win2k (and may be Win2k3), if the process has exited but some
        # app still has a handle to the process, the OpenProcess succeeds
        # but the EnumProcessModules call returns access denied. So
        # check for this case
        if {[min_os_version 5 0]} {
            # Try getting exit code. 259 means still running.
            # Anything else means process has terminated
            if {[GetExitCodeProcess $hpid] == 259} {
                return $opts(noaccess)
            } else {
                return $opts(noexist)
            }
        } else {
            # Rethrows original error - note try automatically beings these
            # into scope
            error $errorResult $errorInfo $errorCode
        }
    } finally {
        CloseHandle $hpid
    }
    return $path
}

#
# Fill in arrays with result from WTSEnumerateProcesses if available
proc twapi::_get_wts_pids {v_sids v_names} {
    # Note this call is expected to fail on NT 4.0 without terminal server
    if {! [catch {WTSEnumerateProcesses NULL} wtslist]} {
        upvar $v_sids wtssids
        upvar $v_names wtsnames
        foreach wtselem $wtslist {
            set pid [kl_get $wtselem ProcessId]
            set wtssids($pid) [kl_get $wtselem pUserSid]
            set wtsnames($pid) [kl_get $wtselem pProcessName]
        }
    }
}
