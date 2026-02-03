#!/bin/bash
USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"



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

for package in $@  # we are passing parameters like sudo sh 11.Loops.sh nginx mysql
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "Not installed, Installing now"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "$package Installation"
    else 
        echo "$package is already installed, Skipping"
    fi
done