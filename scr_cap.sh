LOCATION="/tmp/$(date '+%d-%b-%Y')"
mkdir -p $LOCATION
cd $LOCATION
DISPLAY=:0 scrot '%H-%M-%S_scncap.jpg' -q 20
