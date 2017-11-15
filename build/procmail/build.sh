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

PROG=procmail   # App name
VER=3.22        # App version
VERHUMAN=$VER   # Human-readable version
PVER=3          # Branch (set in config.sh, override here if needed)
PKG=csd/mail/procmail    # Package name (e.g. library/foo)
SUMMARY="Mail processing program"
DESC=" Procmail can be used to create mail-servers, mailing lists, sort your \
incoming mail into separate folders/files (real convenient when subscribing \
to one or more mailing lists or for prioritising your mail), preprocess \
your mail, start any programs upon mail arrival (e.g. to generate different \
chimes on your workstation for different types of mail) or selectively \
forward certain incoming mail automatically to someone."

BUILDARCH="64"

configure64() {
:
}

configure32() {
:
}

make_install() {
    logmsg "--- make install"
    logcmd $MAKE BASENAME="${DESTDIR}${PREFIX}" MANDIR="${DESTDIR}${PREFIX}/share/man" install || \
        logerr "--- Make install failed"
}


init
download_source $PROG $PROG $VER
patch_source
prep_build
export PATH=$SRCDIR/bin:$PATH
build
make_isa_stub
make_package
#clean_up

# Vim hints
# vim:ts=4:sw=4:et: