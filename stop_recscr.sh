#!/bin/bash

##### (Cosmetic) Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

CRONN=$(crontab -l | grep -v "scr_cap.sh")
#echo "$CRONN"
cat <(crontab -l |grep -v "${CRONN}") <(echo "${CRONN}") | crontab -
killall sleep
sleep 8
rmp="/tmp/$(date '+%d-%b-%Y')/*_scncap_*.jpg"
rm $rmp
echo -e "${GREEN} Screen Capture - Stopped ${RESET}"
