#!/bin/bash
#Coins Available are 5,10 and 25
#
function Process
{
number=$1; count25=0; count10=0; count5=0
while [ $number -ge 5 ]; do
	if   [ $number -ge 25 ]; then
		count25=$(expr $number \/ 25 )
		number=$(expr $number \% 25  )
	elif [ $number -ge 10 ]; then 
		count10=$(expr $number \/ 10 )
		number=$(expr $number \% 10  )
	else
		count5=$(expr $number \/ 5 )
		number=$(expr $number \% 5 )
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
