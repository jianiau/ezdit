#
# Copyright (c) 2009, Ashok P. Nadkarni
# All rights reserved.
#
# See the file LICENSE for license

#
# Get list of users on a system
proc twapi::get_users {args} {
    array set opts [parseargs args {system.arg} -nulldefault]
    return [Twapi_NetUserEnum $opts(system) 0]
}

#
# Add a new user account
proc twapi::new_user {username args} {
    

    array set opts [parseargs args [list \
                                        system.arg \
                                        password.arg \
                                        comment.arg \
                                        [list priv.arg "user" [array names twapi::priv_level_map]] \
                                        home_dir.arg \
                                        script_path.arg \
                                       ] \
                        -nulldefault]

    # NetUserAdd requires the $priv level to be 1 (USER). We change it below
    # using the NetUserSetInfo call
    NetUserAdd $opts(system) $username $opts(password) 1 \
        $opts(home_dir) $opts(comment) 0 $opts(script_path)

    try {
        set_user_priv_level $username $opts(priv) -system $opts(system)
    } onerror {} {
        # Remove the previously created user account
        set ecode $errorCode
        set einfo $errorInfo
        catch {delete_user $username -system $opts(system)}
        error $errorResult $einfo $ecode
    }
}


#
# Delete a user account
proc twapi::delete_user {username args} {
    eval set [parseargs args {system.arg} -nulldefault]

    # Remove the user from the LSA rights database.
    _delete_rights $username $system

    NetUserDel $system $username
}


#
# Define various functions to set various user account fields
foreach twapi::_field_ {name password home_dir comment script_path full_name country_code profile home_dir_drive} {
    proc twapi::set_user_$::twapi::_field_ {username fieldval args} "
        array set opts \[parseargs args {
            system.arg
        } -nulldefault \]
        Twapi_NetUserSetInfo_$::twapi::_field_ \$opts(system) \$username \$fieldval"
}
unset twapi::_field_

#
# Set user privilege level
proc twapi::set_user_priv_level {username priv_level args} {
    eval set [parseargs args {system.arg} -nulldefault]

    if {0} {
        # FOr some reason NetUserSetInfo cannot change priv level
        # Tried it separately with a simple C program. So this code
        # is commented out and we use group membership to achieve
        # the desired result
        if {![info exists twapi::priv_level_map($priv_level)]} {
            error "Invalid privilege level value '$priv_level' specified. Must be one of [join [array names twapi::priv_level_map] ,]"
        }
        set priv $twapi::priv_level_map($priv_level)

        Twapi_NetUserSetInfo_priv $system $username $priv
    } else {
        # Don't hardcode group names - reverse map SID's instead for 
        # non-English systems. Also note that since
        # we might be lowering privilege level, we have to also
        # remove from higher privileged groups
        variable builtin_account_sids
        switch -exact -- $priv_level {
            guest {
                set outgroups {administrators users}
                set ingroup guests
            }
            user  {
                set outgroups {administrators}
                set ingroup users
            }
            admin {
                set outgroups {}
                set ingroup administrators
            }
            default {error "Invalid privilege level '$priv_level'. Must be one of 'guest', 'user' or 'admin'"}
        }
        # Remove from higher priv groups
        foreach outgroup $outgroups {
            # Get the potentially localized name of the group
            set group [lookup_account_sid $builtin_account_sids($outgroup)]
            # Catch since may not be member of that group
            catch {remove_member_from_local_group $group $username}
        }

        # Get the potentially localized name of the group to be added
        set group [lookup_account_sid $builtin_account_sids($ingroup)]
        add_member_to_local_group $group $username
    }
}

#
# Set account expiry time
proc twapi::set_user_expiration {username time args} {
    eval set [parseargs args {system.arg} -nulldefault]

    if {[string equal $time "never"]} {
        set time -1
    } else {
        set time [clock scan $time]
    }

    Twapi_NetUserSetInfo_acct_expires $system $username $time
}

#
# Unlock a user account
proc twapi::unlock_user {username args} {
    eval [list _change_usri3_flags $username $twapi::windefs(UF_LOCKOUT) 0] $args
}

#
# Enable a user account
proc twapi::enable_user {username args} {
    eval [list _change_usri3_flags $username $twapi::windefs(UF_ACCOUNTDISABLE) 0] $args
}

