#!/bin/bash

echo "Enter first number to ADD"
read NUMBER1
echo "Enter second number to ADD"
read NUMBER2

TIMESTAMP=$(date)
echo "script executed at : $TIMESTAMP"

SUM=$(($NUMBER1+$NUMBER2))
echo "sum of two number $NUMBER1 & $NUMBER2 is $SUM"