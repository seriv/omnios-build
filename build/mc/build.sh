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

PROG=mc         # App name
VER=4.8.13      # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG=csd/file/mc     # Package name (e.g. library/foo)
SUMMARY="GNU Midnight Commander is a visual file manager"      # One-liner, must be filled in
BUILD_DEPENDS_IPS="developer/pkg-config"
DEPENDS_IPS="csd/library/slang"
DESC="Midnight Commander is a feature rich full-screen text mode application that allows you to copy, move and delete files and whole directory trees, search for files and run commands in the subshell. Internal viewer and editor are included."         # Longer description, must be filled in

#BUILDARCH="64"
#PKG_CONFIG_PATH="/opt/csd/lib/amd64/pkgconfig/"
export PKG_CONFIG_PATH="/opt/csd/lib/pkgconfig:$PKG_CONFIG"
CPPFLAGS="-I/opt/csd/include"
LDFLAGS32="-L/opt/csd/lib/ -R/opt/csd/lib/"
LDFLAGS64="-L/opt/csd/lib/amd64/ -R/opt/csd/lib/amd64/"

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
