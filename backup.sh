#!/bin/bash
# Variables
bucket=s3://yourbucket

# Folder to tar and send
folder=/location/of/www/or/htdocs

  # Define filenames
    filename=$(date +'%Y-%m-%d' +)monthlysitebackup.tar.gz
    tmpfile=/tmp/$filename
    
# Dump and zip
  echo -e "creating \e[0;35m$tmpfile\e[00m"


# Script will tar the large htdocs files into a folder call . first. When you're ready to recover,
# untar the contents of the . folder into the htdocs folder and replace it

tar "$tmpfile" -C "$folder" .
echo -e "the compression is done.."

# Once archived and moved to /tmp they are moved to the s3 bucket

echo -e "To the cloud Goku!.."
s3cmd -put "$tmpfile" "$bucket"

# Delete
rm -f "$tmpfile"
