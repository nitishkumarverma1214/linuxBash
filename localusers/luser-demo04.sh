#!/bin/bash

#This script creates an account on the local system.
#You will be prompted for the account name and password.

# Ask for the user name.
read -p 'Enter the username to create: ' USER_NAME

#Ask for the real name.
read -p 'Enter the name of the person who is the owner of the account: ' COMMENT

#Create the user. Set the password for the user.
useradd -c "${COMMENT}" -m ${USER_NAME}
passwd "${USER_NAME}"

# Force password change on first login.
passwd -e ${USER_NAME}

