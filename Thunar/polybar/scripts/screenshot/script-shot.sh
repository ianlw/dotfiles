#!/bin/sh

#envFile=~/.config/polybar/scripts/screenshot
#directory='/home/ian/Imágenes/Screenshots/1/%F_%T_$wx$h.png'
#directory2='/home/ian/Imágenes/Screenshots/2/%F_%T_$wx$h.png'
#directory3='/home/ian/Imágenes/Screenshots/3/%F_%T_$wx$h.png'
if [ $1 = "--only-icon" ];then
    echo  ''
fi
out=$(cat /home/ian/.config/polybar/scripts/screenshot/status.txt)
#echo '***'

if [ $1 = "--output" ];then
    echo  '' $out
fi
#echo '***'

shot () {
    # scrot --silent -fs $directory -e "notify-send --icon=\$f "Capturado""

    name=/tmp/screenshot.png
    sleep 0.2;
    scrot --silent -fs $name
    let anchura=$(identify -format %w $name) 
    let altura=$(identify -format %h $name)
    # directory=/tmp/$(date +%F_%H%M%S)_$altura"x"$anchura.png
    let menos_anchura=anchura-2
    let menos_altura=altura-2

# rounded corners
convert $name \
     \( +clone  -alpha extract \
        -draw 'fill black polygon 0,0 0,16 16,0 fill white circle 16,16 16,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite $directory

rm $name
# xclip -selection clipboard -target image/png -i $directory && notify-send --icon=$directory "Copiado"

}

# swchier of directory
while [ True ]; do
    if [[ $1 = "--switch" ]]; then
        if [[ $out = "Investigación" ]]; then
            # directory='/home/ian/2022-I3/ProgramacionI/%F_%T_$wx$h.png'
            echo /dev/null > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
            echo 'Algoritmos' > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
#            echo 'Programación I'
        fi

        if [[ $out = "Algoritmos" ]]; then
        # directory='/home/ian/2022-I3/Probabilidades_y_estadística/%F_%T_$wx$h.png'
            echo /dev/null > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
            echo 'AdministraciónTI' > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
#            echo 'Probabilidad'
        fi

        if [[ $out = "AdministraciónTI" ]]; then
        # directory='/home/ian/2022-I3/CalculoII/%F_%T_$wx$h.png'
            echo /dev/null > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
            echo 'DiscretasII' > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
#            echo 'Cálculo II'
        fi

        if [[ $out = "DiscretasII" ]]; then
        # directory='/home/ian/2022-I3/Abstraccion_de_datos_y_objetos/%F_%T_$wx$h.png'
            echo /dev/null > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
            echo 'ProgramaciónII' > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
#            echo 'Datos'
        fi
        
        if [[ $out = "ProgramaciónII" ]]; then
        # directory='/home/ian/2022-I3/Fisica_aplicada/%F_%T_$wx$h.png'
            echo /dev/null > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
            echo 'Electrónica' > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
#            echo 'Física'
        fi

        if [[ $out = "Electrónica" ]]; then
        # directory='/home/ian/2022-I3/Fisica_aplicada/%F_%T_$wx$h.png'
            echo /dev/null > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
            echo 'Música' > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
#            echo 'Física'
        fi
        if [[ $out = "Música" ]]; then
        # directory='/home/ian/2022-I3/Algebra_lineal/Tema_siguiente/%F_%T_$wx$h.png'
            echo /dev/null > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
            echo 'Investigación' > '/home/ian/.config/polybar/scripts/screenshot/status.txt'
#            echo 'Algebra'
        fi
        #directory='/home/ian/Imágenes/Screenshots/2/%F_%T_$wx$h.png'
        #echo $directory
        break
    else
        break
    fi
done

# Para capturar
while [ True ]; do
    if [[ $1 = "--cursos" ]]; then
        if [[ $out = "Investigación" ]]; then
            # directory='/home/ian/2022-II/Investigacion_operativa/Capturas1/%F_%T_$wx$h.png'
            directory=/home/ian/2022-II/Investigacion_operativa/Capturas1/$(date +%F_%H%M%S)_$altura"x"$anchura.png
            sleep 0.2;
            shot
            notify-send --icon=$directory "Capturado"
        fi

        if [[ $out = "Algoritmos" ]]; then
            directory=/home/ian/2022-II/Algoritmos_y_estructuras_de_datos/Capturas1/$(date +%F_%H%M%S)_$altura"x"$anchura.png
            sleep 0.2;
            shot
            notify-send --icon=$directory "Capturado"
        fi

        if [[ $out = "AdministraciónTI" ]]; then
            directory=/home/ian/2022-II/Administracion_de_tecnologias_de_la_informacion/Capturas1/$(date +%F_%H%M%S)_$altura"x"$anchura.png
            sleep 0.2;
            shot
            notify-send --icon=$directory "Capturado"
        fi
        
        if [[ $out = "DiscretasII" ]]; then
            directory=/home/ian/2022-II/Matematicas_discretas_II/Capturas1/$(date +%F_%H%M%S)_$altura"x"$anchura.png
            sleep 0.2;
            shot
            notify-send --icon=$directory "Capturado"
        fi

        if [[ $out = "ProgramaciónII" ]]; then
            directory=/home/ian/2022-II/Programacion_II/Capturas1/$(date +%F_%H%M%S)_$altura"x"$anchura.png
            sleep 0.2;
            shot
            notify-send --icon=$directory "Capturado"
        fi

        if [[ $out = "Electrónica" ]]; then
            directory=/home/ian/2022-II/Electronica_y_diseño_digital/Capturas1/$(date +%F_%H%M%S)_$altura"x"$anchura.png
            sleep 0.2;
            shot
            notify-send --icon=$directory "Capturado"
        fi

        if [[ $out = "Música" ]]; then
            directory=/home/ian/2022-II/Musica/Capturas1/$(date +%F_%H%M%S)_$altura"x"$anchura.png
            sleep 0.2;
            shot
            notify-send --icon=$directory "Capturado"
        fi
        break
    else
        break
    fi
done

# Caputura el portapapeles
while [ True ]; do
    if [[ $1 = "--copiar" ]]; then
        sleep 0.2;
        # scrot --silent -fs "/tmp/%F_%T_$wx$h.png" -e 'xclip -selection clipboard -target image/png -i $f && notify-send --icon=$f "Copiado"'&&paplay --volume=71536 /usr/share/sounds/freedesktop/stereo/bell.oga
        directory=/tmp/$(date +%F_%H%M%S)_$altura"x"$anchura.png
        shot
        xclip -selection clipboard -target image/png -i $directory && notify-send --icon=$directory "Copiado" && mpv /home/ian/.config/polybar/scripts/screenshot/512135_11214653-lq.mp3 > /dev/null &
        #paplay --volume=71536 /usr/share/sounds/freedesktop/stereo/bell.oga
        break
    else
        break
    fi
done
while [ True ]; do
    if [[ $1 = "--screenshots-directory" ]]; then
        sleep 0.2;
        # scrot --silent -fs "/tmp/%F_%T_$wx$h.png" -e 'xclip -selection clipboard -target image/png -i $f && notify-send --icon=$f "Copiado"'&&paplay --volume=71536 /usr/share/sounds/freedesktop/stereo/bell.oga
        directory=/home/ian/Pictures/Screenshots/$(date +%F_%H%M%S)_$altura"x"$anchura.png
        shot
        notify-send --icon=$directory "Guardado" &&mpv 512135_11214653-lq.mp3#paplay --volume=71536 /usr/share/sounds/freedesktop/stereo/bell.oga
        break
    else
        break
    fi
done
# 
