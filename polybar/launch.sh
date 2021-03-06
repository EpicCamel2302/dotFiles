#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep polybar >/dev/null; do sleep 1; done

# Fix login issue
sleep 1

# Launch bar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m
#    polybar -c $HOME/.config/polybar/config -r right 2> /tmp/polybar_log &
#    polybar -c $HOME/.config/polybar/config -r center 2> /tmp/polybar_log &
#    polybar -c $HOME/.config/polybar/config -r left 2> /tmp/polybar_log &
    polybar -c $HOME/.config/polybar/config -r one 2> /tmp/polybar_log &
    polybar -c $HOME/.config/polybar/config -r lower 2> /tmp/polybar_log &
  done
fi
echo "Bars launched..."

