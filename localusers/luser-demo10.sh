#!/bin/bash


# Functions helps in keeping the code DRY - Don't Repeat Yourself

log() 
{
	# Thios funcition sends a message to syslog and to standard output if VERBOSE is true.
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
	logger -t luser-demo10.sh "${MESSAGE}"
}

backup_file(){
# This function creates a backup of file. Returns non-zero status on error.

local FILE="${1}"

#Make  sure the file exits
if [[ -f "${FILE}" ]] 
then
	local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
	log "Backing up ${FILE} to ${BACKUP_FILE}."
	#The exit status of the function will be the exit status of the cp command.
	cp -p ${FILE} ${BACKUP_FILE}
else
	# The file doesn't exist, so return a non-zero exit status.
	
	return 1
fi

}

# readonly is used to make constant
readonly VERBOSE='true'
log "Hello!"
log "This is fun!"

backup_file '/etc/passwd'
#Make a decision based on the exit status of the funciton.
if [[ "${?}" -eq 0 ]] 
then 
	log 'File backup succeeded!'
else
	log 'File backup failed!'
	exit 1
fi




# Second way to write a function
#
#function log1
#{
#	echo 'Logging from second function'
#}

#log1


