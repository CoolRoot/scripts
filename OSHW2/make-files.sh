#!/bin/bash
#make-files
if ! [ -d "files" ]; then #check if files dir exists 
	mkdir files #make it if it doesn't exists
	cd files
	if [ -n "$*" ]; then	#if there are arguments go on
		for ext in $*; do #loop foreach extenssion passed
			for i in {1..10}; do #loop to create each file from 1-10
				echo -e "$(whoami)\n$(date)" >> f$i.$ext #add the desired content
			done
		done
		ls |sort #show the files
	else
		echo -e "Error :\n Please pass some arguments\ti.e doc mp3 mpeg wav txt" # no arguments are passed
	fi
else
	echo -e "files Dir exsits (remove the Dir first), Do you want me to remove it yes/no" #ask to remove if exists
	read ch
	if [ "$ch" == "yes" ]; then
		rm -rf files/
	fi
fi


