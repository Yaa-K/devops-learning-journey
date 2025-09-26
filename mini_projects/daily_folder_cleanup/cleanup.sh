#! /bin/bash


for FILE in  ~/old_files/*
do
mv "$FILE" ~/archive_files
done
echo "Cleanup run on $(date)" >> ~/cleanup.log

