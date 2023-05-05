#!/bin/bash

spotify=$(pacmd list-sink-inputs | tr '\n' '\r' | perl -pe 's/ *index: ([0-9]+).+?application\.process\.binary = "([^\r]+)"\r.+?(?=index:|$)/\2 : \1\r/g' | tr '\r' '\n' | awk '/spotify/{print $3}')

vlc=$(pacmd list-sink-inputs | tr '\n' '\r' | perl -pe 's/ *index: ([0-9]+).+?application\.process\.binary = "([^\r]+)"\r.+?(?=index:|$)/\2 : \1\r/g' | tr '\r' '\n' | awk '/vlc/{print $3}')

hardmonoid=$(pacmd list-sink-inputs | tr '\n' '\r' | perl -pe 's/ *index: ([0-9]+).+?application\.process\.binary = "([^\r]+)"\r.+?(?=index:|$)/\2 : \1\r/g' | tr '\r' '\n' | awk '/harmonoid/{print $3}')
step=5
pactl set-sink-input-volume $spotify -${step}% || pactl set-sink-input-volume $vlc -${step}% || pactl set-sink-input-volume $hardmonoid -${step}%
