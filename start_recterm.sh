#!/bin/bash
LOCATION="/tmp/$(date '+%d-%b-%Y')/commands"
mkdir -p $LOCATION
#touch $LOCATION/$(date +"%H-%M-%S")_commands.txt
#echo "test "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' || (script -f $LOCATION/$(date +"%H-%M-%S")_commands.txt)" >> $HOME/.bashrc
#echo -e "test "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' || (script -qfa $LOCATION/$(date +"%d-%b-%y_%H")_cmd.txt)" >> $HOME/.bashrc
cat cnt.txt >> $HOME/.bashrc
source $HOME/.bashrc
