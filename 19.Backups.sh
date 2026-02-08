#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"
SOURCE_DIR=$1
DESTINATION_DIR=$2


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

##directories exist or not
if [! -d $SOURCE_DIR ]; then
    echo -e "$R Source directory doesn't exist $N"
    exit 1
fi

if [! -d $DESTINATION_DIR ]; then
    echo -e "$R destination directory doesn't exist $N"
    exit 1
fi

#find the files in source directory
if [ find ./home/ec2-user/app-logs -name "*.log" -type f -mtime -14 ]; then
    echo "displaying the files"
fi


