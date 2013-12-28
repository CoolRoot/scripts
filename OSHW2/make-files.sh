#!/bin/bash
#make-files
mkdir files
cd files
if ! [ -z "$*" ]; then	
	for ext in $* #like foreach in programming
	do
		for i in {1..10} # for((i=0;i<10;i++))
		do
			echo -e "$(whoami)\n$(date)" >> f$i.$ext
		done
	done
	ls |sort
else
	echo -e "Error :\n Please pass some arguments"
#	rm -rf files/
fi

