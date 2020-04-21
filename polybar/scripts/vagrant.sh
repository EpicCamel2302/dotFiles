#!/bin/bash

status=$(cd ~/src/nqdm-martini && vagrant status)
if  [[ "${status}" == *"The VM is running"* ]];then
	echo "%{F#0F0} %{F-}"
else
	echo "%{F#F00} %{F-}"
fi
