#!/bin/bash
#wszstkie zmienne
obecna_data=$(date +"%Y.%m.%d %H:%M")
ram=$(free -h | awk 'NR==2 {print $2}')
dysk=$(df -h --output=source,used,avail)
host=$HOSTNAME
system=$(uname -o)


#raport koncowy

cat << TEKST > system_info.txt
Data raportu
$obecna_data

----------------

Całkowita ilosc pamieci RAM w systemie:
$ram

---------------------------------------

Wykorzystanie dysków:
$dysk

---------------------------------------

Nazwa hosta:
$host

---------------------------------------

Nazwa systemu operacyjnego:
$system

TEKST
