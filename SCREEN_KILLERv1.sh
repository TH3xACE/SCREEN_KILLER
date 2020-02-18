#!/bin/bash
# This script was to developed to capture screenshot during pentest and OSCP 
# Version="version 1"
# V1: Date Created : 17/02/2020
# Date of last modification : 17/02/2020
# @TH3_ACE - BLAIS David

##### (Cosmetic) Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

#$SCRIPT_PATH1="./scripts/"

cat << "EOF"
  ____    ____  ____   _____  _____  _   _       _  __ ___  _      _      _____  ____  
 / ___|  / ___||  _ \ | ____|| ____|| \ | |     | |/ /|_ _|| |    | |    | ____||  _ \ 
 \___ \ | |    | |_) ||  _|  |  _|  |  \| |     | ' /  | | | |    | |    |  _|  | |_) |
  ___) || |___ |  _ < | |___ | |___ | |\  |     | . \  | | | |___ | |___ | |___ |  _ < 
 |____/  \____||_| \_\|_____||_____||_| \_|_____|_|\_\|___||_____||_____||_____||_| \_\
                                          |_____|                                                                                                                         
EOF

#echo -e "\n" 
#echo -e "\n" 
echo -e "${BLUE} @TH3_ACE - BLAIS David"
echo -e "${BLUE} Contribute and collaborate to the KILLER project @ https://github.com/TH3xACE ${RESET}"
#echo -e "\n" 

PS3="Please enter your choice:"
options=("Start recording commands" "Stop recording commands" "Start Screen Capture" "Stop Screen Capture" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Start recording commands") 
 	    chkterm=$(cat $HOME/.bashrc | grep "tcommands")
	    if [ "$chkterm" ]; then
 	    echo -e "${RED} There is already a recording session running. ${RESET}"    
    	    else
 	    :
	    echo -e "${GREEN}Starting to record commands... ${RESET}"
	    bash "$PWD/start_recterm.sh"
	    fi
            ;;
        "Stop recording commands") 
	    chkterm=$(cat $HOME/.bashrc | grep "tcommands")
	    if [ "$chkterm" ]; then
            echo "Stopping the recording of commands...Leave a little time for all commands to get saved then close all the terminals"
	    bash "$PWD/stop_recterm.sh"
	    else
 	    :
	    echo -e "${RED} There is no running session to stop... ${RESET}"
	    bash "
            ;;
        "Start Screen Capture")
	    #echo -e "${YELLOW} Starting screen capture... ${RESET}"
	    echo -e "${RED} [+] Please enter the frequency screen capture in seconds: ${RESET}"
	    read freq
	    #echo $freq
	    echo -e "${YELLOW} Starting screen capture... ${RESET}"
	    bash "$PWD/start_recscr.sh" $freq 
	    freq=" "
	    echo -e "${GREEN} Screen capture started... ${RESET}"
            ;;
	"Stop Screen Capture")
	    echo -e "${YELLOW} Stopping screen capture...Please wait a few moment! ${RESET}"
	    bash "$PWD/stop_recscr.sh"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

