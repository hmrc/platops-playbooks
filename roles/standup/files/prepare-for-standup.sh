#!/bin/bash

killall chromium-browser
sleep 5
export DISPLAY=:0
chromium-browser --start-maximized "https://jira.tools.tax.service.gov.uk/secure/RapidBoard.jspa?rapidView=513&quickFilter=9581" &
sleep 20
DISPLAY=:0 xdotool key F11
sleep 10
DISPLAY=:0 xdotool key z
