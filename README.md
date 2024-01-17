# cloud-uploader

This project is part of the AWS cloud resume challenge.
The script has been placed in my /usr/local/bin/ folder to allow me to run the command from any file path in the command line.


To use this script, provide the file location after typing cloudUploader. ex. "cloudUploader ~/example.txt".
The script will then place the file or directory into your S3 bucket. (Make sure to update the bucketName variable)
If the file already exists, you will be prompted to choose a different name.
