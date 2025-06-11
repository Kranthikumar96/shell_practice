#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] #checking the file scritp having the root access or not
then 
    echo "ERROR :: PLEASE RUN THE SCRIPT WITH ROOT ACCESS"
    exit 1
else
    echo "YOU ARE RUNNIBG WITH ROOT ACCESS"
fi

VALIDATE (){
    if [ $1 -eq 0 ]
    then
        echo " $2 is SUCCESSFULLY INSTALLED "
    else
        echo " INSTALLING of $2 is FAILED"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo " MYSQL is not INSTALLED going to INSTALL "
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo " MYSQL is already INSTALLED "
fi 

dnf list installed python3
if [ $? -ne 0 ]
then
    echo " python3 is not INSTALLED going to INSTALL "
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo " python3 is already INSTALLED "
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo " nginx is not INSTALLED going to INSTALL "
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo " nginx is already INSTALLED "
fi