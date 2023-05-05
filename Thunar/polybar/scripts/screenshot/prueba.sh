#!/bin/sh
out=$(cat ./status.txt)
echo $out
echo
echo '***'
echo 'concatenar'

var=$(echo 'oooo'|echo $out|echo 'oooo')
$var
