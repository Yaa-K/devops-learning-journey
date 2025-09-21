#! /bin/bash

read  -p "Please enter a filename: " FILENAME

if[ -e "$FILENAME"];then
echo "$FILENAME exists"
if[ -r "$FILENAME"];then
echo "$FILENAME is readable"
fi 
if[ -w "$FILENAME"];then
echo "$FILENAME is writable" 
fi 
if[ -x "$FILENAME"];then
echo "$FILENAME is executable" 
fi
else
echo "$FILENAME does not exist"
fi


