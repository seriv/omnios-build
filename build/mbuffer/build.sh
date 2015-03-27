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

PROG=mbuffer
VER=20141227
VERHUMAN=$VER
PKG=system/mbuffer
SUMMARY="measuring buffer to be used with pipes"
DESC="mbuffer is a tool for buffering data streams with a large set of unique features:\
direct support for TCP based network targets (IPv4 and IPv6)\
ability to send to multiple targets in parallel (distribution mode)\
support for multiple volumes\
I/O rate limitation\
high/low watermark based restart criteria\
configurable buffer size\
on the fly MD5 hash calculation\
highly efficient, multi-threaded implementation  to be used with pipes"      # One-liner, must be filled in

BUILDARCH=64
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
