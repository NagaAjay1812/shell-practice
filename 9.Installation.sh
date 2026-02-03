#!/bin/bash
USERID=$(id -u)

if [$USERID -ne 0]; then
    echo "run the script with root user access"
    exit 1
fi


dnf install nginx -y

