#!/bin/bash

OLDIFS=$IFS
IFS=$'\n'

lines=`sudo apt-get update 2>&1 | grep "NO_PUBKEY"`

for line in $lines
do

	key=`echo $line | tail --bytes=17`

	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key

	SOMETHINGDONE="true"
	
done

IFS=$OLDIFS

if [ $SOMETHINGDONE ]
then
	sudo apt-get update
fi
