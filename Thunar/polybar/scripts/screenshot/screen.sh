#!/bin/sh

name=/tmp/screenshot.png
sleep 0.2;
scrot --silent -fs $name
let anchura=$(identify -format %w $name) 
let altura=$(identify -format %h $name)
save_name=/tmp/$(date +%F_%H%M%S)_$altura"x"$anchura.png
let menos_anchura=anchura-2
let menos_altura=altura-2

# rounded corners
convert $name \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,16 16,0 fill white circle 16,16 16,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite $save_name

# shadow
# convert $save_name \( +clone -background black -shadow 40x5+0+0 \) \
#+swap -background none -layers merge +repage $save_name; \

#Otra forma de redondear
# convert -size $anchura"x"$altura xc:none -draw "roundrectangle 0,0,$anchura,$altura,30,30" mask.png
# convert $name -matte mask.png -compose DstIn -composite $save_name
rm $name
# rm mask.png 
xclip -selection clipboard -target image/png -i $save_name && notify-send --icon=$save_name "Copiado"
