#!/bin/bash
#make-files
mkdir files
cd files
if ! [ -z "$*" ]; then	
	for ext in $*
	do
		mkdir $ext; cd $ext
		for i in {1..10}
		do
			echo -e "$(whoami)\n$(date)" >> f$i.$ext
		done
		cd ..
	done
	ls -R
	echo "do you want to delete files Dir?y/n"
	read ch
	if [ "$ch" == "y" ]; then
		cd ..
		rm -rf files/
	else
		echo "bye :)"
	fi
else
	echo "Error :\n Please pass some arguments"
	rm -rf files/
fi

