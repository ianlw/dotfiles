#!/bin/sh

# var=($(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm))
# echo ${var}
window=$(xdotool getwindowfocus getwindowclassname)
if [[ $window = "" ]]; then
    echo 'Desktop'
else
    # reemplazar el guión por un espacio
    echo "${window/-/ }"
    # echo $window
fi
