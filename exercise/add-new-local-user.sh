#!/bin/bash



#Enforce superuser execution
if [[ "${UID}" -ne 0 ]]
then
	echo "execute the script as superuser"
	echo "Usage: sudo ${0} login ..."
	exit 1
fi

#Enfore user supply the account
if [[ "${#}" -lt 1 ]]
then
	echo "Usage: sudo ${0} USERNAME [COMMENT]..."
	exit 1
fi

USER_NAME="${1}"
# The rest of the paramerters are for the account comments.
shift
COMMENT="${*}"

#Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c32)

#Create a new user
useradd -c "${COMMENT}" -m "${USER_NAME}" 

#check if the user created successfully
if [[ ${?} -ne 0 ]]
then
	echo "User can't be created"
	exit 1
fi

#Assign a password to the account
echo "${USER_NAME}:${PASSWORD}" | chpasswd

if [[ "${?}" -ne 0 ]]
then
	echo "The password for the account can't be set."
	exit 1
fi

#Change the password after first login
passwd -e "${USER_NAME}"

#Display the created user information
printf '#%.0s' {1..50}
echo
echo "Username : ${USER_NAME}"
echo "Password : ${PASSWORD}"
echo "Hostname : ${HOSTNAME}"
printf '#%.0s' {1..50}
echo

exit 0
