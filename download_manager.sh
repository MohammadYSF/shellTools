#!/bin/bash
#$1 = download url
#$2 = start hour date
#$3 = start minute date
#$4 = end hour date
#$5 = end minute date
#$6 = save location
get_current_hour () {
	echo -e "date +%H"
}
get_current_minute () {
	echo -e "date +%M"
}
minutes_to_seconds () {
	answer=$(($1 / 60 ))
	echo "$answer"
}
substract () {
	answer=$(($1 - $2))
	echo "$answer"
}
sum () {
	answer=$(($1 + $2))
	echo "$answer"
}
#$1 : the download link
#$2 : path
download () {
	echo " dollar 1 is $1"
	echo "dollar 2 is $2"
	link="$1"
	path="$2"
	wget "$link -O $path" 
}
url="$1"
current_hour=`get_current_hour`
current_minute=`get_current_minute`

start_hour="$2"
start_minute="$3"
end_hour="$4"
end_minute="$5"
path="$6"
total_minutes_current=`sum $((current_hour * 60))  current_minute`
total_minutes_start=`sum $(( start_hour * 60))  start_minute`
total_minutes_end=`sum $(( end_hour * 60))  end_minute`
difference_start_current_in_minutes=`substract total_minutes_start total_minutes_current`
difference_start_current_in_seconds=`minutes_to_seconds difference_start_current_in_minutes`
echo "sleeping for $difference_start_current_in_seconds : "
sleep $difference_start_current_in_seconds

is_download_started="0"
while [ "1" == "1" ]
do
	echo "in the while loop : "

	if [ $is_download_started == "0" ]
	then
		is_download_started="1"
		echo "Starting download : "
		`download $url $path`
	else
		if [ get_current_hour == end_hour ] && [ get_current_minute == end_minute ]
		then
			echo "killing"
			killall wget
			#stop the download
		else
			echo "sleeping"
			sleep 3
		fi
	fi
done

#download "$link $path"
