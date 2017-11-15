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
# Copyright 2011-2012 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh
BUILD_DEPENDS_IPS="developer/sunstudio12.1 csd/network/openldap"
DEPENDS_IPS="network/openldap"
CC=/opt/sunstudio12.1/bin/cc; export CC
CONFIGURE_OPTS="--with-ldap=plugin --with-notify=none"
CPPFLAGS="-I/opt/csd/include"
LDFLAGS64="-L/opt/csd/lib/amd64 -R/opt/csd/lib/amd64"
LDFLAGS32="-L/opt/csd/lib -R/opt/csd/lib"

PROG=dovecot    # App name
VER=2.2.33.2      # App version
VERHUMAN=$VER   # Human-readable version
PVER=2.151022   # Branch (set in config.sh, override here if needed)
PKG=csd/mail/dovecot # Package name (e.g. library/foo)
SUMMARY="Dovecot is an open source IMAP and POP3 email server"      # One-liner, must be filled in
DESC="Dovecot is among the highest performing IMAP servers while still supporting the standard mbox and Maildir formats. The mailboxes are transparently indexed, which gives Dovecot its good performance while still providing full compatibility with existing mailbox handling tools."         # Longer description, must be filled in


service_configs() {
    logmsg "Installing SMF Manifest and method"
    logcmd mkdir -p $DESTDIR/lib/svc/manifest/network/
    logcmd mkdir -p $DESTDIR/lib/svc/method/
    logcmd cp $SRCDIR/files/dovecot.xml \
        $DESTDIR/lib/svc/manifest/network/dovecot.xml ||
        logerr "Failed to install SMF manifest"
    logcmd cp $SRCDIR/files/dovecot \
        $DESTDIR/lib/svc/method/dovecot ||
        logerr "Failed to install service method"
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
#clean_up

# Vim hints
# vim:ts=4:sw=4:et:
