#!/bin.bash
#Grades
stop=false; 
function Avg 
{
	avg=0
	sum=0
	i=1
	swight=0
	L="F"
	for stGrd in $*
	do
		if [ $stGrd -ge 60  -a $stGrd -le 100 ]
		then
			if [ $i -eq 1 -o $i -eq 2 ] 
			then
				let sum=sum+$(expr $stGrd \* 2)
				let swight=swight+2
			else
				let sum=sum+stGrd
				let swight=swight+1
			fi
		fi
		let i=i+1
	done
	let avg=sum/swight
	echo "Avrage is : $avg"
	
	if   [ $avg -ge 60 -a $avg -lt 70 ]
	then
		L="D"
	elif [ $avg -ge 70 -a $avg -lt 80 ]
	then
		L="C"
	elif [ $avg -ge 80 -a $avg -lt 90 ]
	then
		L="B"
	elif [ $avg -ge 90 -a $avg -le 100 ]
	then
		L="A"
	fi
	echo "Level is : $L"
	echo "NOTE: the Avg is rounded ( 78.8 = 78 )"
}
function construct_data_file 
{
	if [ -e $1 ]
	then
		echo -e "file $1 exists, do you want to overwrite it y/n?"
		read temp
		if [ "$temp" == "y" ]
		then
			echo "" > $1
		else
			exit
		fi
	else
		touch $temp
	fi


	while ! [ stop ]
	do
		echo "do you want to enter St record y/n?"
		read temp1
		if [ "$temp" == "yes" ]
		then
			echo "enter St name : "
			read stname
			for((i=1;i<4;i++))
			do
				echo -e"enter St mark please : "
				read mrk$i
			done
			Avg mrk1 mrk2 mrk3
		else
			stop=true

		fi
	done
}

function Add_student 
{
	if ! [ -e "datafile" ]; then

	fi
}
function Del_student 
{

}
function Modify_student 
{

}
function Top_n_students
{

}

