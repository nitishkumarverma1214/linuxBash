#!/bin/bash

# cut by character
cut -c1 /etc/passwd

cut -c7 /etc/passwd

#cut using range

cut -c 4-7 /etc/passwd

#cut using inital range to end

cut -c 4- /etc/passwd

#cut using upto a position

cut -c -4 /etc/passwd

#cut using multiple charater

cut -c 1,3,5 /etc/passwd

# Note cut don't rearrage even if u specify in the command

cut -c 3,1,5 /etc/passwd


#cut by byte

cut -b 1 /etc/passwd

# cut by field
echo -e "one\ttwo\tthree" | cut -f 1

# cut by delim and field

echo "one,two,three" | cut -d ',' -f2


cut -d ':' -f1,3 /etc/passwd

# change the output delim
tail -n2 /etc/passwd | cut -d ':' -f1,3 --output-delimiter=','
echo
echo "*********************************"
# remove the header

echo 'first,last' > people.csv
echo 'John,Smitt' >> people.csv
echo 'firstly,mclasty' >> people.csv
echo 'Mr. firstly,mclasty' >> people.csv
cut -d ',' -f1 people.csv

echo 
echo "************without header***************"

cut -d ',' -f1 people.csv | grep -v '^first$'

echo 
echo "**********cut with multiple character delim******************"
#using awk
awk -F 'DATA:' '{print $2}' people.dat

awk -F ':' '{print $1, $3}' /etc/passwd

awk -F ':' -v OFS=',' '{print $1, $3}' /etc/passwd

awk -F ':' '{print $1 ", " $3}' /etc/passwd

awk -F ':' '{print "col1:" $1 " Col3:"$3}' /etc/passwd

# change the order of column is possible
awk -F ':' '{print "UID:"$3 ";LOGIN:" $1}' /etc/passwd

# To print the last field 
awk -F ':' '{print $NF }' /etc/passwd

