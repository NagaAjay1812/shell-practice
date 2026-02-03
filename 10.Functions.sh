#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run the script with root user access."
    exit 1
fi



VALIDATE(){ 
    if [ $1 -ne 0 ]; then
        echo "$2.....Failure"
        exit 1
    else
        echo "$2.....Success"
    fi
}

dnf install nginx -y
VALIDATE $? "Installing Nginx"


dnf install mysql-server -y
VALIDATE $? "Installing MySQL"

