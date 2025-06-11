#!/bin/bash

echo "I know the numbers upto 100"
echo "Enter a number"
read NUMBER

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal

if [ $NUMBER -lt 100 ]
then
    echo "You Entered the number is $NUMBER"
else
    echo "As I TOLD EARLIER I KNOW THE NUMBERS upto 100"
fi