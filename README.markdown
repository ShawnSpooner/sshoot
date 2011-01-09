# sshoot

## What is it?
Simple ssh manager for the command line. Heavily inspired by the awesome Boom library https://github.com/holman/boom

** Overview **

    $ sshoot
    stage : stageuser@127.0.0.1
    beta : betauser@ubuntu.beta.server.com

** Create a connection **

    $ sshoot vm ubuntu@192.168.1.102
    Loaded a new round called vm.
		

** Open an ssh connection **

    $ sshoot vm
    Starting ssh for ubuntu@192.168.1.102

** Delete a connection **

    $ sshoot vm delete
    You sure you want to delete vm? (y/n): y
    vm just caught a bullet.

** Help **

    $ sshoot help

== Copyright

Copyright (c) 2011 Shawn Spooner. See LICENSE for details.
