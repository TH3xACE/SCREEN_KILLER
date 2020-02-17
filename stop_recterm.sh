#!/bin/bash
trm=$(cat $HOME/.bashrc | grep -v "tcommands.txt")
#echo "$trm"
echo "$trm" > $HOME/.bashrc
source $HOME/.bashrc 
