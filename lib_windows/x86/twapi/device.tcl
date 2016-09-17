#
# Copyright (c) 2008 Ashok P. Nadkarni
# All rights reserved.
#
# See the file LICENSE for license


# Callback invoked for device changes.
# Does some processing of passed data and then invokes the
# real callback script
proc twapi::_device_change_callback {script args} {
    # For volume notifications, change drive bitmask to
    # list of drives before passing back to script
    set event [lindex $args 0]
    if {[lindex $args 1] eq "devtyp_volume" &&
        ($event eq "deviceremovecomplete" || $event eq "devicearrival")} {
        set args [lreplace $args 2 2 [_drivemask_to_drivelist [lindex $args 2]]]

        # Also indicate whether network volume and whether change is a media
        # change or physical change
        set attrs [list ]
        set flags [lindex $args 3]
        if {$flags & 1} {
            lappend attrs mediachange
        }
        if {$flags & 2} {
            lappend attrs networkvolume
        }
        set args [lreplace $args 3 3 $attrs]
    }

    eval $script $args
}

proc twapi::start_device_change_monitor {script args} {
    array set opts [parseargs args {
        deviceinterface.arg
    } -maxleftover 0 -nulldefault]

    # For reference - some common device interface classes
    # USB Raw Device    {a5dcbf10-6530-11d2-901f-00c04fb951ed}
    # Disk Device       {53f56307-b6bf-11d0-94f2-00a0c91efb8b}
    # Network Card      {ad498944-762f-11d0-8dcb-00c04fc3358c}
    # Human Interface Device (HID)      {4d1e55b2-f16f-11cf-88cb-001111000030}

    switch -exact -- $opts(deviceinterface) {
        port            { set type 3 ; set opts(deviceinterface) "" }
        volume          { set type 2 ; set opts(deviceinterface) "" }
        default {
            # device interface class guid or empty string (for all device interfaces)
            set type 5
        }
    }

    set hwnd [Twapi_DeviceChangeNotifyStart [list ::twapi::_device_change_callback $script] $type $opts(deviceinterface)]
    return $hwnd
}

#
# Stop monitoring of device changes
interp alias {} ::twapi::stop_device_change_monitor {} ::twapi::Twapi_DeviceChangeNotifyStop


#
# Retrieve a device information set for a device setup or interface class
proc twapi::update_devinfoset {args} {
    array set opts [parseargs args {
        {guid.arg ""}
        {classtype.arg setup {interface setup}}
        {presentonly.bool false}
        {currentprofileonly.bool false}
        {deviceinfoset.arg NULL}
        {hwin.int 0}
        {system.arg ""}
        {pnpname.arg ""}
    } -maxleftover 0]

    # DIGCF_ALLCLASSES is bitmask 4
    set flags [expr {$opts(guid) eq "" ? 0x4 : 0}]
    if {$opts(classtype) eq "interface"} {
        # DIGCF_DEVICEINTERFACE
        set flags [expr {$flags | 0x10}]
    }
    if {$opts(presentonly)} {
        # DIGCF_PRESENT
        set flags [expr {$flags | 0x2}]
    }
    if {$opts(currentprofileonly)} {
        # DIGCF_PRESENT
        set flags [expr {$flags | 0x8}]
    }

    return [SetupDiGetClassDevsEx \
                $opts(guid) \
                $opts(pnpname) \
                $opts(hwin) \
                $flags \
                $opts(deviceinfoset) \
                $opts(system)]
}


#
# Close and release resources for a device information set
interp alias {} twapi::close_devinfoset {} twapi::SetupDiDestroyDeviceInfoList


#
# Given a device information set, returns the device elements within it
proc twapi::get_devinfoset_elements {hdevinfo} {
    set result [list ]
    set i 0
    set devinfo_data_buf [_alloc_SP_DEVINFO_DATA]
    try {
        while {true} {
            SetupDiEnumDeviceInfo $hdevinfo $i $devinfo_data_buf
            lappend result [_decode_SP_DEVINFO_DATA $devinfo_data_buf]
            incr i
        }
    } onerror {TWAPI_WIN32 259} {
        # Fine, Just means no more items
    } finally {
        free $devinfo_data_buf
    }
    return $result
}

