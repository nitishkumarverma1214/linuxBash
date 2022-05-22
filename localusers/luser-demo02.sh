#!/bin/bash

#Display the UID and username of the user executing this script.
#Display if the user is the root user or not.


#Display the UID
echo "Your UID is ${UID}"

#Display the username.
id -u -n
#id -un
#id -nu
#id -n -u

#Store output of a command in a variable.
USER_NAME=$(whoami)
echo "Your username is $USER_NAME"

#Alternative to store output
WORKING_DIR=`pwd`
echo "The print working directory is $WORKING_DIR"

#Display if the user is root user or not.
if [[ "${UID}" -eq 0 ]]
then
	echo 'You are root.'
else
	echo 'You are not root.'
fi
#Note: there should be space after "if" and after "[[" and before "]]"
#Note: ; or newline are the command seperator
# [[ is a shell keywork --> help [[ --> it is bash specific 
# [ is a shell builtin --> help [
# help test --> to check expressions


#Exit status 
# 0 means true and 1 means false
