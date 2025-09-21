#! /bin/bash

##Editor: Yaa Kesewaa Yeboah
##Date 21/09/2025

read -p "Enter a random number" NUMBER #This would take a random number from the user

if (( $NUMBER > 10));then
 echo "$NUMBER is greater than 10"

elif (($NUMBER < 10));then
echo  "$NUMBER is less than 10"

else
echo "$NUMBER is equal to 10"

fi


