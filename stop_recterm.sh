#!/bin/bash

##### (Cosmetic) Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

trm=$(cat $HOME/.bashrc | grep -v "tcommands.txt")
#echo "$trm"
echo "$trm" > $HOME/.bashrc
source $HOME/.bashrc 
echo -e "${GREEN} Recording of commands - Stopped ${RESET}"
