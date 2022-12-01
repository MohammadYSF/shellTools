#!/bin/bash
read -p "are your sure you want to do this ? (y/n) : " answer
if [ $answer == 'y' ]
then
	while [ "1" == "1" ]
	do
		sleep 5
		result=`ps aux | grep a.out`
        	if echo "$result" | grep -q "./a.out"
        	then
			echo "a.out is running ! can not remove it right now "
	        	#do nothing beacuse you are doing something with this
        	else
			if [ -f "a.out" ]
			then
				rm "a.out"
				echo "a.out deleted successfully from the folder "
			fi
	        
		fi
	done
else
	echo "bye!"
fi
