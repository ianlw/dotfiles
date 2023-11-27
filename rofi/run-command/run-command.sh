#!/usr/bin/sh
roficonfig=$HOME/.config/rofi/run-command/config.rasi
history=$HOME/.config/rofi/run-command/command-history

rofi=$(tac $history | rofi -config $roficonfig -dmenu -i)
[ -z "$rofi" ] && exit
# $rofi &
case "$rofi" in
    # "🟣 Jasmine 🎸") streamlink --twitch-disable-ads --title "{author}" --player "mpv --geometry=339x191 --script-opts=osc-layout=slimbox" https://www.twitch.tv/jasminexu007 360p &
    # "🟣 Jasmine 🎸") mpv --ytdl-format="[height<=480]" --geometry=339x191 "https://www.twitch.tv/jasminexu007" &
    "🟣 Jasmine 🎸") mpv --ytdl-format="bestvideo+bestaudio/best" --geometry=339x191 "https://www.twitch.tv/jasminexu007" &
    ;;
    "🟣 Melissa 🎹") mpv --ytdl-format="[height<=480]" --geometry=339x191 "https://www.twitch.tv/melissalammmusic" &
    ;;
    "🟣 Bashbunny 🐇") mpv --ytdl-format="bestvideo+bestaudio/best" --geometry=339x191 "https://www.twitch.tv/bashbunni" &
    ;;
    "🇺🇸 Translate 🇵🇪") kitty --config $HOME/.config/kitty/kitty-trans.conf --class translate --name translate $HOME/.config/scripts/translate
    ;;
    "🇵🇪 Traductor 🇺🇸") kitty --class traductor --name traductor $HOME/.config/scripts/traductor
    ;;
    "🎮 Party Hard 🥳") wine $HOME/Games/Party.Hard.v1.4.035/PartyHardGame.exe
    ;;
    *) $rofi &
    ;;
esac
# Borrar el comando ya existente para evitar repeticiones 
sed -i "/$rofi/d" $history
# Registrar el comando en el historial 
echo $rofi >> $history
