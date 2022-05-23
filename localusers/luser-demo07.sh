#!/bin/bash

#Demostrate the use of shift and while loops

# Display the first tree parameters.

echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"
echo "Parameter 3: ${3}"
echo "Parameter 4: ${4}"
echo 

# Using while loop
i=1
while [[ "${#}" -gt 0 ]]
do
	echo "Parameter ${i} : ${1}"
	i=$(( i+1 ))
	shift
done
