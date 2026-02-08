#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/home/ec2-user/app-logs"
LOGS_FILE="/home/ec2-user/app-logs/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run the script with root user access $N" | tee -a $LOGS_FILE
    exit 1
fi



if [ ! -d $LOGS_FOLDER ]; then
    echo -e "$R directory is not existed $N"
    exit 1
fi

FILES_TO_DELETE=$(find $LOGS_FOLDER -name "*.log" -type f -mtime -14)
    echo $FILES_TO_DELETE





