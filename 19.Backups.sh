#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run the script with root user access $N" 
    exit 1
fi
USAGE(){
    echo -e "$R sudo usage <source-dir> <des_dir> <days> [default 14 days] $N"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
    exit 1
fi


