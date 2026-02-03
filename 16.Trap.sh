#!/bin/bash

set -e
trap 'echo "there is an error in $LINENO, command : $BASH_COMMAND"'ERR

# removed VALIDATE function completely and using trap from onwards
USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]; then
    echo "$R please run the script with root user access. $N" | tee -a $LOGS_FILE
    exit 1
fi



for package in $@  # we are passing parameters like sudo sh 11.Loops.sh nginx mysql
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package Not installed, Installing now"
        dnf install $package -y &>> $LOGS_FILE  
    else 
        echo -e "$package is already installed, $Y Skipping $N"
    fi
done