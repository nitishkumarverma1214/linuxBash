#!/bin/bash


#This script demonstrates the case statement.


#if [[ "${1}" = 'start' ]]
#then 
#	echo "Starting..."
#elif [[ "${1}" = 'stop' ]]
#then
#	echo 'stopping...'
#elif [[ "${1}" = 'status' ]]
#then
#	echo 'Status.'
#else
#	echo 'Supply a valid option.' >&2
#fi

case "${1}" in

	start)
		echo "starting..."
		;; # end the block
	stop)
		echo "stopping..."
		;;
	status|state|--status|--state)
		echo "status:"
		;;
	*)
		echo "Supply a valid option." >&2
		exit 1
		;;
esac

