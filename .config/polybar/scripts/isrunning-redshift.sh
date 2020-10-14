#!/bin/sh

case "$1" in
    --toggle)
        if pgrep -x redshift > /dev/null
		then
			pkill redshift
            notify-send 'RedShift stopped'
		else
			(redshift &)
            notify-send 'RedShift started'
		fi
        ;;
    *)
        if pgrep -x redshift > /dev/null; 
		then
            echo "RedShift "
        else
            echo "RedShift "
        fi
        ;;
esac

