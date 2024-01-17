#!/bin/bash

fileLocation="$1"

IFS="/"

bucketName="EnterBucketNameWithoutS3://"

read -ra splitFilePath <<< "$fileLocation"

newFile=${splitFilePath[${#splitFilePath[@]}-1]}

aws s3 ls s3://$bucketName > ~/cloudFolders

grep -iw "$newFile" ~/cloudFolders

if [ $? -eq 0 ]
then
    echo "$newFile already exists, use another name for the file."
    exit
else
    aws s3 cp "${splitFilePath[*]}" s3://$bucketName --quiet
    if [ $? -eq 0 ]
    then
        echo "$newFile was uploaded to your bucket!"
    else
        echo "Looks like there was an issue with $newFile. Try a different file name."
    fi
fi

