#!/bin/bash
trm=$(cat $HOME/.bashrc | grep -v "recterm")
#echo "$trm"
echo "$trm" > $HOME/.bashrc
source $HOME/.bashrc 
