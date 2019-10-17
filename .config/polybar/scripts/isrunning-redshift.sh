#!/bin/sh

case "$1" in
    --toggle)
        if pgrep -x redshift > /dev/null
		then
			pkill redshift| notify-send 'Redshift stopped'
		else
			redshift & 
			notify-send 'Redshift started'
		fi
        ;;
    *)
        if pgrep -x redshift > /dev/null; 
		then
            echo "Redshift : "
        else
            echo "Redshift : "
        fi
        ;;
esac

