#!/bin/bash

# To execute the command across different system

usage(){

local MESSAGE="{@}"
echo "${MESSAGE}"
echo "Usage: ${0} [-nsv] [-f FILE] COMMAND " >&2
echo "-f FILE Use FILE for the list of servers. Default: /vagrant/servers." >&2
echo "-n      Dry run mode. Display the COMMAND that would have been executed and exit." >&2
echo "-s      Execute the COMMAND using sudo on the remote server." >&2
echo "-v      Verbose mode. Displays the server name before executing COMMAND." >&2
exit 1
}


#ensure that the script is not executed as root.
if [[ "${UID}" -eq 0 ]]
then    
    usage "Do not execute this script as root. Use the -s option instead."
fi

SERVER_LIST="./servers"

#Processing all the options
while getopts nsf:v OPTION
do
    case ${OPTION} in
        f)
            SERVER_LIST="${OPTARG}"
            
            ;;
        n)
            DRY_RUN='true'
            ;;
        v)
            VERBOSE='true'
            ;;
        s)
            PREVILAGE="sudo"
            ;;
        *)
            usage "illegal option"
            ;;
    esac
done

if [[ ! -e "${SERVER_LIST}" ]]
then
    echo "Cannot open server list file ${SERVER_LIST}"
    exit 1
fi

shift ((${OPTIND-1}))

if [[ $# -lt 1 ]]
then
    usage "Executes COMMAND as a single command on every server."
fi

COMMAND="${1}"

for SERVER in $(cat SERVER_LIST)
do
    if [[ "${VERBOSE}" = 'true' ]]
    then
        echo "${SERVER}"
    fi

    if [[ "${DRY_RUN}" = 'true' ]]
    then
        echo 'DRY RUN: ssh -o ConnectTimeout=2 "${SERVER} ${PREVILAGE} ${COMMAND}"'
    else
        ssh -o ConnectTimeout=2 "${SERVER} ${PREVILAGE} ${COMMAND}"
    fi
done

exit 0