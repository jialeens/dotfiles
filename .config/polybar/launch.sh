#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    
##    MONITOR=$m polybar --reload top &
#    MONITOR=$m polybar --reload bottom &
#done
for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: Core 0" ]; then
        export HWMON_PATH="$i"
    fi
done
MONITOR=HDMI-0 polybar --reload left-top -l error  &
MONITOR=HDMI-0 polybar --reload left-bottom -l error  &
MONITOR=VGA-0 polybar --reload right-top -l error  &