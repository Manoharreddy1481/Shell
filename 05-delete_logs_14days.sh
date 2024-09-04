#!/bin/bash

source_dir="/home/ec2-user/logs
if [ -d $source_dir ]
then
    echo "$source_dir  exists"
else
    echo "$source_dir does not exists"
    exit 1
fi
files=$(find $source_dir -name "*.log" -mtime +14)
echo "files : $files"
while IFS= read -r file
do
    echo "Deleting the file: $file"
    rm -rf $file
done <<< $files


# FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
# echo "Files: $FILES"

# # dont use line, it is reserverd word
# while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
# do
#     echo "Deleting file: $file"
#     rm -rf $file
# done <<< $FILES
