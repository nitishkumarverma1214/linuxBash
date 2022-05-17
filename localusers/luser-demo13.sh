#!/bin/bash

# This script shows the open network ports on a system.

netstat -nutl | grep -Ev "^Active|^Proto"

netstat -nutl | grep ':' | awk '{print $4}'

echo 
echo "first option(-4) is for ipv4 option"
echo "**************print open port no************"
netstat -nutl ${1} | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'

echo
echo "*******************Program names of open ports**************"
#Netstat with the program name
sudo netstat -nutlp
