#!/bin/bash

#Enforce root privileges
if [[ "${UID}" -ne 0 ]] 
then
	echo "root privileges required to create user" >&2 
	exit 1
fi

#To check if Username is provide to create user.
if [[ "${#}" -lt 1 ]]
then
	echo "Usage: sudo ${0} USER_NAME [COMMENT]..." >&2 
	exit 1
fi

USER_NAME="${1}"
shift
COMMENT="${*}"

#Generating automatic password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

#creating a new user
useradd -c "${COMMENT}" -m "${USER_NAME}" &> /dev/null

#check if the user created successfully
if [[ "${?}" -ne 0 ]]
then 
	echo "user can't be created. " >&2 
	exit 1
fi

#add password to accout
echo "${USER_NAME}:${PASSWORD}" | chpasswd &> /dev/null

#check if output is added to the username
if [[ "${?}" -ne 0 ]]
then 
	echo "password can't be added to the account. " >&2 
	exit 1
fi

#Enforce password change on first login
passwd -e ${USER_NAME} &> /dev/null

# Display the new user information
echo "Username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "Hostname: ${HOSTNAME}"

#Exit the program successfully
exit 0
