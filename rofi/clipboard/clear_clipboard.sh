#!/bi/sh

roficonfig=~/.config/rofi/screenshot/config.rasi

clear_bottom=""
rofi=$(printf "$clear_bottom" | rofi -config $roficonfig -dmenu -i)
[ -z "$rofi" ] && exit
    gpaste-client delete-history
