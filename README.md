psnap - Take a snapshot of 'ps' measurements for a process over time
============================================================

## SYNOPSIS

`psnap [options] ProcessName`

## INSTALL

    $ gem install psnap

## DESCRIPTION

**psnap** ...

## OPTIONS

  * `-i`, `--[no-]ignore-case`:
    Ignore case when matching.  This is off by default.

  * `-h`, `--help`, `--version`:
    Show the version and help information

## ENVIRONMENT

Default options can be specified in the `PSNAP_OPTS` environment variable, exactly as they would appear on the command line.  You
can override these switches with the `-no-` form of the options

## EXAMPLES

Take a snapshot of Firefox %CPU usage:

    # Snapshot written to a text file named after specified process name + timestamp.
    # See program output for details.
    psnap -i firefox

## AUTHOR

Mike Stapp, mestapp (at) gmail.com

## COPYRIGHT

psnap is copyright(c) 2012 by Michael Stapp, released under the MIT license.

## SEE ALSO

  * Source on github: https://github.com/mstapp/psnap


[SYNOPSIS]: #SYNOPSIS "SYNOPSIS"
[INSTALL]: #INSTALL "INSTALL"
[DESCRIPTION]: #DESCRIPTION "DESCRIPTION"
[OPTIONS]: #OPTIONS "OPTIONS"
[ENVIRONMENT]: #ENVIRONMENT "ENVIRONMENT"
[EXAMPLES]: #EXAMPLES "EXAMPLES"
[BUGS]: #BUGS "BUGS"
[AUTHOR]: #AUTHOR "AUTHOR"
[COPYRIGHT]: #COPYRIGHT "COPYRIGHT"
[SEE ALSO]: #SEE-ALSO "SEE ALSO"


[psnap(1)]: psnap.1.html
