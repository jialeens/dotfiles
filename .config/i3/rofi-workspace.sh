#!/usr/bin/env bash

question=$(echo "1:Home|2:Browser|3:Code|4:Document|5:Console|6:Chat|7:Git|8:Mail|9:Other" | rofi -sep "|" \
    -dmenu -i -p 'Workspace: ' "" -width 500 -hide-scrollbar \
    -eh 1 -line-padding 4 -padding 20 -lines 3 -columns 3 -color-enabled -theme rofi-theme -f "Font Awesome 5 Brands;Font Awesome 5 Free") 

case $question in
    *Home)
        i3-msg workspace 1:Home
        ;;
    *Browser)
        i3-msg workspace 2:Browser
        ;;
    *Coding)
        i3-msg workspace 3:Coding
        ;;
    *Document)
        i3-msg workspace 4:Document
        ;;
    *Console)
        i3-msg workspace 5:Console
        ;;
    *Chat)
        i3-msg workspace 6:Chat
        ;;
    *Git)
        i3-msg workspace 7:Git
        ;;
    *Mail)
        i3-msg workspace 8:Mail
        ;;
    *Other)
        i3-msg workspace 9:Other
        ;;
    *)
        exit 0  # do nothing on wrong response
        ;;
esac