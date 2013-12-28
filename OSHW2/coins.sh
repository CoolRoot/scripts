#!/bin/bash
#Coins Available are 5,10 and 25
#
function Process
{
number=$1
count25=0
count10=0
count5=0
while [ $number -ge 5 ]; do
	if   [ $number -ge 25 ]; then # if (n >= 25)
		let number=number-25 #number = $(expr $number +1)
		let count25=count25+1
	elif [ $number -ge 10 ]; then 
		let number=number-10
		let count10=count10+1
	elif [ $number -ge 5 ]; then
		let number=number-5
		let count5=count5+1
	fi
done
echo -e "We need :\n---------\n$count25 of 25's\n$count10 of 10's\n$count5 of 5's"
echo "---------"
echo -e "$number left"
}

if [ $# -gt 1 ]; then
	echo -e "Error : \ncoins.sh takes only one argument(number)\ncoins [number]\n\$./coins.sh 55"
else
	case $1 in
	    ''|*[!0-9]*) echo "Please use Digits" ;;
	    *) Process $1;;
	esac
fi
