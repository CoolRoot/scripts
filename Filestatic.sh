#/bin/bash
sum=0
count=0

##################################################

if [ $# -eq 0 ]; then
	echo "Error >_< : Please Determin Some Parametrs"; exit 1

elif [ $# -eq 1 ]; then
	if [ -d $1 ]; then
	cd $1
	for i in *; do
		if [ -f "$i" ]; then
			sum=$(( $sum + $((`wc -c "$i" | awk '{print $1}' `)) ))
			count=$(($count+1))
			#or you can do count=ls -lA|grep "^-"|wc -l |awk '{print $1}'
		fi
	done
	echo -e "There is $count Files in here :) \nWith a total size of $sum bytes ;)"
	exit 0
else
	echo "Not a Directory"; exit 1
fi
elif [ $# -eq 2 ]; then
	./Larger.sh $1 $2
else
	echo "Error: more than two parameters :( "; exit 1
fi

#do stuff
#temp=`wc -c $i |awk '{print $1}' `
#ls -lA|grep "^-"
#ls -lA |grep "^-" |awk '{print $5}'

