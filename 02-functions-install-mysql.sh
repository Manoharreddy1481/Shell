#!/bin/bash

# 1. check the user has root access or not
# 2. if root access, proceed with the script
# 3. otherwise through the error
# 4. check already installed or not, if installed tell the user it is already insalled
# 5. if not installed, install it
# 6. check it is success or not
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e " $R proceed to install the mysql with root previllages $N"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo " $R $2 is not installed $N"
        exit 1
    else
        echo " $G $2 is installed  $N"
    fi

}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo " $Y Proceed on installation of mysql $N"
    dnf install mysql -y
    VALIDATE $? "$Y Installing MYSQL $N" 
else
    echo "$G MYSql is already installed. $N"
fi

echo "$Y Working on installation of GIT $N"

dnf list installed git

if [ $? -ne 0 ]
then 
    echo " $G Proceed to install the GIT $N"
    dnf install git -y
    VALIDATE $? " $G Installing Git $N"
else 
    echo "$G GIT is already installed. $N" 
fi






