#!/bin/bash

USERID=$(id -u)
R="\e[31m"      #30 = black, 34 = blue, 35 = magenta, 36 = cyan, 37 = white
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/shellscript-log"
SCRIPT_NAME=$(echo $0|cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx" "http")

mkdir -p $LOG_FOLDER
echo "The Script was executing at $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ] #checking the file scritp having the root access or not
then 
    echo -e "$R ERROR :: PLEASE RUN THE SCRIPT WITH ROOT ACCESS $N" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G YOU ARE RUNNIBG WITH ROOT ACCESS $N" | tee -a $LOG_FILE
fi

VALIDATE (){
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 is SUCCESSFULLY INSTALLED $N" | tee -a $LOG_FILE
    else
        echo -e "$R ERROR :: INSTALLING of $2 is FAILED $N" | tee -a $LOG_FILE
        exit 1
    fi
}

for PACKAGES in ${PACKAGES[@]}
do
    dnf list installed $PACKAGES &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$Y $PACKAGES is not INSTALLED going to INSTALL $N" | tee -a $LOG_FILE
        dnf install $PACKAGES -y &>>$LOG_FILE
        VALIDATE $? "$PACKAGES"
    else
        echo -e "$G $PACKAGES is already INSTALLED $N" | tee -a $LOG_FILE
    fi 
done
