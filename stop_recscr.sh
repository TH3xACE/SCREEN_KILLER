#!/bin/bash
CRONN=$(crontab -l | grep -v "scr_cap.sh")
#echo "$CRONN"
cat <(crontab -l |grep -v "${CRONN}") <(echo "${CRONN}") | crontab -
