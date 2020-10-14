#!/usr/bin/env bash

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

