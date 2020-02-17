#/bin/bash
chk_scrot=$(dpkg -l | grep "scrot")

if [ -z "$chk_scrot" ]; then
echo -e "You need to install scrot. apt-get install scrot"
fi

path1="$PWD/scr_cap.sh"


var1=$(echo $(date '+%M'))
var2='60'
varr="$((var2 - var1))"

echo -e "The screenshots will be saved at :" "/tmp/$(date '+%d-%b-%Y')"
echo -e "The screen capture will start in about: " $varr "Seconds"

#CRON="*/1 * * * * $path1"

# pentest : limit screenshot from 9:00 to 18:00
#CRON="*/1 09-18 * * * $path1"

#cat <(crontab -l |grep -v "${CRON}") <(echo "${CRON}") | crontab -
#CRON=" " 

count=1
# frequency in seconds
#freq=10i
freq="$1"
while [ $count -le 60 ]
do	
	if [ $count -eq 1 ] 
	then
  	  CRON="* * * * * $path1"
  	  
	  # For pentest engagement : Capture only between 09:00 and 18:00
	  # CRON="* 09-18 * * * $path1"
	  count=$(( count+freq ))
         else 

	  # For pentest engagement : Capture only between 09:00 and 18:00
	  # CRON="* 09-18 * * * sleep $count; $path1"
	 
	 CRON="* * * * * sleep $count; $path1"
         count=$(( count+freq ))
        fi

    cat <(crontab -l |grep -v "${CRON}") <(echo "${CRON}") | crontab -
CRON=" "
done
