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
# Copyright 2016 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=amanda     # App name
VER=3.3.9       # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG=csd/backup/amanda
SUMMARY="A network-capable tape backup solution"
DESC="AMANDA, the Advanced Maryland Automatic Network Disk Archiver, is a \
backup system that allows the administrator of a LAN to set up a \
single master backup server to back up multiple hosts to one or more \
tape drives or disk files.  AMANDA uses native dump and/or GNU tar \
facilities and can back up a large number of workstations running \
multiple versions of Unix.  Newer versions of AMANDA (including this \
version) can use SAMBA to back up Microsoft(TM) Windows95/NT hosts. \
The amanda package contains the core AMANDA programs and will need to \
be installed on both AMANDA clients and AMANDA servers.  Note that you \
will have to install the amanda-client and/or amanda-server packages as \
well"

BUILDARCH=32
BUILD_DEPENDS_IPS=
RUN_DEPENDS_IPS=
CONFIGURE_OPTS='--disable-installperms'
CPPFLAGS="-I/usr/include/rpc"

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
# clean_up

# Vim hints
# vim:ts=4:sw=4:et: