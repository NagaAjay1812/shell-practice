#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"
SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14} # 14 days is the default value, if the user not supplied

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

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1 " | tee -a $LOG_FILE
}

if [ $# -lt 2 ]; then
    USAGE
    exit 1
fi

##directories exist or not
if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R Source directory : $SOURCE_DIR doesn't exist $N"
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]; then
    echo -e "$R Destination directory :$DESTINATION_DIR doesn't exist $N"
    exit 1
fi

#find the files in source directory
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS )

log "Backup started"
log "Source directory : $SOURCE_DIR "
log "Destination directory : $DESTINATION_DIR "
log "Days : $DAYS "

if [ -z $FILES ]; then 
    log "Files doesnt exist to archieve"
fi

