#!/bin/sh
pkill conky
conky -c ~/.config/conky/conky_main &
conky -c ~/.config/conky/conky_shortcuts &