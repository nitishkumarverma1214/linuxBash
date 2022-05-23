#!/bin/bash

# Different ways to perform mathematical operation


# Arithmetic expression
NUM=$(( 3 + 2 ))
echo "3 + 2 = $NUM"

NUM=$(( 3 - 2 ))
echo "3 - 2 = $NUM"

NUM=$(( 3 / 2 ))
echo "3 / 2 = $NUM"

NUM=$(( 3 * 2 ))
echo "3 * 2 = $NUM"

echo "increment operator"
echo "NUM = $NUM"
(( NUM++ ))
echo "NUM++ = $NUM"
echo "decrementing operator"
(( --NUM ))
echo "--NUM = $NUM"
echo "using shorthand operator"
(( NUM+= 5 ))
echo "NUM+=5 = $NUM"
#Using variable 
echo "Using variables"
DICEA=3
DICEB=2
TOTAL=$(( DICEA + DICEB ))
echo "${DICEA} + ${DICEB} = ${TOTAL}"

# Using bc -basic calculator

echo '6 / 4 ' | bc -l

# Using let
echo "use : help let to find all arithmetic operation"

let NUM='2 + 3'
echo "using let NUM='2 + 3' = $NUM"
let NUM++
echo "let NUM++ = $NUM" 

# Using expr 
echo "using expr "
expr 1 + 1
NUM=$(expr 2 \* 3)
echo "expr 2 * 3 = $NUM"

