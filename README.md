# Build System for OmniOS

These scripts and tools are used to build new versions of OmniOS.

Please see [the build instructions](http://omnios.omniti.com/wiki.php/BuildInstructions) for details on how to use these tools.


Packages built for OmniOS are in cs.umd.edu branch. They are: dovecot with ldap authentication and managesieve server pigeonhole, and some other packages: midnight commander, fail2ban, procmail, netperf and some libraries. Branch 'cs.umd.edu' contains build scripts for a few packages: dovecot with ldap support, dovecot-pigeonhole managesieve server, recent postfix, slang libs and openldap clients, procmail, midnight commander, netperf, and mbuffer. These packages have PREFIX=/opt/csd, and their names start with csd/
