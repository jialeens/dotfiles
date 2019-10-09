#! /bin/bash

if pgrep -x redshift > /dev/null
then
	pkill redshift| notify-send 'Redshift stopped'
else
	redshift & 
	notify-send 'Redshift started'
fi
