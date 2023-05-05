#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar log -c ~/.config/polybar/current.ini &
polybar secondary -c ~/.config/polybar/current.ini &

## Right bar
# polybar top -c ~/.config/polybar/current.ini &
#polybar primary -c ~/.config/polybar/current.ini &
polybar tray -c ~/.config/polybar/tray.ini &
## Center bar
polybar primary -c ~/.config/polybar/workspace.ini &
polybar window -c ~/.config/polybar/window.ini &
#polybar pomodoro -c ~/.config/polybar/current.ini &
## Cmus bar
# polybar cmusbar -c ~/.config/polybar/current.ini &

# Estatus music
polybar music -c ~/.config/polybar/music_status.ini &

# Estatus music
polybar audiocontrol -c ~/.config/polybar/audio_control.ini &