#
# Given a device information set, returns a list of specified registry
# properties for all elements of the set
# args is list of properties to retrieve
proc twapi::get_devinfoset_registry_properties {hdevinfo args} {
    set result [list ]
    # Allocate a buffer to hold device info data
    set devinfo_data_buf [_alloc_SP_DEVINFO_DATA]
    try {
        set propval_buf_sz 256
        set propval_buf [malloc_and_cast $propval_buf_sz BYTE]

        # Keep looping until there is an error saying no more items
        set i 0
        while {true} {
            SetupDiEnumDeviceInfo $hdevinfo $i $devinfo_data_buf

            # First element is the DEVINFO_DATA element
            set item [list -deviceelement [_decode_SP_DEVINFO_DATA $devinfo_data_buf]]

            # Get all specified property values
            foreach prop $args {
                set prop [_device_registry_sym_to_code $prop]

                # Get the property value. We keep looping, increasing the
                # buffer size if necessary. We catch exceptions so we
                # can continue to get values for other devices even
                # though the current device may not support the
                # property
                try {
                    while {true} {
                        foreach {status regtype size} \
                            [SetupDiGetDeviceRegistryProperty \
                                 $hdevinfo \
                                 $devinfo_data_buf \
                                 $prop \
                                 $propval_buf \
                                 $propval_buf_sz] \
                            break
                        if {$status} {
                            break
                        }
                        # Need a bigger buffer
                        free $propval_buf
                        set propval_buf ""; # In case of exception, do not want to free in finally clause!
                        set propval_buf_sz $size
                        set propval_buf [malloc_and_cast $propval_buf_sz BYTE]
                        # loop around to try again
                    }
                    lappend item $prop [list success [_decode_mem_registry_value $regtype $propval_buf $size]]
                } onerror {} {
                    lappend item $prop [list fail $errorCode]
                }
            }
            lappend result $item

            incr i
        }
    } onerror {TWAPI_WIN32 259} {
        # Fine, Just means no more items
    } finally {
        free $devinfo_data_buf
        if {[info exists propval_buf] && $propval_buf ne ""} {
            free $propval_buf
        }
    }

    return $result
}


#
# Given a device information set, returns specified device interface
# properties
proc twapi::get_devinfoset_interface_details {hdevinfo guid args} {
    set result [list ]

    array set opts [parseargs args {
        matchdeviceelement.arg
        interfaceclass
        flags
        devicepath
        deviceelement
        ignoreerrors
    } -maxleftover 0]

    # Allocate a buffer to hold device info data if necessary
    if {[info exists opts(matchdeviceelement)]} {
        set devinfo_data_buf [_alloc_SP_DEVINFO_DATA $opts(matchdeviceelement)]
    } else {
        set devinfo_data_buf NULL
    }

    set interface_data_buf [_alloc_SP_DEVICE_INTERFACE_DATA]

    if {$opts(devicepath)} {
        set device_path_buf_sz 256
        set device_path_buf [malloc_and_cast $device_path_buf_sz SP_DEVICE_INTERFACE_DETAIL_DATA_W 6]
    } else {
        set device_path_buf_sz 0
        set device_path_buf NULL
    }

    if {$opts(deviceelement)} {
        set element_buf [_alloc_SP_DEVINFO_DATA]
    } else {
        set element_buf NULL
    }

    try {
        # Keep looping until there is an error saying no more items
        set i 0
        while {true} {
            SetupDiEnumDeviceInterfaces $hdevinfo $devinfo_data_buf $guid $i $interface_data_buf

            set item [list ]
            if {$opts(interfaceclass)} {
                lappend item -interfaceclass [_decode_mem_guid $interface_data_buf 4]
            }
            if {$opts(flags)} {
                set flags    [Twapi_ReadMemoryInt $interface_data_buf 20]
                set symflags [_make_symbolic_bitmask $flags {active 1 default 2 removed 4} false]
                lappend item -flags [linsert $symflags 0 $flags]
            }

            if {$opts(devicepath) || $opts(deviceelement)} {

                # Need to get device interface detail.
                # If we want the device path, we have to keep looping, and
                # increase the buffer size as needed. If we just want
                # the device element, no need to loop

                try {
                    while {true} {
                        foreach {status size} \
                            [SetupDiGetDeviceInterfaceDetail \
                                 $hdevinfo \
                                 $interface_data_buf \
                                 $device_path_buf \
                                 $device_path_buf_sz \
                                 $element_buf] break

                        if {$status || ! $opts(devicepath)} {
                            # Success, or
                            # device path not specified, but we don't care
                            # since we only want the device element
                            break
                        }

                        # Need a bigger buffer
                        free $device_path_buf
                        set device_path_buf NULL; # In case of exception
                        set device_path_buf_sz $size
                        set device_path_buf [malloc_and_cast $device_path_buf_sz SP_DEVICE_INTERFACE_DETAIL_DATA_W 6]
                        # loop around to try again
                    }
                    if {$opts(deviceelement)} {
                        lappend item -deviceelement [list [_decode_mem_guid $element_buf 4] [Twapi_ReadMemoryInt $element_buf 20]]
                    }
                    if {$opts(devicepath)} {
                        lappend item -devicepath [Twapi_ReadMemoryUnicode $device_path_buf 4 -1]
                    }
                } onerror {} {
                    if {! $opts(ignoreerrors)} {
                        error $errorResult $errorInfo $errorCode
                    }
                }
            }
            lappend result $item

            incr i
        }
    } onerror {TWAPI_WIN32 259} {
        # Fine, Just means no more items
    } finally {
        free $devinfo_data_buf; # OK to pass NULL
        free $interface_data_buf
    }

    return $result
}


