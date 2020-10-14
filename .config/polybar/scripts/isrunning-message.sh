#!/bin/sh

case "$1" in
    --toggle)
        if [ ! -f ~/.config/dunst/status  ]; then
            touch ~/.config/dunst/status
            notify-send 'DUNST_COMMAND_RESUME'
            xdotool key ctrl+shift+space 
            notify-send 'dunst is started'
        else
            notify-send 'dunst is stoped'
            rm -rf ~/.config/dunst/status
            sleep 3
            notify-send 'DUNST_COMMAND_PAUSE'
        fi
        ;;
    --start)
            touch ~/.config/dunst/status
            notify-send 'DUNST_COMMAND_RESUME'
            xdotool key ctrl+shift+space 
            notify-send 'dunst is started'
        ;;
    --stop)
        if [ ! -f ~/.config/dunst/status  ]; then
            touch ~/.config/dunst/status
            notify-send 'DUNST_COMMAND_RESUME'
            xdotool key ctrl+shift+space 
            notify-send 'dunst is started'
        else
            notify-send 'dunst is stoped'
            rm -rf ~/.config/dunst/status
            sleep 3
            notify-send 'DUNST_COMMAND_PAUSE'
        fi
        ;;
    *)
        if [  -f ~/.config/dunst/status  ]; then
            echo ""
        else
            echo ""
        fi
        ;;
esac
