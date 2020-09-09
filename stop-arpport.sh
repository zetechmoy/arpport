#!/usr/bin/env bash

#ARPPort
#Auto
#Restart
#Process
#by
#Port

# Author: zeTechMoy (@TGuidoux)
#simple one line program
#apipid=$(netstat -lntp 2>/dev/null | grep 3001 | awk '{print $7}' | cut -d/ -f1); while [ -n "$apipid" ]; do apipid=$(netstat -lntp 2>/dev/null | grep 3001 | awk '{print $7}' | cut -d/ -f1); sleep 2; done ; echo "restart"


set -o errexit # abort on nonzero exitstatus
set -o nounset # abort on unbound variable

#
# Functions
#

usage() {
cat << _EOF_
Usage: ${0}
ARPPort is a simple tool which monitor a specific [port] and run a "command" if [port] is not available anymore
By running "command" you can watchdog a service running on [port] and start it again

./arpport.sh [port] "command"		#To run command infinitely
./stop-arpport.sh 							#To stop arpport
_EOF_
}

#
# Variables
#

#
# Command line parsing
#

if [ "$#" -ne "0" ]; then
    usage
    exit 2
fi

#
# Script proper
#
touch arpstop
