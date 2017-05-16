#!/bin/bash
# Function: Auto switch tab in Google Chrome on Ubuntu 16.04
# Date: 2017-03-28

while [ 1 ]
do
        wmctrl -a 'Google Chrome'
        xdotool key Ctrl+Page_Down
        sleep 3
done
