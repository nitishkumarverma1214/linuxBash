#!/bin/bash

# This script creates a new user on the local system.


#Enforce that it is excuted by superuser.
UID_OF_ROOT=0

if [[ "${UID}" -ne "${UID_OF_ROOT}" ]]
then
	echo "Please run with sudo or as root."
	exit 1
else
	echo "Welcome root!!!. This Program will help you create users"
fi

#Get details of the new User

read -p 'Enter the username: ' USER_NAME
read -p 'Enter the Full name of user: ' COMMENT
read -p 'Enter the Password: ' PASSWORD
#Create a new user
#adduser --home "/home/${USER_NAME}" --gecos "${COMMENT}" "${USER_NAME}"
useradd -c "${COMMENT}" -m "${USER_NAME}" 

#Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]]
then
	echo "The user can't be created"
	exit 1
fi

#if user is created set the password
echo "${USER_NAME}:${PASSWORD}" | chpasswd

#Enfore change password on first login
passwd -e "${USER_NAME}"

#display the new user details

echo "New username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "host: ${HOSTNAME}"

#Exit after successful execution
exit 0