#
# Disable a user account
proc twapi::disable_user {username args} {
    variable windefs
    eval [list _change_usri3_flags $username $windefs(UF_ACCOUNTDISABLE) $windefs(UF_ACCOUNTDISABLE)] $args
}



#
# Return the specified fields for a user account
proc twapi::get_user_account_info {account args} {
    variable windefs

    # Define each option, the corresponding field, and the 
    # information level at which it is returned
    array set fields {
        comment {usri3_comment 1}
        password_expired {usri3_password_expired 3}
        full_name {usri3_full_name 2}
        parms {usri3_parms 2}
        units_per_week {usri3_units_per_week 2}
        primary_group_id {usri3_primary_group_id 3}
        status {usri3_flags 1}
        logon_server {usri3_logon_server 2}
        country_code {usri3_country_code 2}
        home_dir {usri3_home_dir 1}
        password_age {usri3_password_age 1}
        home_dir_drive {usri3_home_dir_drive 3}
        num_logons {usri3_num_logons 2}
        acct_expires {usri3_acct_expires 2}
        last_logon {usri3_last_logon 2}
        user_id {usri3_user_id 3}
        usr_comment {usri3_usr_comment 2}
        bad_pw_count {usri3_bad_pw_count 2}
        code_page {usri3_code_page 2}
        logon_hours {usri3_logon_hours 2}
        workstations {usri3_workstations 2}
        last_logoff {usri3_last_logoff 2}
        name {usri3_name 0}
        script_path {usri3_script_path 1}
        priv {usri3_priv 1}
        profile {usri3_profile 3}
        max_storage {usri3_max_storage 2}
    }
    # Left out - auth_flags {usri3_auth_flags 2}
    # Left out (always returned as NULL) - password {usri3_password 1}


    array set opts [parseargs args \
                        [concat [array names fields] \
                             [list sid local_groups global_groups system.arg all]] \
                       -nulldefault]

    if {$opts(all)} {
        foreach field [array names fields] {
            set opts($field) 1
        }
        set opts(local_groups) 1
        set opts(global_groups) 1
        set opts(sid) 1
    }

    # Based on specified fields, figure out what level info to ask for
    set level 0
    foreach {field fielddata} [array get fields] {
        if {[lindex $fielddata 1] > $level} {
            set level [lindex $fielddata 1]
        }
    }
    
    array set data [NetUserGetInfo $opts(system) $account $level]

    # Extract the requested data
    array set result [list ]
    foreach {field fielddata} [array get fields] {
        if {$opts($field)} {
            set result($field) $data([lindex $fielddata 0])
        }
    }

    # Map internal values to more friendly formats
    if {$opts(status)} {
        if {$result(status) & $windefs(UF_ACCOUNTDISABLE)} {
            set result(status) "disabled"
        } elseif {$result(status) & $windefs(UF_LOCKOUT)} {
            set result(status) "locked"
        } else {
            set result(status) "enabled"
        }
    }

    if {[info exists result(logon_hours)]} {
        binary scan $result(logon_hours) b* result(logon_hours)
    }

    foreach time_field {acct_expires last_logon last_logoff} {
        if {[info exists result($time_field)]} {
            if {$result($time_field) == -1} {
                set result($time_field) "never"
            } elseif {$result($time_field) == 0} {
                set result($time_field) "unknown"
            } else {
                set result($time_field) [clock format $result($time_field) -gmt 1]
            }
        }
    }
    
    if {[info exists result(priv)]} {
        switch -exact -- [expr {$result(priv) & 3}] {
            0 { set result(priv) "guest" }
            1 { set result(priv) "user" }
            2 { set result(priv) "admin" }
        }
    }

    if {$opts(local_groups)} {
        set result(local_groups) [NetUserGetLocalGroups $opts(system) $account 0]
    }

    if {$opts(global_groups)} {
        set result(global_groups) [NetUserGetGroups $opts(system) $account]
    }

    if {$opts(sid)} {
        set result(sid) [lookup_account_name $account -system $opts(system)]
    }

    return [get_array_as_options result]
}

proc twapi::get_user_local_groups_recursive {account args} {
    array set opts [parseargs args {
        system.arg
    } -nulldefault -maxleftover 0]

    return [NetUserGetLocalGroups $opts(system) [map_account_to_name $account] 1]
}


