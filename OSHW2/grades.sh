#!/bin.bash
#Grades
function construct_data_file
{
	if [ -e $1 ]
	then
		echo -e "file $1 exists, do you want to overwrite it y/n?"
		read temp
		if [ "$temp" == "y" ]
		then
			touch $temp
		else
			exit
		fi
	else
		touch $temp
	fi



echo "do you want to enter St record yes/no?"
read temp1
if [ "$temp" == "yes" ] 
then
	echo "enter name:"
	read stname



}
