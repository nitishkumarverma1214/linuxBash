#!/bin/bash

# Script to create backup

SRC_DIR='/home/nitish/LinuxBashScript/exercise'

DEST_DIR='/home/nitish/LinuxBashScript/backups'

CUR_TIMESTAMP=$(date +%d-%m-%Y-%H-%M-%S)
echo "Taking backup on ${CUR_TIMESTAMP}"

BACKUPFILE="${DEST_DIR}/${CUR_TIMESTAMP}.tgz"

# taking backup

tar -czf  ${BACKUPFILE} ${SRC_DIR}

if [[ ${?} -ne 0 ]]
then
	echo "backup can't be done"
	exit 1
else
	
	echo "backup completed"
fi

# Listing files in backup directory
echo 
echo "List the file in backup directory"
tar -tf "${BACKUPFILE}"


# extracting the file in backup directory
echo
echo "Extracting the files in the backup"
#tar -xf "${BACKUPFILE}"
