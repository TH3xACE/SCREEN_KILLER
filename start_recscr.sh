#/bin/bash


##### (Cosmetic) Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

chk_scrot=$(dpkg -l | grep "scrot")
if [ "$chk_scrot" ]; then

#echo -e "${YELLOW} Screen Capture Started.  ${RESET}"

path1="$PWD/scr_cap.sh"

echo -e "${YELLOW}The screenshots will be saved at :" "/tmp/$(date '+%d-%b-%Y') ${RESET}"
#echo -e "The screen capture will start in about: " $varr "Seconds"

#CRON="*/1 * * * * $path1"

# pentest : limit screenshot from 9:00 to 18:00
#CRON="*/1 09-18 * * * $path1"

#cat <(crontab -l |grep -v "${CRON}") <(echo "${CRON}") | crontab -
#CRON=" " 

count=1
# frequency in seconds
#freq=10
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

var1=$(echo $(date '+%S'))
var2='60'
varr="$((var2 - var1))"

cc=$((varr/freq))
while [ $cc != 0 ]
do
sleep $freq
cc=$((cc-1))
bash $PWD/scr_cap.sh 
done &
else
:
echo -e "${RED}[*] You need to install scrot. apt-get install scrot ${RESET}"
fi


