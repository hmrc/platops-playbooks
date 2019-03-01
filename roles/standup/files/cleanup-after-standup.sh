#!/bin/bash

killall chromium-browser 
sleep 5
export DISPLAY=:0
chromium-browser --start-maximized &
sleep 20
DISPLAY=:0 xdotool key F11

