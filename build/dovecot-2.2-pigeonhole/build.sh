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

PROG=dovecot-2.2-pigeonhole
VER=0.4.21      # App version
VERHUMAN=$VER   # Human-readable version
PVER=1          # Branch (set in config.sh, override here if needed)
PKG=csd/mail/pigeonhole
SUMMARY="Sieve and managesieve plugin for dovecot"
DESC="This package provied sieve and managesieve plugin for dovecot LDA and LMTP"

BUILD_DEPENDS_IPS="csd/mail/dovecot"
RUN_DEPENDS_IPS="csd/mail/dovecot"
LDFLAGS32="-L/opt/csd/lib/dovecot -R/opt/csd/lib/dovecot"
LDFLAGS64="-L/opt/csd/lib/amd64/dovecot -R/opt/csd/lib/amd64/dovecot"
CONFIGURE_OPTS_32="$CONFIGURE_OPTS_32 --with-dovecot=/opt/csd/lib/dovecot"
CONFIGURE_OPTS_64="$CONFIGURE_OPTS_64 --with-dovecot=/opt/csd/lib/amd64/dovecot"

init
download_source pigeonhole $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
