#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] #checking the file scritp having the root access or not
then 
    echo "ERROR :: PLEASE RUN THE SCRIPT WITH ROOT ACCESS"
    exit 1
else
    echo "YOU ARE RUNNIBG WITH ROOT ACCESS"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo " MYSQL is not INSTALLED going to INSTALL "
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo " MYSQL is SUCCESSFULLY INSTALLED "
    else
        echo " INSTALLING of MYSQL is FAILED"
        exit 1
    fi    
else
    echo " MYSQL is already INSTALLED "
fi        
