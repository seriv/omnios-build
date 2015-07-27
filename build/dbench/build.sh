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
# Copyright 2015 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=dbench     # App name
VER=20140714    # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG=csd/file/dbench
SUMMARY="Dbench is a loadtester for iSCSI/NFS/SCSI/SMB"
DESC="DBENCH is a loadtester for various protocols such as iSCSI, NFS, SCSI, SMB.\
\
Dbench was originally developed by Andrew Tridgell \
but is now maintained by Ronnie Sahlberg."

BUILD_DEPENDS_IPS="popt"
RUN_DEPENDS_IPS="popt"
CFLAGS="-I/opt/csd/include -I/opt/omni/include"
LDFLAGS32="-m32 -L/opt/csd/lib -R/opt/csd/lib -L/opt/omni/lib -R/opt/omni/lib"
LDFLAGS64="-m64 -L/opt/csd/lib/amd64 -R/opt/csd/lib/amd64 -L/opt/omni/lib/amd64 -R/opt/omni/lib/amd64"

save_function configure32 orig_configure32
configure32() {
    logmsg "--- autoheader"
    autoheader || \
        logerr "------ Failed running autoheader"
    autoconf || \
        logerr "------ Failed running autoconf"
    orig_configure32
}
save_function configure64 orig_configure64
configure64() {
    logmsg "--- autoheader"
    autoheader || \
        logerr "------ Failed running autoheader"
    logmsg "--- autoconf"
    autoconf || \
        logerr "------ Failed running autoconf"
    orig_configure64
}


init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
