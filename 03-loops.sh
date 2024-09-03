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
        echo -e " $R $2 is not installed $N"
        exit 1
    else
        echo -e " $G $2 is installed  $N"
    fi

}

CHECK_ROOT

for package in $@
do 
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo -e "$G $package is not installed..... Please install the package.. $N"
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo -e "$G $package Already installed $N"
    fi
done