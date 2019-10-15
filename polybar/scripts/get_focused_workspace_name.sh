#!/bin/sh
while true; do
  lines=$(i3-msg -t get_workspaces \
    | jq '.[] | select(.focused==true).name' \
    | cut -d"\"" -f2)
  array=(${lines//:/ }) 
  printf " ${array[1]}\\n"

	sleep 2
done