#!/bin/bash
#sort-files
cd files
exts=$(ls -l |cut -d ' ' -f 9|cut -d'.' -f2|sort|uniq|xargs)
for ext in $exts; do
	mkdir $ext
	for i in {1..10}
	do
		mv f$i.$ext $ext
	done
done
ls -R #list dir and sub-contents
