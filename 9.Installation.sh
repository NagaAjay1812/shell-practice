#!/bin/bash
USERID=$(id -u)

if [$USERID -ne 0]; then
    echo "run the script with root user access"
    exit 1
fi

echo "Installing Nginx"
dnf install nginx -y

if [ $? -ne 0]; then
    echo "Installation of Nginx.....Failure"
else
    echo "Installation of Nginx....Success"
fi

