#!/bin/bash


# To find the top visited url in the web log

LOG_FILE=${1}

if [[ ! -e "${LOG_FILE}" ]]
then
	echo "Can't open the ${LOG_FILE}. " >&2
	exit 1
fi

cut -d '"' -f2 ${LOG_FILE} | cut -d ' ' -f2 | sort | uniq -c

