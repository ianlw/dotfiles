#!/bin/bash 

# Clock of minutes and seconds
relog () { 
    lim_m=$(($1-1))
    for ((m=0; m<=lim_m; m++))
    do
    for ((s=0; s<=59; s++))
        do  
        clear
        echo
        if [[ $2 == "work" ]]; then
            #shellcheck disable=SC2086
            echo 🧠 $inter "|" ⏳ $m:$s 
        elif [[ $2 == "brak" ]]; then
            #shellcheck disable=SC2086
            echo 🧠 $inter "|" ⏳ $m:$s 💤 
        elif [[ $2 == "long-break" ]]; then
            #shellcheck disable=SC2086
            echo 🧠 $inter "|" ⏳ $m:$s 💤💤
        fi
        sleep 1
        done
    done
}

# Número de intervalo de trabajo
inter=0

# Starting the pomodoro infinite
while true
tput civis 
#Titles
echo "Pomodoro de 25, 5 y 15 "
sleep 1
echo GO!
sleep 0.5

do 
    # 4 rondas de trabajo de 25 y 3 rondas de descanzo de 5 minutos
    for i in {1..4}
    do
        #shellcheck disable=SC2004
        inter=$(($inter + 1))
        # tiempo de trabajo
        relog 25 work
        notify-send "Hora de descansar" && paplay --volume=71536 /usr/share/sounds/freedesktop/stereo/bell.oga
        clear

        # Tiempo de descanso
        if [[ $i != 4 ]]; then
            echo
            echo "Start 💤"
            sleep 2
            relog 5 brak
            clear
        else
            echo
            echo "Start 💤💤"
            notify-send "Descansaremos un tiempo largo" && paplay --volume=71536 /usr/share/sounds/freedesktop/stereo/bell.oga
            sleep 3
            relog 15 long-break
            clear
        fi
        echo "Continue 🧠"
        sleep 2
        notify-send "Continuar trabajando" && paplay --volume=71536 /usr/share/sounds/freedesktop/stereo/bell.oga
    done
 done
 tput cvvis
