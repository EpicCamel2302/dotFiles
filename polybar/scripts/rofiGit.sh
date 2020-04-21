#!/bin/bash

BRANCHES=$(cd ~/src/nqdm-martini/ ; git branch)
selected=$(while IFS= read -r line; do
    echo " $line"
done <<< "$BRANCHES" | rofi -dmenu -p "Current local branches:")
if [ "$selected" ]
then
	selected="${selected/   }"
	selected="${selected/*   }"
        selected="${selected/ * }"

	echo "${selected}"
	cd ~/src/nqdm-martini 
	result=`git checkout "${selected}"` 
	notify-send "switched to branch ${selected}
${result}"
fi