#
# Set the specified fields for a user account
proc twapi::set_user_account_info {account args} {
    variable windefs

    set notspecified "3kjafnq2or2034r12"; # Some junk

    # Define each option, the corresponding field, and the 
    # information level at which it is returned
    array set opts [parseargs args {
        {system.arg ""}
        comment.arg
        full_name.arg
        country_code.arg
        home_dir.arg
        home_dir.arg
        acct_expires.arg
        name.arg
        script_path.arg
        priv.arg
        profile.arg
    }]

    if {[info exists opts(comment)]} {
        set_user_comment $account $opts(comment) -system $opts(system)
    }

    if {[info exists opts(full_name)]} {
        set_user_full_name $account $opts(full_name) -system $opts(system)
    }

    if {[info exists opts(country_code)]} {
        set_user_country_code $account $opts(country_code) -system $opts(system)
    }

    if {[info exists opts(home_dir)]} {
        set_user_home_dir $account $opts(home_dir) -system $opts(system)
    }

    if {[info exists opts(home_dir_drive)]} {
        set_user_home_dir_drive $account $opts(home_dir_drive) -system $opts(system)
    }

    if {[info exists opts(acct_expires)]} {
        set_user_expiration $account $opts(acct_expires) -system $opts(system)
    }

    if {[info exists opts(name)]} {
        set_user_name $account $opts(name) -system $opts(system)
    }

    if {[info exists opts(script_path)]} {
        set_user_script_path $account $opts(script_path) -system $opts(system)
    }

    if {[info exists opts(priv)]} {
        set_user_priv_level $account $opts(priv) -system $opts(system)
    }

    if {[info exists opts(profile)]} {
        set_user_profile $account $opts(profile) -system $opts(system)
    }
}
                    

proc twapi::get_global_group_info {name args} {
    array set opts [parseargs args {
        {system.arg ""}
        comment
        name
        members
        sid
        all
    } -maxleftover 0]

    set result [list ]
    if {$opts(all) || $opts(sid)} {
        lappend result -sid [lookup_account_name $name -system $opts(system)]
    }
    if {$opts(all) || $opts(comment) || $opts(name)} {
        array set info [NetGroupGetInfo $opts(system) $name 1]
        if {$opts(all) || $opts(name)} {
            lappend result -name $info(grpi3_name)
        }
        if {$opts(all) || $opts(comment)} {
            lappend result -comment $info(grpi3_comment)
        }
    }
    if {$opts(all) || $opts(members)} {
        lappend result -members [get_global_group_members $name -system $opts(system)]
    }
    return $result
}

#
# Get info about a local or global group
proc twapi::get_local_group_info {name args} {
    array set opts [parseargs args {
        {system.arg ""}
        comment
        name
        members
        sid
        all
    } -maxleftover 0]

    set result [list ]
    if {$opts(all) || $opts(sid)} {
        lappend result -sid [lookup_account_name $name -system $opts(system)]
    }
    if {$opts(all) || $opts(comment) || $opts(name)} {
        array set info [NetLocalGroupGetInfo $opts(system) $name 1]
        if {$opts(all) || $opts(name)} {
            lappend result -name $info(lgrpi1_name)
        }
        if {$opts(all) || $opts(comment)} {
            lappend result -comment $info(lgrpi1_comment)
        }
    }
    if {$opts(all) || $opts(members)} {
        lappend result -members [get_local_group_members $name -system $opts(system)]
    }
    return $result
}

#
# Get list of global groups on a system
proc twapi::get_global_groups {args} {
    array set opts [parseargs args {system.arg} -nulldefault]
    return [NetGroupEnum $opts(system)]
}

#
# Get list of local groups on a system
proc twapi::get_local_groups {args} {
    array set opts [parseargs args {system.arg} -nulldefault]
    return [NetLocalGroupEnum $opts(system)]
}


#
# Create a new global group
proc twapi::new_global_group {grpname args} {
    array set opts [parseargs args {
        system.arg
        comment.arg
    } -nulldefault]

    NetGroupAdd $opts(system) $grpname $opts(comment)
}


#
# Create a new local group
proc twapi::new_local_group {grpname args} {
    array set opts [parseargs args {
        system.arg
        comment.arg
    } -nulldefault]

    NetLocalGroupAdd $opts(system) $grpname $opts(comment)
}


