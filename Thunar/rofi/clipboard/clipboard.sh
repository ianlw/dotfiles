#!/usr/bin/sh

roficonfig=~/.config/rofi/clipboard/config.rasi

clipboard=$(gpaste-client history | grep -oP '[[:space:]](.*)'| rofi -config $roficonfig -dmenu -matching fuzzy -no-custom -location 0 -p "Search > ")
[ -z $clipboard ] && exit
echo -n $clipboard | xclip -selection clipboard
