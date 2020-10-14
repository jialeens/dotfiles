#!/bin/sh
NOTIFY_ICON=~/.local/share/icons/papirus-icon-theme-master/Papirus/64x64@2x/apps/mailspring.svg

inbox1=$(echo "user = \"xxxx\"" | curl -sf -K- -X "STATUS INBOX (UNSEEN)" imap://"XXX"/INBOX | tr -d -c "[:digit:]")

if [ "$inbox1" -gt 0 ]; then
    notify-send -u low -i $NOTIFY_ICON "thunisoft has $inbox1 new mail(s)"
fi

echo " ($inbox1)"