#
# Return the guids associated with a device class set name. Note
# the latter is not unique so multiple guids may be associated.
proc twapi::device_setup_class_name_to_guids {name} {
    set n 8;                    # Assume at most 8 guids
    try {
        while {true} {
            # Each guid is 16 bytes
            set p [malloc_and_cast [expr {16*$n}] GUID]
            set count [twapi::SetupDiClassGuidsFromNameEx $name $p $n]
            if {$count <= $n} {
                # The buffer was big enough
                set guids [list ]
                set bin [Twapi_ReadMemoryBinary $p 0 [expr {16*$count}]]
                for {set i 0} {$i < $count} {incr i} {
                    lappend guids [_binary_to_guid $bin [expr {16*$i}]]
                }
                return $guids;  # p is freed in finally clause below
            } else {
                # Buffer not big enough. Reallocate
                free $p
                unset p
                set n $count
            }
        }
    } finally {
        if {[info exists p]} {
            free $p
        }
    }
}

#
# Given a setup class guid, return the name of the setup class
interp alias {} twapi::device_setup_class_guid_to_name {} twapi::SetupDiClassNameFromGuidEx

#
# REturn the device instance id from a device element
interp alias {} twapi::get_device_element_instance_id {} twapi::SetupDiGetDeviceInstanceId


#
# Utility functions

proc twapi::_init_device_registry_code_maps {} {
    variable _device_registry_syms
    variable _device_registry_codes

    # Note this list is ordered based on the corresponding integer codes
    set _device_registry_code_syms {
        devicedesc hardwareid compatibleids unused0 service unused1
        unused2 class classguid driver configflags mfg friendlyname
        location physical capabilities ui upperfilters lowerfilters
        bustypeguid legacybustype busnumber enumerator security
        security devtype exclusive characteristics address ui device
        removal removal removal install location
    }

    set i 0
    foreach sym $_device_registry_code_syms {
        set _device_registry_codes($sym) $i
        incr i
    }
}

#
# Map a device registry property to a symbol
proc twapi::_device_registry_code_to_sym {code} {
    _init_device_registry_code_maps

    # Once we have initialized, redefine ourselves so we do not do so
    # every time. Note define at global ::twapi scope!
    proc ::twapi::_device_registry_code_to_sym {code} {
        variable _device_registry_code_syms
        if {$code >= [llength $_device_registry_code_syms]} {
            return $code
        } else {
            return [lindex $_device_registry_code_syms $code]
        }
    }
    # Call the redefined proc
    return [_device_registry_code_to_sym $code]
}

#
# Map a device registry property symbol to a numeric code
proc twapi::_device_registry_sym_to_code {sym} {
    _init_device_registry_code_maps

    # Once we have initialized, redefine ourselves so we do not do so
    # every time. Note define at global ::twapi scope!
    proc ::twapi::_device_registry_sym_to_code {sym} {
        variable _device_registry_codes
        # Return the value. If non-existent, an error will be raised
        if {[info exists _device_registry_codes($sym)]} {
            return $_device_registry_codes($sym)
        } elseif {[string is integer -strict $sym]} {
            return $sym
        } else {
            error "Unknown or unsupported device registry property symbol '$sym'"
        }
    }
    # Call the redefined proc
    return [_device_registry_sym_to_code $sym]
}

