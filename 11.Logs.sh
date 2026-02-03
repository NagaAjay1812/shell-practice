#!/bin/bash
USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-practise"
LOGS_FILE="/var/log/shell-practise/$0.log"



if [ $USERID -ne 0 ]; then
    echo "please run the script with root user access." | tee -a $LOGS_FILE
    exit 1
fi
mkdir -p $LOGS_FOLDER

VALIDATE(){ 
    if [ $1 -ne 0 ]; then
        echo "$2.....Failure" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2.....Success" | tee -a $LOGS_FILE
    fi
}

dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "Installing Nginx"


dnf install mysql-server -y &>> $LOGS_FILE
VALIDATE $? "Installing MySQL"
