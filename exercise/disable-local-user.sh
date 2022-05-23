#!/bin/bash


# Script to disable, delete, and optionaly archive user account



#path of Archive location

BACKUP_DIR="/archieve"

# usage function for the script
usage(){
	local MESSAGE="${@}"
	echo "${MESSAGE}" >&2
	echo "Usage: sudo ${0} [-d-r-a] login [login] ..." >&2
	echo "disable the account by default" >&2
	echo "-d  Deletes accounts" >&2
	echo "-r  removes the home directory associated with account" >&2
	echo "-a  archive the home directory" >&2
	
	exit 1
}

# Function for logging 
log(){
 	local MSG="${@}"
	echo "${MSG}" >&2
	exit 1
}

# Enforce root privieges
if [[ "${UID}" -ne 0 ]]
then
	usage "Require superuser privileges. run the script as sudo or root"
fi


# Processing the options

while getopts dra OPTION
do
  case ${OPTION} in
  	d)
  		DELETE='True'
  		;;
  	r)
  		HOME_RMV='-r'
  		;;
  
  	a)
  		ARCHIVE='True'
  		;;
  	?)
  		usage " invalid option."

  		;;
  esac

done 
shift "$((OPTIND-1))"

if [[ "${#}" -lt 1 ]]
then 
	usage "Atleast one user is required."
fi

# Processing each user.
while [[ $# -ne 0 ]]
do
	USER="${1}"
	echo "Processing ${USER} user Account"
	USER_ID=$(id -u "${USER}")

	#Check if it is a system account
	if [[ "${USER_ID}" -lt 1000 ]]
	then
		log  "System accounts can't be modified."
	fi

	if [[ "${ARCHIVE}" = "True" ]]
	then
		#Make sure archieve directory exists
		if [[ ! -d "${BACKUP_DIR}" ]]
		then
			echo " Creating ${BACKUP_DIR} directory."
			mkdir -p ${BACKUP_DIR}
			if [[ "${?}" -ne 0 ]]
			then
				log "The archive direcotry ${BACKUP_DIR} could not be crated."
			fi
		fi

 		#Archive the user's home directory and move it to BACKUP_DIR
		USER_HOME="/home/${USER}"
		CUR_TIME=$(date +%d-%m-%y-%H-%M-%S)
		BACKUP_FILE="${BACKUP_DIR}/${USER}/${CUR_TIME}.tgz"
		if [[ -d "${USER_HOME}" ]]
		then
			echo "Archiving the ${USER_HOME} TO ${BACKUP_DIR}"
			tar -czf "${BACKUP_FILE}" "${USER_HOME}" &> /dev/null
		
			if [[ "${?}" -ne 0 ]]
			then
				log "Home directory couldn't  archieve."
				
			fi	
		else
			log "${USER_HOME} DOES NOT EXIST OR IS NOT A DIRECTORY."
	

		fi
	fi

	if [[ "${DELETE}" = "True" ]]
	then
		# delete the user
		userdel ${HOME_RMV} "${USER}"

		# check to see if the userdel command succeeded.
		if [[ "${?}" -ne 0 ]]
		then
			log "${USER} account was not deleted."

		fi

		echo "The account ${USER} was deleted."
	
	

	else
		chage -E 0  ${USER}
		if [[ "${?}" -ne 0 ]]
		then
			log "User can't be disabled"


		fi

		echo "The account was disabled."
	fi

	shift 1
	
done

exit 0
