#!/bin/bash

#Display the UID and username of the user executing this script.

#Display the UID
echo "Your UID is ${UID}"

#Only display the UID does not macth 1000.
UID_TO_TEST_FOR='1000'
if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
	echo "Your UID doesn't match ${UID_TO_TEST_FOR}."
	exit 1
fi

#display the username.
USER_NAME=$(id -un)

#Test if the command succeeded 
# $? holds the exit status of the most recently executed command.
if [[ "${?}" -ne 0 ]] 
then
	echo 'The id command did not executed successfully.'
	exit 1
fi
echo "Your user name is ${USER_NAME}"

#You can use a string test conditional
USER_NAME_TO_TEST_FOR='nitish'
if [[ "${USER_NAME_TO_TEST_FOR}" = "$USER_NAME" ]]
then
	echo "Your username matches the ${USER_NAME_TO_TEST_FOR}."
fi

#Note =(single equal to) is used for exact macth while 
# == (double equal to) is used for pattern match.

# Test for !=(not equal) for the string.
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then
	echo "Your username doesn't matches the ${USER_NAME_TO_TEST_FOR}."
	exit 1
fi

exit 0


