#!/bin/bash
espeak "AC Unpluged, Suspending in 20 seconds if power is not restored."
for ((i=0;i<4;i++)); do sleep 5
	if [ $(cat /sys/class/power_supply/AC0/online) -eq "1" -a $i -eq 4 ]; then
		/usr/bin/systemctl suspend
	else espeak "Check power cable please."; fi
