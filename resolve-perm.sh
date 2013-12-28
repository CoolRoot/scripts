#!/bin/bash
#resolve-prem

function Process {
username=$(cat /etc/passwd |grep $1|cut -d':' -f 1)
if [ "$1" == "$username" ]; then
	owner=$(ls -l $2|cut -d ' ' -f3)
	if [ "$owner" == "$username" ]; then
		perms=$(ls -l $2|cut -d ' ' -f1|cut -c 2-4)
	else
		perms=$(ls -l $2|cut -d ' ' -f1|cut -c 8-10)
	fi
	echo "($1's) Premissions on \"$2\" --> $perms"
else
	echo "Username $1 Not Found"
fi
}

if ! [ $# -eq 2 ]; then
	echo -e "Error : \nresolve-prem.sh takes only tow arguments (usename filename)\nresolve-prem.sh [username .. filename]\n\$./resolve-prem.sh ahmad f1.txt"
else
	Process $1 $2
fi
