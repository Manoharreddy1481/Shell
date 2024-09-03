#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

LOGS_FOLDER="var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
mkdir -p $LOGS_FOLDER
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP


CHECK_ROOT(){

if [ $USERID -ne 0 ]
then
    echo -e " $R proceed to install the mysql with root previllages $N" 
    exit 1
fi

}


VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e " $R $2 is not installed $N" &>>LOG_FILE
        exit 1
    else
        echo -e " $G $2 is installed  $N" &>>LOG_FILE
    fi

}

CHECK_ROOT

echo " script runnig date is: $(date)"

for package in $@
do 
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo -e "$G $package is not installed..... Please install the package.. $N" &>>LOG_FILE
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo -e "$G $package Already installed $N" &>>LOG_FILE
    fi
done