#!/bin/bash

# player_status=$(playerctl --player=harmonoid,spotify,cmus status 2> /dev/null)
# # player_status_youtube=$(playerctl --player=chromium status 2> /dev/null)
# #if [[ $? -eq 1 ]]; then
# player_status_vlc=$(playerctl --player=vlc status 2> /dev/null)
#
# # esto se ejecuta en ciclo y no permiter que el programa continue
# #new_playerctl=$(playerctl --follow metadata --format '{{ artist }} - {{ title }}')
#
# metadata1="$(playerctl --player=harmonoid,spotify,cmus,chromium metadata artist 2> /dev/null) - $(playerctl --player=harmonoid,spotify,cmus,edge metadata title 2> /dev/null)"
# # metadata_youtube="$(playerctl --player=spotify,cmus,chromium metadata title 2> /dev/null)"
# metadata_vlc=$(playerctl --player=vlc metadata title 2> /dev/null)
#
#
# # Foreground color formatting tags are optional
# if [[ $player_status_vlc = "Playing" ]]; then
#     echo "%{F#928596}露 $metadata_vlc%{F-}"
# elif [[ $player_status_vlc = "Paused" ]]; then
#     echo "%{F#3a3939} $metadata_vlc%{F-}"
# fi
#
# if [[ $player_status = "Playing" ]]; then
#     echo "%{F#928596} $metadata1%{F-}"
# elif [[ $player_status = "Paused" ]]; then
#     echo "%{F#3a3939} $metadata1%{F-}"
# #fi
# #if [[ $player_status_youtube = "Playing" ]]; then
# #    echo "%{F#FFFFFF}  $metadata_youtube%{F-}"
# #elif [[ $player_status_youtube = "Paused" ]]; then
# #    echo "%{F#999}  $metadata_youtube%{F-}"
# #elif [[ $metadata = "Stopped" ]]; then
# #    echo "No music"
# else
#     echo "No music"
# fi
#

metadata() {
    metadata="$(playerctl --player=spotify,harmonoid,cmus,vlc metadata artist 2> /dev/null) - $(playerctl --player=harmonoid,spotify,cmus,edge metadata title 2> /dev/null)"
    # echo $metadata
    status=$(playerctl --player=spotify,harmonoid,cmus,vlc status)
    case "$status" in
        "Playing")echo "%{F#928596}$1 $metadata%{F-}"
        ;;
        "Paused")echo "%{F#3a3939}$1 $metadata%{F-}"
        ;;
        *) echo "%{F#3a3939}$1"
        ;;
    esac
}

# All Players
players=$(playerctl --list-all 2> /dev/null)
# players="spotify  i"
case "$players" in
    *"spotify"*) metadata ""
    ;;
    *"harmonoid"*) metadata ""
    ;;
    *"cmus"*) metadata "󰎄"
    ;;
    *"vlc"*) metadata "󰐹"
    ;;
    *) echo no music
    ;;
esac
