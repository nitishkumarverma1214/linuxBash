#!/bin/bash

# To delete an user account

# Check if root

if [[ "${UID}" -ne 0 ]]
then
	echo "execute the script as root or sudo" >&2
	exit 1
fi

# Assusing the first argument is the user to delete.

USER="${1}"

# Delete the user
userdel ${USER}

if [[ "${?}" -ne 0 ]]
then
	echo "The account ${USER}  is not deleted" >&2
	exit 1
fi	

# Tell the user the account was deleted.
echo "The account ${USER} was deleted."

exit 0
