#!/bin/bash

killall chromium-browser
sleep 5
export DISPLAY=:0
chromium-browser --start-maximized file:///home/pi/countdown.html &
sleep 20
DISPLAY=:0 xdotool key F11

