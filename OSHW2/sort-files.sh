#!/bin/bash
#sort-files
if [ -d "files"  ]; then #if files Dir exists
	exts=$(ls -l |awk -F'.' '{print $2}'|sort|uniq|xargs) #get extenssions
	for ext in $exts; do #loop throught the extenssions
		mkdir $ext #mkdir for each exten
		for i in {1..10}; do #loop for each file
			mv f$i.$ext $ext # move it to the exten directory
		done
	done
	ls -R #list dir and sub-contents
fi
