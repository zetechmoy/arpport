#!/usr/bin/env bash

#ARPPort
#
# Auto
# Restart
# Process
# by
# Port
#
#ARPPort is a simple tool which monitor a specific [port] and run a "command" if [port] is not available anymore
#By running "command" you can watchdog a service running on [port] and start it again
#
#./arpport.sh [port] "command"	#To run command infinitely
#./stop-arpport.sh		#To stop arpport
#
# Author: zeTechMoy (@TGuidoux)
#
#apipid=$(netstat -lntp 2>/dev/null | grep 3001 | awk '{print $7}' | cut -d/ -f1); while [ -n "$apipid" ]; do apipid=$(netstat -lntp 2>/dev/null | grep 3001 | awk '{print $7}' | cut -d/ -f1); sleep 2; done ; echo "restart"


set -o errexit # abort on nonzero exitstatus
set -o nounset # abort on unbound variable

################################################################################
# Functions
################################################################################

usage() {
cat << _EOF_
Usage: ${0}
ARPPort is a simple tool which monitor a specific [port] and run a "command" if [port] is not available anymore
By running "command" you can watchdog a service running on [port] and start it again

./arpport.sh [port] "command"	#To run command infinitely
./stop-arpport.sh		#To stop arpport
_EOF_
}

################################################################################
# Variables
################################################################################
WAIT_TIME=10		#TIME TO WAIT BEFORE MONITORING

################################################################################
# Command line parsing
################################################################################

if [ "$#" -ne "2" ]; then
    usage
    exit 2
fi

################################################################################
# Let's do some job now
################################################################################

#First start the service
(eval $2 &)

#Then wait a bit for the service to run
sleep $WAIT_TIME

#Start monitoring
while :
do
	#get port pid
	ppid=$(netstat -lntp 2>/dev/null | grep $1 | awk '{print $7}' | cut -d/ -f1)

	#if pid is null then we start the service again
	if [ -z "$ppid" ]
	then
	(eval $2 &)
	sleep $WAIT_TIME
	fi

	#if there is a file "arpstop" in cwd, so we stop the infinite loop
	if [ -f arpstop ]
	then
	rm arpstop
	kill $ppid
	break
	fi

	sleep 1
done
