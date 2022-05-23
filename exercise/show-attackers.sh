#!/bin/bash

# Count the failed login attempts

FILE="${1}"
LIMIT='10'

# Check if the file exists and have the readable permission
if [[ ! -e "${FILE}" || ! -r "${FILE}" ]]
then
	echo "Either file not exists or you don't have read permissions" >&2
	exit 1
fi

# Creating the csv file
echo "Count,IP,Location" > attackers.csv

grep Failed syslog-sample | awk -F ' ' '{print $(NF-3)}' | sort -n | uniq -c | sort -nr | while read COUNT IP
do

	# if the number of attempts are greater than the limit, display count,ip and location.
	if [[ "${COUNT}" -gt "${LIMIT}" ]]
	then
	        LOCATION=$(geoiplookup ${IP}|awk -F ',' '{print $NF}')

		echo "${COUNT},${IP},${LOCATION}" >> attackers.csv
	fi
done
exit 0

#IP_LIST=$(grep -E "rhost" syslog-sample | awk '{print $(NF - 1)}' | cut -d '=' -f2 | sort -nu)
#
## Finding the location of ip address
#for IP in $IP_LIST
#do
#	#find the count of ip address
#	COUNT=$(grep -E  $IP syslog-sample |wc -w)
#	
#	# find the location of ip address
#	LOCATION=$(geoiplookup ${IP}|awk -F ',' '{print $NF}')
#	
#	#adding cout,ip,location to attackers.csv file
#	echo "${COUNT},${IP},${LOCATION}" >> attackers.csv
#done
#
#echo "finding completed!!!"
#exit 0
##grep -E "rhost" syslog-sample | awk '{print $(NF - 1)}' | cut -d '=' -f2 | sort -n |uniq -c

#grep Failed syslog-sample | awk -F ' ' '{print $(NF-3)}' | sort -n | uniq -c | sort -nr

