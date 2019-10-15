#!/usr/bin/env bash

BAR_ICON=""
NOTIFY_ICON=~/.local/share/icons/McMojave-circle/apps/scalablesystem-software-update.svg
get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    # if find checkupdates running, skip check.
    if test $( pgrep -f checkupdates | wc -l ) -eq 0
    then
            get_total_updates

        # notify user of updates
        if hash notify-send &>/dev/null; then
            if (( UPDATES > 50 )); then
                notify-send -u critical -i $NOTIFY_ICON \
                    "You really need to update!!" "$UPDATES New packages"
            elif (( UPDATES > 25 )); then
                notify-send -u normal -i $NOTIFY_ICON \
                    "You should update soon" "$UPDATES New packages"
            elif (( UPDATES > 2 )); then
                notify-send -u low -i $NOTIFY_ICON \
                    "$UPDATES New packages"
            fi
        fi

        # when there are updates available
        # every 300 seconds another check for updates is done
        while (( UPDATES > 0 )); do
            if (( UPDATES == 1 )); then
                echo " $UPDATES Update $COUNT"
            elif (( UPDATES > 1 )); then
                echo " $UPDATES Updates $COUNT"
            else
                echo $BAR_ICON $COUNT
            fi
            sleep 300
            get_total_updates
        done

        # when no updates are available, use a longer loop, this saves on CPU
        while (( UPDATES == 0 )); do
            echo $BAR_ICON 0 Updates
            sleep 300
            get_total_updates
        done
    fi
done
