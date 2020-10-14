#!/usr/bin/env bash

question=$(echo " one monitor| two monitors| restart polybar| lock| logout| reboot| shutdown" | rofi -sep "|" \
    -dmenu -i -p 'System: ' "" -width 20 -hide-scrollbar \
    -eh 1 -line-padding 4 -padding 20 -lines 7 -color-enabled -theme rofi-theme -f "Font Awesome 5 Brands") 

case $question in
    *monitor)
        current_workspace="$(i3-msg -t get_workspaces | jq -r 'map(select(.focused))[0].name')"
        command i3-msg "workspace 1:Home;move workspace to output HDMI-0"
        command i3-msg "workspace 2:Browser;move workspace to output HDMI-0"
        command i3-msg "workspace 3:Coding;move workspace to output HDMI-0"
        command i3-msg "workspace 4:Document;move workspace to output HDMI-0"
        command i3-msg "workspace 5:Console;move workspace to output HDMI-0"
        command i3-msg "workspace 6:Chat;move workspace to output HDMI-0"
        command i3-msg "workspace 7:Git;move workspace to output HDMI-0"
        command i3-msg "workspace 8:Mail;move workspace to output HDMI-0"
        command i3-msg "workspace 9:Other;move workspace to output HDMI-0"
        command i3-msg "workspace $current_workspace"
        ;;
    *monitors)
        current_workspace="$(i3-msg -t get_workspaces | jq -r 'map(select(.focused))[0].name')"
        command i3-msg "workspace 1:Home;move workspace to output HDMI-0"
        command i3-msg "workspace 2:Browser;move workspace to output HDMI-0"
        command i3-msg "workspace 3:Coding;move workspace to output HDMI-0"
        command i3-msg "workspace 4:Document;move workspace to output HDMI-0"
        command i3-msg "workspace 5:Console;move workspace to output VGA-0"
        command i3-msg "workspace 6:Chat;move workspace to output VGA-0"
        command i3-msg "workspace 7:Git;move workspace to output VGA-0"
        command i3-msg "workspace 8:Mail;move workspace to output VGA-0"
        command i3-msg "workspace 9:Other;move workspace to output VGA-0"
        command i3-msg "workspace $current_workspace"
        ;;
    *lock)
        xscreensaver-command -lock
        ;;
    *logout)
        #command -v gnome-session-quit 2>/dev/null 2>&1 || command -v session-logout >/dev/null 2>&1
        i3exit logout
        ;;
    *reboot)
        i3exit reboot
        ;;
    *shutdown)
        i3exit shutdown
        ;;
    *polybar)
        ~/.config/polybar/launch.sh
        ;;
    *)
        exit 0  # do nothing on wrong response
        ;;
esac