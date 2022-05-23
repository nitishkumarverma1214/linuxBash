#!/bin/bash

# This script pings a list of servers and reports their status.

SERVER_FILE='/vagrant/servers'

if [[ ! -e "${SERVER_FILE}" ]]
then
	echo "Can't open ${SERVER_FILE}"
	exit 1
fi

for SERVER in $(cat ${SERVER_FILE})
do
	echo "pinging ${SERVER}"
	ping -c1 "${SERVER}" &> /dev/null
	
	if [[ ${?} -ne 0 ]]
	then
		echo "${SERVER} is down."
	else
		echo "${SERVER} is up."
	fi
done