#
# Allocate and init a SP_DEVICEINFO_DATA buffer.
# If no setup class specified, no init is done except
# for the size field
proc twapi::_alloc_SP_DEVINFO_DATA {{deviceelement {}}} {
    set buf [malloc_and_cast 28 SP_DEVINFO_DATA 28]; # Als inits cbSize

    if {[llength $deviceelement]} {
        if {[llength $deviceelement] != 3} {
            error "Invalid device element."
        }
        # Write the GUID (16 bytes)
        Twapi_WriteMemoryBinary $buf 4 28 [_guid_to_binary [lindex $deviceelement 0]]
        # Write the device instance
        Twapi_WriteMemoryInt $buf 20 28 [lindex $deviceelement 1]
        # Write the reserved dword
        Twapi_WriteMemoryInt $buf 24 28 [lindex $deviceelement 2]
    }

    return $buf
}

#
# Allocate and init a SP_DEVICEINFO_DATA buffer.
# If no setup class specified, no init is done except
# for the size field
proc twapi::_alloc_SP_DEVICE_INTERFACE_DATA {{interfaceclass ""} {flags 0}} {
    set buf [malloc_and_cast 28 SP_DEVICE_INTERFACE_DATA 28]; # Also inits cbSize

    if {$interfaceclass ne ""} {
        Twapi_WriteMemoryBinary $buf 4 28 [_guid_to_binary $interfaceclass]; # InterfaceClassGuid
        Twapi_WriteMemoryInt $buf 20 28 $flags; # Flags
        Twapi_WriteMemoryInt $buf 24 28 0;      # Reserved
    }

    return $buf
}

proc twapi::_decode_SP_DEVINFO_DATA {mem} {
    # Note the 3rd (reserved) element is very important - it is stored
    # as an opaque value by the system and must be included any
    # time the SP_DEVINFO_DATA is passed back into the system.
    return [list [_decode_mem_guid $mem 4] [Twapi_ReadMemoryInt $mem 20] [Twapi_ReadMemoryInt $mem 24]]
}

#
# Do a device ioctl, returning result as a binary
proc twapi::device_ioctl {h code args} {
    variable _ioctl_membuf;     # Memory buffer is reused so we do not allocate every time
    variable _ioctl_membuf_size

    array set opts [parseargs args {
        {inputbuffer.arg NULL}
        {inputcount.int 0}
    } -maxleftover 0]

    if {![info exists _ioctl_membuf]} {
        set _ioctl_membuf_size 128
        set _ioctl_membuf [malloc $_ioctl_membuf_size]
    }

    # Note on an exception error, the output buffer stays allocated.
    # That is not a bug.
    while {true} {
        try {
            # IMPORTANT NOTE: the last parameter OVERLAPPED must be NULL
            # since device_ioctl is not reentrant (because of the use
            # of the "static" output buffer) and hence must not
            # be used in asynchronous operation where it might be called
            # before the previous call has finished.
            set outcount [DeviceIoControl $h $code $opts(inputbuffer) $opts(inputcount) $_ioctl_membuf $_ioctl_membuf_size NULL]
        } onerror {TWAPI_WIN32 122} {
            # Need to reallocate buffer. The seq below is such that
            # _ioctl_membuf is valid at all times, even when
            # there is a no memory exception.
            set newsize [expr {$_ioctl_membuf_size * 2}]
            set newbuf [malloc $newsize]
            # Now that we got a new buffer without an exception, set the
            # buffer variables
            set _ioctl_membuf $newbuf
            set _ioctl_membuf_size $newsize
            # Loop back to retry
            continue
        }

        # Fine, got what we wanted. Break out of the loop
        break
    }

    set bin [Twapi_ReadMemoryBinary $_ioctl_membuf 0 $outcount]

    # Do not hold on to cache memory is it is too big
    if {$_ioctl_membuf_size >= 1000} {
        free $_ioctl_membuf
        unset _ioctl_membuf
        set _ioctl_membuf_size 0
    }

    return $bin
}


