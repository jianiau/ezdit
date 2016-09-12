package require Tcl 8.4
package require tcltest 2.2
source [file join [file dirname [info script]] testutil.tcl]


# Test configuration options that may be set are:
#  systemmodificationok - will include tests that modify the system
#      configuration (eg. add users, share a disk etc.)

tcltest::configure -testdir [file dirname [file normalize [info script]]]
tcltest::configure -tmpdir $::env(TEMP)/twapi-test/[clock seconds]
if {[info exists ::env(TWAPI_PACKAGE)]} {
    if {$::env(TWAPI_PACKAGE) eq "twapi_desktop"} {
        # The desktop package does not support the following components
        tcltest::configure -notfile {
            console.test
            device.test
            eventlog.test
            network.test
            security.test
            services.test
            share.test
        }
    } elseif {$::env(TWAPI_PACKAGE) eq "twapi_server"} {
        # The desktop package does not support the following components
        tcltest::configure -notfile {
            clipboard.test
            com.test
            console.test
            device.test
            network.test
            nls.test
            services.test
            share.test
            shell.test
            ui.test
        }
    }
}

eval tcltest::configure $argv
tcltest::runAllTests
