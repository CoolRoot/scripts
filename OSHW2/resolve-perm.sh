#/bin/bash
#resolve-prem

function Process {
username=$(cat /etc/passwd |grep -w "^$1"|cut -d':' -f 1) # chech username 
groupname=$(sudo cat /etc/gshadow |grep  -w "^$1"|cut -d':' -f 1) # chech group name
if [ -e "$2" -a "$1" == "$username" -o "$1" == "$groupname" ]; then # if the entered username matches the OS username
	owner=$(ls -l $2|cut -d ' ' -f3)
	group=$(ls -l $2|cut -d ' ' -f4)
	if   [ "$owner" == "$username" ]; then # if owner = OS user then set perm to owner perms
		perms=$(ls -l $2|cut -d ' ' -f1|cut -c 2-4)
		if   [ "$group" == "$groupname" ]; then # if group = OS group then set perms to user + group perms
			perms=$perms$(ls -l $2|cut -d ' ' -f1|cut -c 5-7) # set to others perms :) 
		fi
	else
		perms=$(ls -l $2}cut -d ' ' -f1|cut -c 8-10)
	fi
	echo "($1's) Premissions on \"$2\" --> $perms" # output 
	echo -e " NOTE \tr : read\t w : write\t x : execute\n\t~_~\tSimple as that\t-_-"
else
	echo "Username/Groupname or file doesn't exists :  $1 Not Found" # print user/group name not found
fi
}

if ! [ $# -eq 2 ]; then # show how to use
	echo -e "Error : \nresolve-prem.sh takes only tow arguments (usename filename)\nresolve-prem.sh [username .. 
	filename]\n\$./resolve-prem.sh ahmad f1.txt"
else
	Process $1 $2 
fi
