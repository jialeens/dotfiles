#!/bin/sh
if [  -f ~/.config/dunst/status  ]; then
    notify-send 'DUNST_COMMAND_RESUME'
    notify-send 'dunst is started'
else
    notify-send 'dunst is stoped'
    sleep 3
    notify-send 'DUNST_COMMAND_PAUSE'
fi