#!/bin/bash

#Generate a random number

PASS="${RANDOM}"
echo "${PASS}"

#Generating a long random nubmer
PASS="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASS}"


# Use the current date/time as the basis for the password.
PASS=$(date +%s)
echo "${PASS}"


#Use nanosecond to act as randomization
PASS=$(date +%s%N)
echo "${PASS}"


#A better password.
PASS=$(date +%s%N | sha256sum | head -c32)
echo "${PASS}"

#A even better password.
PASS=$(date +%s+N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASS}"

# Append a special character to a variable name.
# shuf is used to shuffle
# each input line to seperate width

SPECIAL_CHARACTER=$(echo "!@#$%^*()" | fold -w1 | shuf | head -c1)
echo "${PASS}${SPECIAL_CHARACTER}"
