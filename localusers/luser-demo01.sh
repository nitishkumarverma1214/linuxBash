#!/bin/bash

#  # = sharp
#  ! = bang
#  #! = shebang

# This script displays various information  to the screen.

# Display 'hello'

echo "hello"

#change the file permission to execute the file
# chmod u+x luser-demo01.sh

# The current directory is represented by .(dot)
# The parent directory is represented by ..(double dot)

# To excute a file which is executable 
# ./luser-demo01.sh
# or we can give full path as /home/nitish/LinuxBashScript/luser-demo01.sh
# or ~/LinuxBashScript/luser-demo01.sh

# To check if a function is builtin 
type echo

# Assign a value to a variable
WORD='script'
# No space before and after the equal to symbol

#Display the value using the variable.
# Double quote --> Interpret the variable.
echo "$WORD"

# single quote --> no expansion. Print the content exactly on the screen.
echo '$WORD'

#combine the vaiable with hard-coded text.
echo "The shell I am using is $BASH"

#Alternative syntax to display variable
echo "The shell I am using is ${BASH}"

#Append text to a variable
echo "${WORD}ing is fun!!"

#Append doesn't work without {}
echo "$WORDing is fun!!"


# Create a new variable
ENDING='ed'

#Combine the two varialbe.
echo "This is ${WORD}${ENDING}"

#Change the value stored in the ENDING variable. (Reassignment)
ENDING="ing"
echo "This is $WORD$ENDING"

#again reassignment
ENDING='s'
echo "You are going to write many $WORD$ENDING in this class!"
