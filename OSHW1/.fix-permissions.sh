#/bin/bash

function setPerm()
{
	if [ -d "$2/share" ]; then 
		chmod 750 "$2/share"
		##################share################
		cd "$2/share" # ~/share
		for file in *; do
			if [ -f "$file" ]; then
				chmod 744 "$file"
			elif [ -d "$file" ]; then
				chmod 750 "$file"
			fi
		done
		###################~####################
		cd "$2" # ~
		for file1 in *; do
			if [ -f "$file1" ]; then
				chmod 600 "$file1"
			elif [ -d "$file1" ]; then
				chmod 700 "$file1"
			fi
		done
		ls -lArt > report.txt
	else
		echo "$2/share doesn't Exists"
	fi
}


if [ $# -gt 0 ]; then
	for i in $*; do
		tempo=`cat /etc/passwd | awk -F ":" '{print $1}' |grep "^$i" `
		if [ -n "$tempo" ]; then
			tempo1=`cat /etc/passwd | grep "^$i" | awk -F ":" '{print $6}' `
			setPerm $i $tempo1 #Bass The USERNAME and HOMEDIR
		else echo "User Not Found"; exit 1
		fi
	done
elif [ $# -eq 0 ]; then 
	loop=`cat /etc/passwd | awk -F '[:]' '{print $3}' | xargs `
	for j in $loop; do
	if [ $j -gt 500 ]; then
			temp1=`cat /etc/passwd | awk -F ":" '{print $1" "$3}' | grep "$j" | awk '{print $1}' `
			temp2=`cat /etc/passwd | awk -F ":" '{print $3" "$6}' | grep "$j" | awk '{print $2}' `
			setPerm $temp1 $temp2
		fi
	done
else 
	echo "Error"; exit 1
fi

#	cat /etc/passwd | awk -F'[:]' '{print $1}'
#	$(( ls -lAt | grep "^-"|awk '{print $9}' ))
#	chmod 744 $(( find . -maxdepth 1 -type f ))
#	you may use xargs too :)

