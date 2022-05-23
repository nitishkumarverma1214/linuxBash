#!/bin/bash


#This script demostrates I/O redirection.

#Redirect STDOUT to a file.

FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

echo "Content of the file ${FILE}"

#Redirect STDIN to a program.
read LINE < ${FILE}
echo "LINE contains: ${LINE}"


#Redirect STDOUT to a file, overwriting the file.
head -n3 /etc/passwd > ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

#Append to a file
echo "${RANDOM}${RANDOM}" >> "${FILE}"
echo "${RANDOM}${RANDOM}" >> "${FILE}"
cat $FILE


###########################################


# FD 0 - Standard Input
# FD 1 - standard output
# FD 2 - Standard Error

#Command > File

#command >>file

#FD 1 is the default for standard output

# Command &> file

# command |& command

#command < file
#command > /dev/null

###########################################


#Redirect STDIN to a program, using FD 0.
echo "Using FD 0"
read LINE 0< "${FILE}"
echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file using FD 1, overwriting the file.
echo "Using FD 1"
head -n3 /etc/passwd 1> ${FILE}
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STDERR to a file using FD 2.
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}

#Redirect the STDOUT AND STERR to a file.
head -n3 /etc/passwd /fakefile &> ${FILE}
echo 
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect the STDOUT and STDERR through the pipe
echo
head -n3 /etc/passwd /fakefile |& cat -n

#Send output to STDERR
echo "This is STDERR!" >&2


#Discard STDOUT
echo 
echo "Discarding STDOUT:"
head -n3 /etc/passwd /fakefile > /dev/null

#Discard STDERR
echo
echo "Discarding STDERR:"
head -n3 /etc/passwd /fakefile 2> /dev/null

#Discard STDOUT and STDERR
echo 
echo "Discarding STDOUT and STDERR:"
head -n3 /etc/passwd /fakefile &> /dev/null

# Clean up
rm ${FILE} ${ERR_FILE} &> /dev/null

