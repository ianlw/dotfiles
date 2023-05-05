#!/usr/bin/bash

config=$HOME/.config/rofi/powermenu/config1.rasi
configconfirm=$HOME/.config/rofi/powermenu/config-confirm.rasi
#dev.ares.ares --- sleep
# rofi=$( echo -en "Shutdown\0icon\x1fboot\nSleep\0icon\x1fsleep-face\nReboot\0icon\x1ficons8-restart" | rofi -dmenu -i -show-icons -config $config)
# rofi=$( echo -en "Shutdown\0icon\x1fboot\nSleep\0icon\x1fsleeping_face_3d\nReboot\0icon\x1ficons8-restart" | rofi -dmenu -i -show-icons -config $config)
rofi=$( echo -en "Shutdown\0icon\x1fnew_moon_face_3d\nSleep\0icon\x1fcrescent_moon_3d\nReboot\0icon\x1ffull_moon_face_3d" | rofi -dmenu -i -show-icons -config $config)
[ -z "$rofi" ] && exit

# confirm="Confirm\0icon\x1fcheckbox\nCancel\0icon\x1fxmoto"
confirm="Confirm\0icon\x1fthumbs_up_3d_default\nCancel\0icon\x1fthumbs_down_3d_default"

case $rofi in
    "Shutdown")
    roficonfirm=$(echo -en $confirm| rofi -config $configconfirm -dmenu -i -show-icons)
    [ -z "$roficonfirm" ] && exit
        if [ "$roficonfirm" = "Confirm" ]; then
            shutdown now
        fi
        ;;
    "Sleep")
    roficonfirm=$(echo -en $confirm| rofi -config $configconfirm -dmenu -i -show-icons)
    [ -z "$roficonfirm" ] && exit
        if [ "$roficonfirm" = "Confirm" ]; then
            systemctl suspend
        fi
        ;;
    "Reboot")
    roficonfirm=$(echo -en $confirm | rofi -config $configconfirm -dmenu -i -show-icons)
    [ -z "$roficonfirm" ] && exit
        if [ "$roficonfirm" = "Confirm" ]; then
            systemctl reboot
        fi
        ;;
esac

