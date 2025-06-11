#!/bin/bash

R="\e[31m"      #30 = black, 34 = blue, 35 = magenta, 36 = cyan, 37 = white
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "\e[31m Hello Red colour \e[0m"
echo -e "\e[32m Hello Green colour \e[0m"
echo -e "\e[33m Hello Yellow colour \e[0m"
echo "Hello NO colour"

echo -e "$R Hello Red colour $N"
echo -e "$G Hello Green colour $N"
echo -e "$Y Hello Yellow colour $N"
echo "Hello NO colour"