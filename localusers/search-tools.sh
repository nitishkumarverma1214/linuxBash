#!/bin/bash

# List of different searching tools.

#Using which command.
echo "'which' return the path of the file or link that should be executed"
which deluser
which python3

#Using find Command 
echo
echo "find syntax: find <location> <option>"
find /etc  -type f -name passwd 2>/dev/null

find /etc -type f -name *.conf -user root -size +20k -newermt 2020-03-03 2>/dev/null

# Using locate command --> it used db for fast access but not upto date
echo
echo "using locate"
# update the database
sudo updatedb

locate /etc/*.conf
