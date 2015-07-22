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
BUILD_DEPENDS_IPS="developer/sunstudio12.1 omniti/network/openldap-client"
DEPENDS_IPS="omniti/network/openldap-client"
CC=/opt/sunstudio12.1/bin/cc; export CC
CONFIGURE_OPTS="--with-ldap=plugin"
CPPFLAGS64="-I/opt/omni/include/amd64/"
CPPFLAGS32="-I/opt/omni/include"
LDFLAGS64="-L/opt/omni/lib/amd64/ -R/opt/omni/lib/amd64/"
LDFLAGS32="-L/opt/omni/lib -R/opt/omni/lib"

PROG=dovecot    # App name
VER=2.2.18      # App version
VERHUMAN=$VER   # Human-readable version
PVER=1          # Branch (set in config.sh, override here if needed)
PKG=mail/dovecot # Package name (e.g. library/foo)
SUMMARY="Dovecot is an open source IMAP and POP3 email server"      # One-liner, must be filled in
DESC="Dovecot is among the highest performing IMAP servers while still supporting the standard mbox and Maildir formats. The mailboxes are transparently indexed, which gives Dovecot its good performance while still providing full compatibility with existing mailbox handling tools."         # Longer description, must be filled in


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
