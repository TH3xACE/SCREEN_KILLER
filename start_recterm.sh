#!/bin/bash

##### (Cosmetic) Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

LOCATION="/tmp/$(date '+%d-%b-%Y')/commands"
mkdir -p $LOCATION
echo -e "${YELLOW}[-] Terminal logging can be found at: $LOCATION ${RESET}"
#touch $LOCATION/$(date +"%H-%M-%S")_commands.txt
#echo "test "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' || (script -f $LOCATION/$(date +"%H-%M-%S")_commands.txt)" >> $HOME/.bashrc
#echo -e "test "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' || (script -qfa $LOCATION/$(date +"%d-%b-%y_%H")_cmd.txt)" >> $HOME/.bashrc
cat cnt.txt >> $HOME/.bashrc
source $HOME/.bashrc
