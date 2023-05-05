#!/bin/sh

sleep $1;notify-send -u critical $2&&paplay --volume=71536 /usr/share/sounds/freedesktop/stereo/bell.oga