#
# Delete a global group
proc twapi::delete_global_group {grpname args} {
    eval set [parseargs args {system.arg} -nulldefault]

    # Remove the group from the LSA rights database.
    _delete_rights $grpname $system

    NetGroupDel $opts(system) $grpname
}

#
# Delete a local group
proc twapi::delete_local_group {grpname args} {
    array set opts [parseargs args {system.arg} -nulldefault]

    # Remove the group from the LSA rights database.
    _delete_rights $grpname $opts(system)

    NetLocalGroupDel $opts(system) $grpname
}


#
# Enumerate members of a global group
proc twapi::get_global_group_members {grpname args} {
    array set opts [parseargs args {system.arg} -nulldefault]

    NetGroupGetUsers $opts(system) $grpname
}

#
# Enumerate members of a local group
proc twapi::get_local_group_members {grpname args} {
    array set opts [parseargs args {system.arg} -nulldefault]

    NetLocalGroupGetMembers $opts(system) $grpname
}

#
# Add a user to a global group
proc twapi::add_user_to_global_group {grpname username args} {
    eval set [parseargs args {system.arg} -nulldefault]

    # No error if already member of the group
    try {
        NetGroupAddUser $system $grpname $username
    } onerror {TWAPI_WIN32 1320} {
        # Ignore
    }
}


#
# Add a user to a local group
proc twapi::add_member_to_local_group {grpname username args} {
    eval set [parseargs args {system.arg} -nulldefault]

    # No error if already member of the group
    try {
        Twapi_NetLocalGroupAddMember $system $grpname $username
    } onerror {TWAPI_WIN32 1378} {
        # Ignore
    }
}


# Remove a user from a global group
proc twapi::remove_user_from_global_group {grpname username args} {
    eval set [parseargs args {system.arg} -nulldefault]

    try {
        NetGroupDelUser $system $grpname $username
    } onerror {TWAPI_WIN32 1321} {
        # Was not in group - ignore
    }
}


# Remove a user from a local group
proc twapi::remove_member_from_local_group {grpname username args} {
    eval set [parseargs args {system.arg} -nulldefault]

    try {
        Twapi_NetLocalGroupDelMember $system $grpname $username
    } onerror {TWAPI_WIN32 1377} {
        # Was not in group - ignore
    }
}

#
# Get a token for a user
proc twapi::open_user_token {username password args} {
    variable windefs

    array set opts [parseargs args {
        domain.arg
        {type.arg batch}
        {provider.arg default}
    } -nulldefault]

    set typedef "LOGON32_LOGON_[string toupper $opts(type)]"
    if {![info exists windefs($typedef)]} {
        error "Invalid value '$opts(type)' specified for -type option"
    }

    set providerdef "LOGON32_PROVIDER_[string toupper $opts(provider)]"
    if {![info exists windefs($typedef)]} {
        error "Invalid value '$opts(provider)' specified for -provider option"
    }
    
    # If username is of the form user@domain, then domain must not be specified
    # If username is not of the form user@domain, then domain is set to "."
    # if it is empty
    if {[regexp {^([^@]+)@(.+)} $username dummy user domain]} {
        if {[string length $opts(domain)] != 0} {
            error "The -domain option must not be specified when the username is in UPN format (user@domain)"
        }
    } else {
        if {[string length $opts(domain)] == 0} {
            set opts(domain) "."
        }
    }

    return [LogonUser $username $opts(domain) $password $windefs($typedef) $windefs($providerdef)]
}


#
# Impersonate a user given a token
proc twapi::impersonate_token {token} {
    ImpersonateLoggedOnUser $token
}


#
# Impersonate a user
proc twapi::impersonate_user {args} {
    set token [eval open_user_token $args]
    try {
        impersonate_token $token
    } finally {
        close_token $token
    }
}


#
# Revert to process token
proc twapi::revert_to_self {{opt ""}} {
    RevertToSelf
}


#
# Impersonate self
proc twapi::impersonate_self {level} {
    switch -exact -- $level {
        anonymous      { set level 0 }
        identification { set level 1 }
        impersonation  { set level 2 }
        delegation     { set level 3 }
        default {
            error "Invalid impersonation level $level"
        }
    }
    ImpersonateSelf $level
}

