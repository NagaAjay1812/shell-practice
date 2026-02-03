#!/bin/bash
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


VALIDATE(){ 
    if [ $1 -ne 0 ]; then
        echo -e "$2..... $R Failure $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$2..... $G Success $N" | tee -a $LOGS_FILE
    fi
}

for package in $@  # we are passing parameters like sudo sh 11.Loops.sh nginx mysql
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package Not installed, Installing now"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "$package Installation"
    else 
        echo -e "$package is already installed, $Y Skipping $N"
    fi
done