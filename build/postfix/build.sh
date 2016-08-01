#!/usr/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2011-2013 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=postfix    # App name
VER=3.1.0       # App version
VERHUMAN=$VER   # Human-readable version
PVER=2.151014   # Branch (set in config.sh, override here if needed)
PKG=csd/mail/postfix            # Package name (e.g. library/foo)
SUMMARY="Postfix mail server"      # One-liner, must be filled in
DESC="Wietse Venema's mail server alternative to Sendmail"         # Longer description, must be filled in

BUILDARCH="64"
BUILD_DEPENDS_IPS="library/pcre"

configure32() {
    logmsg "--- Skipping configure - not required"
}

configure64() {
    logmsg "--- Configure (make makefiles)"
    logcmd $MAKE makefiles AUXLIBS="-lssl -lcrypto" \
         AUXLIBS_LDAP="-L/opt/csd/lib/amd64 -R/opt/csd/lib/amd64 -lldap \
        -L/opt/csd/lib/amd64 -R/opt/csd/lib/amd64 -llber" \
         CCARGS='-m64 -I/opt/csd/include -DNO_NIS -DUSE_TLS -DHAS_LDAP\
        -DDEF_COMMAND_DIR=\"/opt/csd/sbin\"\
        -DDEF_CONFIG_DIR=\"/etc/postfix\"\
        -DDEF_DAEMON_DIR=\"/opt/csd/libexec/postfix\"\
        -DDEF_MAILQ_PATH=\"/opt/csd/bin/mailq\"\
        -DDEF_MANPAGE_DIR=\"/opt/csd/share/man\"\
        -DDEF_NEWALIAS_PATH=\"/opt/csd/bin/newaliases\"\
        -DDEF_SENDMAIL_PATH=\"/opt/csd/sbin/sendmail\"\
        ' || logerr "Failed make makefiles command"
}

make_clean() {
    logmsg "--- make (dist)clean"
    logcmd $MAKE distclean || \
    logcmd $MAKE clean || \
        logmsg "--- *** WARNING *** make (dist)clean Failed"
}

# Overriding this because "install" for postfix is interactive
make_install() {
    logmsg "--- make install"
    logcmd /bin/sh postfix-install -non-interactive install_root=${DESTDIR} || \
        logerr "--- Make install failed"
}

service_configs() {
    logmsg "Installing SMF Manifest"
    logcmd mkdir -p $DESTDIR/lib/svc/manifest/network/
    logcmd cp $SRCDIR/files/postfix.xml \
        $DESTDIR/lib/svc/manifest/network/postfix.xml ||
        logerr "Failed to install SMF manifest"
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
service_configs
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