#
# Set a thread token - currently only for current thread
proc twapi::set_thread_token {token} {
    SetThreadToken NULL $token
}

#
# Reset a thread token - currently only for current thread
proc twapi::reset_thread_token {} {
    SetThreadToken NULL NULL
}

#
# Get a handle to a LSA policy
proc twapi::get_lsa_policy_handle {args} {
    array set opts [parseargs args {
        {system.arg ""}
        {access.arg policy_read}
    } -maxleftover 0]

    set access [_access_rights_to_mask $opts(access)]
    return [Twapi_LsaOpenPolicy $opts(system) $access]
}

#
# Close a LSA policy handle
proc twapi::close_lsa_policy_handle {h} {
    LsaClose $h
    return
}

#
# Get rights for an account
proc twapi::get_account_rights {account args} {
    array set opts [parseargs args {
        {system.arg ""}
    } -maxleftover 0]

    set sid [map_account_to_sid $account -system $opts(system)]

    try {
        set lsah [get_lsa_policy_handle -system $opts(system) -access policy_lookup_names]
        return [Twapi_LsaEnumerateAccountRights $lsah $sid]
    } onerror {TWAPI_WIN32 2} {
        # No specific rights for this account
        return [list ]
    } finally {
        if {[info exists lsah]} {
            close_lsa_policy_handle $lsah
        }
    }
}

#
# Get accounts having a specific right
proc twapi::find_accounts_with_right {right args} {
    array set opts [parseargs args {
        {system.arg ""}
        name
    } -maxleftover 0]

    try {
        set lsah [get_lsa_policy_handle \
                      -system $opts(system) \
                      -access {
                          policy_lookup_names
                          policy_view_local_information
                      }]
        set accounts [list ]
        foreach sid [Twapi_LsaEnumerateAccountsWithUserRight $lsah $right] {
            if {$opts(name)} {
                if {[catch {lappend accounts [lookup_account_sid $sid]}]} {
                    # No mapping for SID - can happen if account has been
                    # deleted but LSA policy not updated accordingly
                    lappend accounts $sid
                }
            } else {
                lappend accounts $sid
            }
        }
        return $accounts
    } onerror {TWAPI_WIN32 259} {
        # No accounts have this right
        return [list ]
    } finally {
        if {[info exists lsah]} {
            close_lsa_policy_handle $lsah
        }
    }

}

#
# Add/remove rights to an account
proc twapi::_modify_account_rights {operation account rights args} {
    set switches {
        system.arg
        handle.arg
    }    

    switch -exact -- $operation {
        add {
            # Nothing to do
        }
        remove {
            lappend switches all
        }
        default {
            error "Invalid operation '$operation' specified"
        }
    }

    array set opts [parseargs args $switches -maxleftover 0]

    if {[info exists opts(system)] && [info exists opts(handle)]} {
        error "Options -system and -handle may not be specified together"
    }

    if {[info exists opts(handle)]} {
        set lsah $opts(handle)
        set sid $account
    } else {
        if {![info exists opts(system)]} {
            set opts(system) ""
        }

        set sid [map_account_to_sid $account -system $opts(system)]
        # We need to open a policy handle ourselves. First try to open
        # with max privileges in case the account needs to be created
        # and then retry with lower privileges if that fails
        catch {
            set lsah [get_lsa_policy_handle \
                          -system $opts(system) \
                          -access {
                              policy_lookup_names
                              policy_create_account
                          }]
        }
        if {![info exists lsah]} {
            set lsah [get_lsa_policy_handle \
                          -system $opts(system) \
                          -access policy_lookup_names]
        }
    }

    try {
        if {$operation == "add"} {
            Twapi_LsaAddAccountRights $lsah $sid $rights
        } else {
            Twapi_LsaRemoveAccountRights $lsah $sid $opts(all) $rights
        }
    } finally {
        # Close the handle if we opened it
        if {! [info exists opts(handle)]} {
            close_lsa_policy_handle $lsah
        }
    }
}

interp alias {} twapi::add_account_rights {} twapi::_modify_account_rights add
interp alias {} twapi::remove_account_rights {} twapi::_modify_account_rights remove

