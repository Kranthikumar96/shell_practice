#!/bin/bash

R="\e[31m"      #30 = black, 34 = blue, 35 = magenta, 36 = cyan, 37 = white
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ] #checking the file scritp having the root access or not
then 
    echo -e "$R ERROR :: PLEASE RUN THE SCRIPT WITH ROOT ACCESS $N"
    exit 1
else
    echo -e "$G YOU ARE RUNNIBG WITH ROOT ACCESS $N"
fi

VALIDATE (){
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 is SUCCESSFULLY INSTALLED $N"
    else
        echo -e "$R ERROR :: INSTALLING of $2 is FAILED $N"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "$Y MYSQL is not INSTALLED going to INSTALL $N"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "$G MYSQL is already INSTALLED $N"
fi 

dnf list installed python3
if [ $? -ne 0 ]
then
    echo -e "$Y python3 is not INSTALLED going to INSTALL $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$G python3 is already INSTALLED $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "$Y nginx is not INSTALLED going to INSTALL $N"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$G nginx is already INSTALLED $N"
fi