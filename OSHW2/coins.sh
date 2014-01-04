#!/bin/bash
#Coins Available are 5,10 and 25
function Process {
number=$1; count25=0; count10=0; count5=0
while [ $number -ge 5 ]; do # if greater or equal than 5 loop
	if   [ $number -ge 25 ]; then # greater or equal to 25
		count25=$(expr $number \/ 25 ) # add 1 to count25
		number=$(expr $number \% 25  ) # remove 25's from number
	elif [ $number -ge 10 ]; then 
		count10=$(expr $number \/ 10 ) # Same as above
		number=$(expr $number \% 10  ) #
	else
		count5=$(expr $number \/ 5 ) #
		number=$(expr $number \% 5 ) #
	fi
done
echo -e "We need :\n---------\n$count25 of 25's\n$count10 of 10's\n$count5 of 5's" # output 
echo "---------"
echo -e "$number left" # print what's left of coins
}

if [ $# -gt 1 ]; then # if pass more than one number error
	echo -e "Error : \ncoins.sh takes only one argument(number)\ncoins [number]\n\$./coins.sh 55"
else
	case $1 in
	    ''|*[!0-9]*) echo "Please use Digits" ;; # if passing chars instead of numbers
	    *) Process $1;; # do what you need to do
	esac
fi
