#!/bin/bash

# 1. check the user has root access or not
# 2. if root access, proceed with the script
# 3. otherwise through the error
# 4. check already installed or not, if installed tell the user it is already insalled
# 5. if not installed, install it
# 6. check it is success or not

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo " proceed to install the mysql with root previllages"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Proceed on installation of mysql"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "installation of mysql is UNSUCCESS"
    else 
        echo "installation of mysql is SUCCESS"
    fi
else
    echo "MYSql is already installed."
fi

echo "Working on installation of GIT"

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "Proceed to install the GIT"
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Installation of git is UNSUCCESSFUL."
    else
        echo "Installation of git is SUCCESSFUL."
    fi
else 
    echo "GIT is already installed." 
fi






