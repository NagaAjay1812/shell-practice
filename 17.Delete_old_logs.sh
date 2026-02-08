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

FILES_TO_DELETE=$(find $LOGS_FOLDER -name "*.log" -type f -mtime -14)  #-14: means delete last 14 days logs ; +14 means delete logs older than 14 days
    # echo $FILES_TO_DELETE

# Read the file line by line
while IFS= read -r line; do # seperate line by line and store in 'line' variable.
  # Process the line here
  echo "Deleting files: $line" # print the line
  rm -f $line #deleted the files suceesfully
  echo "deleted the files successfully"
done <<< "$FILES_TO_DELETE" # to read input variable we use <<< ; to read file we use <.