# Return list of logon sesionss
proc twapi::find_logon_sessions {args} {
    array set opts [parseargs args {
        user.arg
        type.arg
        tssession.arg
    } -maxleftover 0]

    set luids [LsaEnumerateLogonSessions]
    if {! ([info exists opts(user)] || [info exists opts(type)] ||
           [info exists opts(tssession)])} {
        return $luids
    }


    # Need to get the data for each session to see if it matches
    set result [list ]
    if {[info exists opts(user)]} {
        set sid [map_account_to_sid $opts(user)]
    }
    if {[info exists opts(type)]} {
        set logontypes [list ]
        foreach logontype $opts(type) {
            lappend logontypes [_logon_session_type_code $logontype]
        }
    }

    foreach luid $luids {
        try {
            unset -nocomplain session
            array set session [LsaGetLogonSessionData $luid]

            # For the local system account, no data is returned on some
            # platforms
            if {[array size session] == 0} {
                set session(Sid) S-1-5-18; # SYSTEM
                set session(Session) 0
                set session(LogonType) 0
            }
            if {[info exists opts(user)] && $session(Sid) ne $sid} {
                continue;               # User id does not match
            }

            if {[info exists opts(type)] && [lsearch -exact $logontypes $session(LogonType)] < 0} {
                continue;               # Type does not match
            }

            if {[info exists opts(tssession)] && $session(Session) != $opts(tssession)} {
                continue;               # Term server session does not match
            }

            lappend result $luid

        } onerror {TWAPI_WIN32 1312} {
            # Session no longer exists. Just skip
            continue
        }
    }

    return $result
}


# Return data for a logon session
proc twapi::get_logon_session_info {luid args} {
    array set opts [parseargs args {
        all
        authpackage
        dnsdomain
        logondomain
        logonid
        logonserver
        logontime
        type
        sid
        user
        tssession
        userprincipal
    } -maxleftover 0]

    array set session [LsaGetLogonSessionData $luid]

    # Some fields may be missing on Win2K
    foreach fld {LogonServer DnsDomainName Upn} {
        if {![info exists session($fld)]} {
            set session($fld) ""
        }
    }

    array set result [list ]
    foreach {opt index} {
        authpackage AuthenticationPackage
        dnsdomain   DnsDomainName
        logondomain LogonDomain
        logonid     LogonId
        logonserver LogonServer
        logontime   LogonTime
        type        LogonType
        sid         Sid
        user        UserName
        tssession   Session
        userprincipal Upn
    } {
        if {$opts(all) || $opts($opt)} {
            set result(-$opt) $session($index)
        }
    }

    if {[info exists result(-type)]} {
        set result(-type) [_logon_session_type_symbol $result(-type)]
    }

    return [array get result]
}


#
# Set/reset the given bits in the usri3_flags field for a user account
# mask indicates the mask of bits to set. values indicates the values
# of those bits
proc twapi::_change_usri3_flags {username mask values args} {
    array set opts [parseargs args {
        system.arg
    } -nulldefault -maxleftover 0]

    # Get current flags
    array set data [NetUserGetInfo $opts(system) $username 1]

    # Turn off mask bits and write flags back
    set flags [expr {$data(usri3_flags) & (~ $mask)}]
    # Set the specified bits
    set flags [expr {$flags | ($values & $mask)}]

    # Write new flags back
    Twapi_NetUserSetInfo_flags $opts(system) $username $flags
}

#
# Map impersonation level to symbol
proc twapi::_map_impersonation_level ilevel {
    switch -exact -- $ilevel {
        0 { return "anonymous" }
        1 { return "identification" }
        2 { return "impersonation" }
        3 { return "delegation" }
        default { return $ilevel }
    }
}

# Returns the logon session type value for a symbol
proc twapi::_logon_session_type_code {type} {
    # Type may be an integer or one of the strings below
    set code [lsearch -exact $::twapi::logon_session_type_map $type]
    if {$code >= 0} {
        return $code
    }

    if {![string is integer -strict $type]} {
        error "Invalid logon session type '$type' specified"
    }
    return $type
}

# Returns the logon session type symbol for an integer value
proc twapi::_logon_session_type_symbol {code} {
    set symbol [lindex $::twapi::logon_session_type_map $code]
    if {$symbol eq ""} {
        return $code
    } else {
        return $symbol
    }
}

