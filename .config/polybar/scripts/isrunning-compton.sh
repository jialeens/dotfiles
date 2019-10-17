#!/bin/sh

case "$1" in
    --toggle)
        if [ "$(pgrep -x compton)" ]; then
            pkill compton | notify-send 'Compton stopped'
        else
            compton -b | notify-send 'Compton started'
        fi
        ;;
    *)
        if [ "$(pgrep -x compton)" ]; then
            echo "Compton : "
        else
            echo "Compton : "
        fi
        ;;
esac
