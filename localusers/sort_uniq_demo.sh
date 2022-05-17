#!/bin/bash

#Sort a file
echo "**********sort a file***************"
sort /etc/passwd

echo "************sort in reverse order*************"
#sort in reverse order
sort -r /etc/passwd

echo "************sort the nunbers*****************"
#sort the number
cut -d ":" -f3 /etc/passwd | sort -n

echo "*************Sort in human readable form*************"
sudo du -h /var | sort -h |tail -1

echo "************uniq in sort***************"
netstat -nutl | grep ":" | awk '{print $4}' | awk -F ':' '{print $NF}' |sort -un

echo "***************Using uniq command************"
# uniq command require the input to be sorted as it only compare with previous line
netstat -nutl | grep ":" | awk '{print $4}' | awk -F ':' '{print $NF}' |sort -n |uniq

echo "**************count of each occurance************"
#count occurance of each element
netstat -nutl | grep ":" | awk '{print $4}' | awk -F ':' '{print $NF}' |sort -n |uniq -c

cat /var/log/syslog | awk '{print $5}' | sort |uniq -c |sort -n

echo "**************use wc for line, byte and word count ******************"
#count no of users
wc -l /etc/passwd

#find users using bash
grep bash /etc/passwd | wc -l

# sort based on row in a file
# t is for field seperator and k is for key - based on which sort is performed.
cat /etc/passwd | sort -t ':' -k 3 -n

