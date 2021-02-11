#!/bin/bash -x
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
set -x									;
#########################################################################
test -n "${engine}"		|| exit 101                             ;
test -n "${HostedZoneName}"	|| exit 102                             ;
test -n "${mode}"		|| exit 103                             ;
test -n "${os}"			|| exit 104                             ;
test -n "${stack}"		|| exit 105                             ;
test -n "${version_major}"	|| exit 106                             ;
test -n "${version_minor}"	|| exit 107                             ;
#########################################################################
file=common-functions.sh                                                ;
path=lib                                                                ;
#########################################################################
source ./${path}/${file}                                                ;
#########################################################################
file=init-${mode}.sh                                                    ;
path=bin                                                                ;
#########################################################################
source ./${path}/${file}                                                ;
#########################################################################
