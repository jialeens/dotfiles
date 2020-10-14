#!/bin/sh

case "$1" in
    --toggle)
        if [ "$(pgrep -x picom)" ]; then
            pkill picom 
            notify-send 'Picom stopped'
        else
            picom --experimental-backends --xrender-sync-fence -b 
            #picom -b  
            notify-send 'Picom started'
        fi
        ;;
    *)
        if [ "$(pgrep -x picom)" ]; then
            echo "Picom "
        else
            echo "Picom "
        fi
        ;;
esac
